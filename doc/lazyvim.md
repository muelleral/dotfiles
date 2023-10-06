# Lazyvim

## Private Configuration
Optional private configuration is automatically loaded if corresponding files
are present. Supported files are `plugins.lua`, `options.lua`, `keymaps.lua`,
`autocmds.lua` and must be placed in `stdpath("config")/lua/private/`.

The private configuration is loaded last and will override settings defined in
this repository.
