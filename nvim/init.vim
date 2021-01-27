let s:is_win = has('win32') || has('win64')
let $vim_config_dir = stdpath('config') 
let $vim_data_dir = stdpath('data')

packadd minpac
call minpac#init()
" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" plugins without configuration
call minpac#add('rakr/vim-one')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('nelstrom/vim-visual-star-search')
if s:is_win == 0
    call minpac#add('edkolev/tmuxline.vim')
endif

call minpac#add('junegunn/gv.vim')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')

" plugins with configuration
source $vim_config_dir/config/plugin/airline.vim
source $vim_config_dir/config/plugin/fugitive.vim
source $vim_config_dir/config/plugin/fzf.vim
source $vim_config_dir/config/plugin/indentline.vim
source $vim_config_dir/config/plugin/nerdtree.vim
source $vim_config_dir/config/plugin/neoterm.vim
source $vim_config_dir/config/plugin/signify.vim
source $vim_config_dir/config/plugin/sneak.vim
source $vim_config_dir/config/plugin/tabular.vim
source $vim_config_dir/config/plugin/tagbar.vim
"source $vim_config_dir/config/plugin/ultisnips.vim

if exists('g:vscode')
    source $vim_config_dir/config/plugin/vscode.vim
else
    source $vim_config_dir/config/plugin/coc.vim
endif

source $vim_config_dir/config/commands.vim
source $vim_config_dir/config/keys.vim
source $vim_config_dir/config/settings.vim

if exists('g:started_by_firenvim')
    source $vim_config_dir/config/plugin/firenvim.vim
else
    source $vim_config_dir/config/plugin/startify.vim
endif

let s:local_vimrc = $vim_config_dir.'/local.vim'
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif

" vim:foldmethod=marker:foldlevel=0
