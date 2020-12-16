let s:is_win = has('win32') || has('win64')

call plug#begin(stdpath('data').'/plugged')

Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-unimpaired'

" appearance
Plug 'rakr/vim-one'
Plug 'machakann/vim-highlightedyank'
Plug 'nelstrom/vim-visual-star-search'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
if s:is_win == 0
    Plug 'edkolev/tmuxline.vim'
endif

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" SCM
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', {'on': 'GV'}

"Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'kassio/neoterm'

Plug 'preservim/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'a-m-u/esm.nvim'
Plug 'wsdjeg/vim-fetch'

call plug#end()

" Main settings {{{
" ============================================================================
let $vim_dir = fnamemodify(resolve(expand('<sfile>')), ':p:h')

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
let mapleader=" "                  " set <space> to <leader>

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
let s:local_vimrc = $vim_dir.'/local.vim'
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif
" }}}
" ------------------------------------------------------------------
" --  Plugin config
" ------------------------------------------------------------------
"" CoC {{{
"" ============================================================================
"" if hidden is not set, TextEdit might fail.
"set hidden
"
"" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup
"
"" Better display for messages
"set cmdheight=2
"
"" You will have bad experience for diagnostic messages when it's default 4000.
"set updatetime=300
"
"" don't give |ins-completion-menu| messages.
"set shortmess+=c
"
"" always show signcolumns
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gc <Plug>(coc-declaration)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"" }}}
" airline {{{
" ============================================================================
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

let g:airline_mode_map = {
         \ '__' : '-',
         \ 'c'  : 'C',
         \ 'i'  : 'I',
         \ 'ic' : 'I',
         \ 'ix' : 'I',
         \ 'n'  : 'N',
         \ 'ni' : 'N',
         \ 'no' : 'N',
         \ 'R'  : 'R',
         \ 'Rv' : 'R',
         \ 's'  : 'S',
         \ 'S'  : 'S',
         \ '' : 'S',
         \ 't'  : 'T',
         \ 'v'  : 'V',
         \ 'V'  : 'V',
         \ '' : 'V',
         \ }
" }}}
" deoplete {{{
" ============================================================================
" let g:deoplete#enable_at_startup = 1
" deoplete-jedi {{{
" ============================================================================
" Set python path where jedi is installed. Deoplete-jedi uses first available
" Show docsting in preview window
" let g:deoplete#sources#jedi#show_docstring = 1
" }}}
" }}}
" FZF {{{
" ============================================================================
" Set the environment variable to use ag instead of find
" FZF_DEFAULT_COMMAND ag --hidden --ignore .git -g ""
set rtp+=~/tools/portable/fzf

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --reverse --inline-info'
endif

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <Leader>F      :Files<CR>
nnoremap <silent> <Leader>C      :Colors<CR>
nnoremap <silent> <Leader>B      :Buffers<CR>
nnoremap <silent> <Leader>L      :Lines<CR>
nnoremap <silent> <Leader>ag     :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG     :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag     y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`      :Marks<CR>
nnoremap <silent> <Leader>H      :Helptags<CR>

nmap <leader>.ag :e ~/.agignore<CR>
"}}}
" IndentLine {{{
" ============================================================================
nmap yol :set list!<CR> :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
" }}}
" NERDTree {{{
" ============================================================================

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=60

map <C-n> :NERDTreeToggle<CR>
map <A-n> :NERDTreeFind<CR>

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
" Startify {{{
" ============================================================================
" Bookmarks are set in private.vim
let g:startify_session_dir = $vim_dir.'/session'
let g:startify_relative_path = 1

" commands executed befor saving
let g:startify_session_before_save = [
  \ 'echo "Cleaning up before saving.."',
  \ 'silent! NERDTreeTabsClose'
  \ ]

" quit startify session
nnoremap <Leader>qs :SClose<CR>

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
