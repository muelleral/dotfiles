
SET "installBatchPath=%~dp0"
set "hotkeyDotfile=autoHotKey\hotkeys.ahk"
SET "linkDest=%installBatchPath%%hotkeyDotfile%"

set "startupPath=\Microsoft\Windows\Start Menu\Programs\Startup\"
set "link=%APPDATA%%startupPath%hotkeys.ahk"

mklink "%link%" "%linkDest%"
