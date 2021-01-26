call minpac#add('SirVer/ultisnips')


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

