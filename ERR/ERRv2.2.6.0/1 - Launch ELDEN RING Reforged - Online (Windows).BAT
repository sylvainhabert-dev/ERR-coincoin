@ECHO OFF

if exist ".\internals\launcher\ReforgedLauncher.exe" GOTO launch
GOTO missing

:launch
.\internals\launcher\ReforgedLauncher.exe
GOTO end

:missing
echo Could not find the Reforged launcher executable file.
echo.
echo Make sure you have correctly unpacked the archive containing the mod files.
echo.
echo It might also be caused by a Windows antivirus false positive.
echo You can change the settings as follows:
echo.
echo - Find "Virus & threat protection" in your Start menu
echo - Go to "Virus & threat protection settings", then "Manage settings"
echo - Scroll down and visit "Add or remove exclusions"
echo - Select "Add an exclusion", then "Folder", then select the Reforged mod folder
echo - Extract the Reforged mod archive again to restore the deleted files
echo - Try launching the mod again.
echo.
echo If you're using a different antivirus software, please make sure to
echo exclude the Reforged mod folders in its settings, then extract
echo Reforged from its archive and try launching again.
echo.
pause

:end