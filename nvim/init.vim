let s:is_win = has('win32') || has('win64')
let $vim_config_dir = stdpath('config') 
let $vim_data_dir = stdpath('data')

try
  packadd minpac
catch
  fun! InstallPlug() " Bootstrap plugin manager on new systems.
    exe '!git clone https://github.com/k-takata/minpac.git ' stdpath('config').'/pack/minpac/opt/minpac'
    " call minpac#update()
  endfun
endtry


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
source $vim_config_dir/config/plugin/coc.vim
source $vim_config_dir/config/plugin/fugitive.vim
source $vim_config_dir/config/plugin/fzf.vim
source $vim_config_dir/config/plugin/indentline.vim
source $vim_config_dir/config/plugin/nerdtree.vim
source $vim_config_dir/config/plugin/neoterm.vim
source $vim_config_dir/config/plugin/signify.vim
source $vim_config_dir/config/plugin/sneak.vim
source $vim_config_dir/config/plugin/startify.vim
source $vim_config_dir/config/plugin/tabular.vim
source $vim_config_dir/config/plugin/tagbar.vim
"source $vim_config_dir/config/plugin/ultisnips.vim

source $vim_config_dir/config/commands.vim
source $vim_config_dir/config/keys.vim
source $vim_config_dir/config/settings.vim

let s:local_vimrc = $vim_config_dir.'/local.vim'
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif


" ------------------------------------------------------------------
" --  Additional info's
" ------------------------------------------------------------------
" Vim info/commands {{{
" ------------------------------------------------------------------
" --  vim useful commands
" ------------------------------------------------------------------
" Yank all TODOs into register a
" :global/TODO/yank A
"
" exectue macro on multiple lines
" Execute the macro stored in register a on lines 5 through 10.
" :5,10norm! @a
" Execute the macro stored in register a on lines 5 through the end of the file.
" :5,$norm! @a
" Execute the macro stored in register a on all lines.
" :%norm! @a
" Execute the macro store in register a on all lines matching pattern.
" :g/pattern/norm! @a
" To execute the macro on visually selected lines, press V and the j or k until the desired region is selected. Then type :norm! @a and observe the that following input line is shown.
" :'<,'>norm! @a

" folding command {{{
 " zf#j creates a fold from the cursor down # lines.
 " zf/ string creates a fold from the cursor to string .
 " zj moves the cursor to the next fold.
 " zk moves the cursor to the previous fold.
 " za toggle a fold at the cursor.
 " zo opens a fold at the cursor.
 " zO opens all folds at the cursor.
 " zc closes a fold under cursor.
 " zm increases the foldlevel by one.
 " zM closes all open folds.
 " zr decreases the foldlevel by one.
 " zR decreases the foldlevel to zero -- all folds will be open.
 " zd deletes the fold at the cursor.
 " zE deletes all folds.
 " [z move to start of open fold.
 " ]z move to end of open fold.
"}}}
" spell file commands {{{
" ===================
" By default, Vim will load a spellfile from the location:
" ~/.vim/spell/LL.EEE.add
" Where LL is the language and EEE is the encoding of the file in the active window.
" For example, if you are editing a file whose encoding is UTF-8, with spelllang set
" to en_us then Vim will look for a spell file at ~/.vim/spell/en.utf-8.add
"
" zg        add word to spell list
" zw        remove word to spell list
" zug/zuw   revert command
"
" }}}
" }}}
" vim:foldmethod=marker:foldlevel=0
