
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

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
