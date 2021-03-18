call minpac#add('SirVer/ultisnips')

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Search dirs for snippets. UltiSnips searches subdirectories in all runtimepath directories
let g:UltiSnipsSnippetDirectories=["UltiSnips", "own_snippets/local_vim_snippets"]
