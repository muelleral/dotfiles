call minpac#add('tpope/vim-fugitive')

if has('autocmd')
   augroup numbertoggle
      autocmd BufReadPost fugitive://* set bufhidden=delete
   augroup END

endif

nmap <F5> :Git<CR>
