"call minpac#add('junegunn/fzf', { 'do': './install --bin' }')
call minpac#add('junegunn/fzf', { 'do': '!yes n | ./install --bin' })
call minpac#add('junegunn/fzf.vim')
"Plug 'junegunn/fzf', { 'do': './install --bin' }
"Plug 'junegunn/fzf.vim'
"
" Set the environment variable to use ag instead of find
" FZF_DEFAULT_COMMAND ag --hidden --ignore .git -g ""
"set rtp+=~/tools/portable/fzf

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
