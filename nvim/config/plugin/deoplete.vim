call minpac#add('Shougo/deoplete.nvim')
" call minpac#add('zchee/deoplete-clang')
" call minpac#add('zchee/deoplete-jedi')

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" deoplete-clang {{{
" ============================================================================
" install infos
" " 1. Make sure that no spaces are in install path
" " 2. install 32-bit clang
" let g:deoplete#sources#clang#libclang_path = expand('~').'\tools\installed\LLVM\bin\libclang.dll'
" let g:deoplete#sources#clang#clang_header = expand('~').'\tools\installed\LLVM\lib\clang'

" }}}
" deoplete-jedi {{{
" ============================================================================
" Set python path where jedi is installed. Deoplete-jedi uses first available
" Show docsting in preview window
" let g:deoplete#sources#jedi#show_docstring = 1
" }}}
