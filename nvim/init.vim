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

call minpac#add('rakr/vim-one')


"call plug#begin($vim_data_dir.'/plugged')
"
"Plug 'SirVer/ultisnips'
"Plug 'mhinz/vim-startify'
"Plug 'tpope/vim-unimpaired'
"
"" appearance
"Plug 'rakr/vim-one'
"Plug 'nelstrom/vim-visual-star-search'
"Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"Plug 'Yggdroot/indentLine'
"if s:is_win == 0
"    Plug 'edkolev/tmuxline.vim'
"endif
"
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'justinmk/vim-sneak'
"
"" SCM
"Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-fugitive'
"Plug 'junegunn/gv.vim', {'on': 'GV'}
"
""Plug 'ludovicchabant/vim-gutentags'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-surround'
"Plug 'easymotion/vim-easymotion'
"Plug 'majutsushi/tagbar'
"Plug 'godlygeek/tabular'
"Plug 'kassio/neoterm'
"
"Plug 'preservim/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
"Plug 'junegunn/fzf', { 'do': './install --bin' }
"Plug 'junegunn/fzf.vim'
"
"Plug 'a-m-u/esm.nvim'
"Plug 'wsdjeg/vim-fetch'
"
"call plug#end()

" Main settings {{{
" ============================================================================
"let $vim_dir = fnamemodify(resolve(expand('<sfile>')), ':p:h')

filetype plugin indent on
syntax on

" set hybrid line numbers in active buffer. Change to absolute numbers in not active buffer
set number relativenumber
set laststatus=2

" colorscheme
colorscheme one
set background=dark " for the dark version

" fold settings
set foldenable
set foldmethod=syntax
set foldlevel=99
set foldclose=all
set modelines=1 " Tell vim to check the final line of the file for a modeline

" set system clipbord to default
set clipboard=unnamedplus

" enable live susbstitution
set inccommand=nosplit

set noerrorbells              "don't make noise
set hidden                    "allow hiding buffers with unsaved changes

set cursorline                " underline the current line in the file
set autoindent                " automatic indentation in non-C files
set smartindent
set cindent                   " recommended seting for automatic C-style indentation

set listchars=tab:>~,nbsp:_,trail:-,space:.,eol:$ " set chars for white spaces, tabs and others
set expandtab                 " spaces instead of tabs for better cross-editor compatibility

" shiftwidth = number of spaces to use in each autoindent step
" tabstop = number of spaces for a tab
set ts=4 sts=4 sw=4

if (has("termguicolors"))
   set termguicolors
endif

set textwidth=119 "textwidth used for reformatting lines with gq
set colorcolumn=120

"set background color for column 120
highlight ColorColumn ctermbg=magenta guibg=grey23
" }}}
" Autocmd {{{
" ============================================================================
if has('autocmd')
   autocmd VimEnter * source $MYVIMRC
   " toggles hybrid numbers when entering a buffer
   augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
      autocmd BufReadPost fugitive://* set bufhidden=delete
   augroup END

   " autoclose preview window after autocompletion is done
   autocmd CompleteDone * pclose!

   " enable title <session_name/open_file_name> and refresh it every time a buffer is entered
   set title
   augroup set_title
      autocmd!
      autocmd VimEnter,BufEnter,FocusGained * let &titlestring=fnamemodify(v:this_session, ':t') . '/' . expand('%:t')
   augroup END

   autocmd FileType c,cpp,yaml,make,yml setlocal ts=3 sts=3 sw=3 expandtab
   autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

   autocmd BufNewFile,BufRead,BufEnter *.mki setfiletype make
endif
" }}}
" Key Bindings {{{
" ============================================================================
let mapleader=","                  " set <space> to <leader>

" vimrc mappings
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Leader>V :tabe $MYVIMRC<CR>
nnoremap <Leader>so :so $MYVIMRC<CR>

" Terminal mode:
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>
tnoremap <A-h> <c-\><c-n><c-w>h
tnoremap <A-j> <c-\><c-n><c-w>j
tnoremap <A-k> <c-\><c-n><c-w>k
tnoremap <A-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <A-h> <Esc><c-w>h
inoremap <A-j> <Esc><c-w>j
inoremap <A-k> <Esc><c-w>k
inoremap <A-l> <Esc><c-w>l
" Visual mode:
vnoremap <A-h> <Esc><c-w>h
vnoremap <A-j> <Esc><c-w>j
vnoremap <A-k> <Esc><c-w>k
vnoremap <A-l> <Esc><c-w>l
" move the same way in wrapped lines as normaly
vnoremap j gj
vnoremap k gk

