@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM CONFIGURATION
REM ============================================================

REM ============================================================
REM CONFIGURATION ZIPS
REM ============================================================

set "BASE_URL=https://github.com/sylvainhabert-dev/ERR-coincoin/releases/latest/download"

set "ZIP1_URL=%BASE_URL%/ERR1.zip"
set "ZIP2_URL=%BASE_URL%/ERR2.zip"
set "ZIP3_URL=%BASE_URL%/ERR3.zip"

set "ZIP1_FILE=%TEMP%\ERR1.zip"
set "ZIP2_FILE=%TEMP%\ERR2.zip"
set "ZIP3_FILE=%TEMP%\ERR3.zip"

REM Nom repertoire ERR
set "ERR_PATH=ERR"

REM Chemin du BAT apres extraction
set "BAT_RELATIVE_PATH=%ERR_PATH%\2 - Launch ELDEN RING Reforged - Offline or Seamless (Windows).BAT"

REM Nom du raccourci
set "SHORTCUT_NAME=EldenRing Reforged"

REM ============================================================
REM FIN CONFIG
REM ============================================================

echo.
echo [^>] Detection du lecteur courant...

set CURRENT_DRIVE=%cd:~0,3%test_ERR\

echo     [OK] Lecteur courant : %CURRENT_DRIVE%

REM ─────────────────────────────────────────────────────────────
REM Backup ancien ZIP si deja present
REM ─────────────────────────────────────────────────────────────

set "BACKUP_FILE=%ZIP_FILE%.bak"

if exist "%ZIP_FILE%" (

    echo.
    echo [^>] Ancien ZIP detecte, creation du backup...

    copy /Y "%ZIP_FILE%" "%BACKUP_FILE%" >nul

    if errorlevel 1 (
        echo [ERREUR] Impossible de creer le backup
        exit /b 1
    )

    echo     [OK] Backup cree :
    echo     %BACKUP_FILE%

    del /F /Q "%ZIP_FILE%" >nul 2>&1
)

REM ─────────────────────────────────────────────────────────────
REM Backup ancien telechargement si deja present
REM ─────────────────────────────────────────────────────────────

set "ERR_COMPLETE_FILE=%CURRENT_DRIVE%%ERR_PATH%"
set "ERR_BACKUP=%CURRENT_DRIVE%ERR.bak"

if exist "%ERR_COMPLETE_FILE%" (

    echo.
    echo [^>] Ancien ERR detecte, renommage en backup...

    REM si un ancien backup existe deja, on le supprime
    if exist "%ERR_BACKUP%" (
        rmdir /s /q "%ERR_BACKUP%"
    )

    ren "%ERR_COMPLETE_FILE%" "ERR.bak"

    if errorlevel 1 (
        echo [ERREUR] Impossible de renommer le dossier
        exit /b 1
    )

    echo     [OK] Backup cree :
    echo     %ERR_BACKUP%
)

REM ─────────────────────────────────────────────────────────────
REM Téléchargement des archives
REM ─────────────────────────────────────────────────────────────

echo.
echo [^>] Telechargement des archives...

curl -L "%ZIP1_URL%" -o "%ZIP1_FILE%"
if errorlevel 1 (
    echo [ERREUR] Impossible de telecharger ERR1.zip
    exit /b 1
)

curl -L "%ZIP2_URL%" -o "%ZIP2_FILE%"
if errorlevel 1 (
    echo [ERREUR] Impossible de telecharger ERR2.zip
    exit /b 1
)

curl -L "%ZIP3_URL%" -o "%ZIP3_FILE%"
if errorlevel 1 (
    echo [ERREUR] Impossible de telecharger ERR3.zip
    exit /b 1
)

echo     [OK] Archives telechargees

REM ─────────────────────────────────────────────────────────────
REM Décompression
REM ─────────────────────────────────────────────────────────────

echo.
echo [^>] Decompression des archives...

mkdir "%ERR_COMPLETE_FILE%"

tar -xf "%ZIP1_FILE%" -C "%ERR_COMPLETE_FILE%"
if errorlevel 1 (
    echo [ERREUR] Echec decompression ERR1.zip
    exit /b 1
)

tar -xf "%ZIP2_FILE%" -C "%ERR_COMPLETE_FILE%"
if errorlevel 1 (
    echo [ERREUR] Echec decompression ERR2.zip
    exit /b 1
)

tar -xf "%ZIP3_FILE%" -C "%ERR_COMPLETE_FILE%"
if errorlevel 1 (
    echo [ERREUR] Echec decompression ERR3.zip
    exit /b 1
)

del "%ZIP1_FILE%" >nul 2>&1
del "%ZIP2_FILE%" >nul 2>&1
del "%ZIP3_FILE%" >nul 2>&1

echo     [OK] Decompression terminee

REM ─────────────────────────────────────────────────────────────
REM Vérification BAT
REM ─────────────────────────────────────────────────────────────

echo.
echo [^>] Recherche du fichier BAT...

set "BAT_FULL_PATH=%CURRENT_DRIVE%%BAT_RELATIVE_PATH%"

echo BAT_FULL_PATH=%BAT_FULL_PATH%

setlocal EnableDelayedExpansion

if not exist "!BAT_FULL_PATH!" (
    echo     [ERREUR] Fichier introuvable :
    echo     !BAT_FULL_PATH!
    exit /b 1
)

echo     [OK] Fichier trouve :
echo     %BAT_FULL_PATH%

REM ─────────────────────────────────────────────────────────────
REM Création raccourci Bureau
REM ─────────────────────────────────────────────────────────────

echo.
echo [^>] Creation du raccourci Bureau...

set SHORTCUT_PATH=%USERPROFILE%\Desktop\%SHORTCUT_NAME%.lnk

if exist "%SHORTCUT_PATH%" (
    del "%SHORTCUT_PATH%"
)

powershell -Command ^
"$WshShell = New-Object -comObject WScript.Shell; ^
$Shortcut = $WshShell.CreateShortcut('%SHORTCUT_PATH%'); ^
$Shortcut.TargetPath = '%BAT_FULL_PATH%'; ^
$Shortcut.WorkingDirectory = Split-Path '%ERR_COMPLETE_FILE%'; ^
$Shortcut.Description = '%SHORTCUT_NAME%'; ^
$Shortcut.WindowStyle = 1; ^
$Shortcut.Save()"

if errorlevel 1 (
    echo     [ERREUR] Impossible de creer le raccourci
    exit /b 1
)

echo     [OK] Raccourci cree :
echo     %SHORTCUT_PATH%

REM ─────────────────────────────────────────────────────────────
REM Résumé
REM ─────────────────────────────────────────────────────────────

echo.
echo ===============================================
echo  Deploiement termine avec succes !
echo ===============================================
echo  Archive decompressee dans : %ERR_COMPLETE_FILE%
echo  Raccourci Bureau          : %SHORTCUT_PATH%
echo ===============================================
echo.

pause