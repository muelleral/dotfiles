# Lazyvim

## Private Configuration
Optional private configuration is automatically loaded if corresponding files
are present. Supported files are `plugins.lua`, `options.lua`, `keymaps.lua`,
`autocmds.lua` and must be placed in `stdpath("config")/lua/private/`.

The private configuration is loaded last and will override settings defined in
this repository.

## Snippets
`luasnip` is configured to search for snippets in
- `stdpath("config")/snippets`
- `stdpath("config")/private_snippets`

Snippets contained in this repo will be symlinked to
`stdpath("config")/snippets`. Private snippets are optional and can be enabled
by creating another symlink to the private snippets definition.
