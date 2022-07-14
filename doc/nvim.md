# NVIM configuration
## Adding private configuration
Some part of the setup is private and shall not be part of this repo. Therefore some configuration hooks are available.

```
  lua/
   ┗╸private/
         ┣╸init.lua
         ┣╸plugins.lua
         ┗╸config/
              ┣╸plugin config 
              ┗╸....
```
### Private plugins
A lua module is requried to be available in private.plugins.lua and it must contain a `get_plugins()` fuction which 
returns a table with plugin configurations which can be used by packer. At the end of plugin installation/initialization
the hook will check if private plugin configuration is available and install it. 

### Private settings
The last NVIM configuration step is to check if private settings are available and load them. This can be used to 
add new private configuration/options/keymaps etc. or to override the settings done in this repo


## LSP config
Only the config is handled by 'nvim-lspconfig' plugin. The language server itself needs
to be installed manually. The install instructions can be found each language server repo. 
A list can be found [here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashlsh)