" Normal mode:
nnoremap <A-h> <c-w>h
nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
nnoremap <A-l> <c-w>l
" move the same way in wrapped lines as normaly
nnoremap j gj
nnoremap k gk

" new window splitting key bindings "
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>
nnoremap <Leader>t :tabnew<CR>

noremap <Leader>s "ayiw :%s/<C-r>a/
noremap <Leader>S "ayiW :%s/<C-r>a/
noremap <Leader>bs "ayiw :bufdo %s/<C-r>a/
noremap <Leader>bS "ayiW :bufdo %s/<C-r>a/
vmap <Leader>s "ay :%s/<C-r>a/
vmap <Leader>bs "ay :bufdo %s/<C-r>a/

noremap <Leader>a "ayiw :Ag <C-r>a<CR>
noremap <Leader>A "ayiW :Ag <C-r>a<CR>
vmap <Leader>a "ay :Ag <C-r>a<CR>

" buffer navigation
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" write file
map <C-s> :w<CR>
" quit buffer
map <C-x> :bp \| bd #<CR>

" remap only if popup manu is active
inoremap <C-j> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>C-j>"<CR>
inoremap <C-k> <C-R>=pumvisible() ? "\<lt>C-P>" : "\<lt>C-k>"<CR>

" switch between current and last buffer
nmap <leader>, <c-^>

nnoremap Y y$
noremap <2-LeftMouse> yiw

" copy current buffer path and file name into clipboard
nmap <leader>yp :let @+ = expand('%:p:h')<CR>
nmap <leader>yf :let @+ = expand('%:t')<CR>


"todo: win specific. do i need it for unix?
" windows specific shell commands
if has('win32') || has('win64')
   " ce is an alias for conemu
   nnoremap <Leader>cmd :silent !start cmd /C ce.bat<CR>
   " open expolorer for path pwd
   nnoremap <Leader>ex :silent !start cmd /C start .<CR>
endif
" }}}
" Commands {{{
" ============================================================================
" command! RemoveTrailingWhiteSpaces silent :%s/\s\+$//e

"" Remap for destroying trailing whitespace cleanly
command! RemoveTrailingWhiteSpaces silent :let _save_pos=getpos(".") <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>
" }}}
" Local vimrc {{{
" local vim modifications
let s:local_vimrc = $vim_config_dir.'/local.vim'
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif
" }}}
" ------------------------------------------------------------------
" --  Plugin config
" ------------------------------------------------------------------
source $vim_config_dir/plugin_config/airline.vim
source $vim_config_dir/plugin_config/coc.vim
source $vim_config_dir/plugin_config/fzf.vim
source $vim_config_dir/plugin_config/nerdtree.vim
source $vim_config_dir/plugin_config/sneak.vim
source $vim_config_dir/plugin_config/startify.vim

" IndentLine {{{
" ============================================================================
nmap yol :set list!<CR> :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
" }}}
" Neoterm {{{
" ============================================================================
nmap <F7> :botright Ttoggle<CR>
tnoremap <F7> <c-\><c-n>:botright Ttoggle<CR>
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_autojump = 1
" }}}
" Signify {{{
" ============================================================================
nnoremap <leader>gd :SignifyDiff!<cr>
nnoremap <leader>gp :SignifyHunkDiff<cr>
nnoremap <leader>gu :SignifyHunkUndo!<cr>

" }}}
" Tabular {{{
" ============================================================================
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>ac :Tabularize /\/\*\*<<CR>
"}}}
" Tagbar {{{
" ============================================================================
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" }}}
" UltiSnips {{{
" ============================================================================

" As example, if the current 'filetype' is cpp the
" :UltiSnipsEdit command looks for a file to edit in
" this order:
" 1. An existing
   " g:UltiSnipsSnippetsDir."/cpp.snippets" file
" 2. Find a matching cpp snippets file in
   " g:UltiSnipsSnippetDirectories
" 3. Create a new
   " g:UltiSnipsSnippetsDir."/cpp.snippets" file
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Search dir own_snippets and the other default ones
let g:UltiSnipsSnippetDirectories=["UltiSnips", "own_snippets"]

" todo ultisnipspath is not here. use stdpath()
" Path to private snippets directory
"let g:UltiSnipsSnippetsDir=$vim_dir.'/own_snippets'
" use :checkhealth to determine if there are problems with neovim

" }}}

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
