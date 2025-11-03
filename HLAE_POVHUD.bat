@echo off

rem EDIT THESE BELOW:
rem CS2Path=C:\...\Steam\...\game\csgo\
rem HLAEPath=C:\---\HLAE\HLAE.exe

set "CS2Path=<path to inside csgo folder>"
set "HLAEPath=<full hlae.exe path>"

CHOICE /M "Do you want to enter HLAE-mode?" /C YN
IF %ERRORLEVEL% EQU 1 GOTO YesAction
IF %ERRORLEVEL% EQU 2 GOTO NoAction

:YesAction
echo Attempting to rename gameinfo.gi to gameinfo_default.gi
ren "%CS2Path%gameinfo.gi" "gameinfo_default.gi"
echo Attempting to rename gameinfo_pov.gi to gameinfo.gi
ren "%CS2Path%gameinfo_pov.gi" "gameinfo.gi"
start "" "%HLAEPath%"
goto End

:NoAction
echo Attempting to rename gameinfo.gi to gameinfo_pov.gi
ren "%CS2Path%gameinfo.gi" "gameinfo_pov.gi"
echo Attempting to rename gameinfo_default.gi to gameinfo.gi
ren "%CS2Path%gameinfo_default.gi" "gameinfo.gi"
goto End

:End
echo Script finished.
pause
