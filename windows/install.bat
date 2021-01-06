@echo off
SETLOCAL
cls

:: Get path of running batch file
set "installBatchPath=%~dp0"

::Create symlink for autoHotKey
set "hotkeyDotfile=autoHotKey\hotkeys.ahk"
set "linkDest=%installBatchPath%%hotkeyDotfile%"
set "startupPath=\Microsoft\Windows\Start Menu\Programs\Startup\"
set "link=%APPDATA%%startupPath%hotkeys.ahk"
mklink "%link%" "%linkDest%"
::echo autoHotKey: "%link%" "%linkDest%"

::Create symlink for alacritty
mkdir %APPDATA%\alacritty
set "link=%APPDATA%\alacritty\alacritty.yml"
set "linkDest=%installBatchPath%alacritty\alacritty.yml"
mklink "%link%" "%linkDest%"
::echo alacritty: "%link%" "%linkDest%"

