@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM CONFIGURATION
REM ============================================================

REM URL du ZIP
set "ZIP_URL=https://github.com/sylvainhabert-dev/ERR-coincoin/releases/latest/download/ERR.zip"

REM fichier ZIP temporaire
set "ZIP_FILE=%TEMP%\ERR.zip"

REM Nom repertoire ERR
set "ERR_PATH=ERR"

REM Chemin du BAT apres extraction
set BAT_RELATIVE_PATH=%ERR_PATH%\2 - Launch ELDEN RING Reforged - Offline or Seamless (Windows).BAT

REM Nom du raccourci
set SHORTCUT_NAME=EldenRing Reforged

REM ============================================================
REM FIN CONFIG
REM ============================================================

echo.
echo [^>] Detection du lecteur courant...

set CURRENT_DRIVE=%cd:~0,3%

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
REM Téléchargement
REM ─────────────────────────────────────────────────────────────

echo.
echo [^>] Telechargement de l'archive...

curl -L "%ZIP_URL%" -o "%ZIP_FILE%"

if errorlevel 1 (
    echo     [ERREUR] Impossible de telecharger l'archive
    exit /b 1
)

if not exist "%ZIP_FILE%" (
    echo [ERREUR] ZIP non telecharge
    exit /b 1
)

for %%A in ("%ZIP_FILE%") do set SIZE=%%~zA

echo Taille archive : %SIZE% bytes

if %SIZE% LSS 100000 (
    echo [ERREUR] Archive invalide ou incomplete
    exit /b 1
)

echo     [OK] Archive telechargee : %ZIP_FILE%

REM ─────────────────────────────────────────────────────────────
REM Décompression
REM ─────────────────────────────────────────────────────────────

echo.
echo [^>] Decompression vers %CURRENT_DRIVE%

tar -xf "%ZIP_FILE%" -C "%CURRENT_DRIVE%"

if errorlevel 1 (
    echo     [ERREUR] Echec de la decompression
    exit /b 1
)

del "%ZIP_FILE%" >nul 2>&1

echo     [OK] Decompression terminee

REM ─────────────────────────────────────────────────────────────
REM Vérification BAT
REM ─────────────────────────────────────────────────────────────

echo.
echo [^>] Recherche du fichier BAT...

set BAT_FULL_PATH=%CURRENT_DRIVE%%BAT_RELATIVE_PATH%

if not exist "%BAT_FULL_PATH%" (
    echo     [ERREUR] Fichier introuvable :
    echo     %BAT_FULL_PATH%
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

powershell -Command ^
"$WshShell = New-Object -comObject WScript.Shell; ^
$Shortcut = $WshShell.CreateShortcut('%SHORTCUT_PATH%'); ^
$Shortcut.TargetPath = '%BAT_FULL_PATH%'; ^
$Shortcut.WorkingDirectory = Split-Path '%BAT_FULL_PATH%'; ^
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
echo  Archive decompressee dans : %CURRENT_DRIVE%
echo  Raccourci Bureau          : %SHORTCUT_PATH%
echo ===============================================
echo.

pause