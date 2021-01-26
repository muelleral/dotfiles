call minpac#add('mhinz/vim-startify')

" Bookmarks are set in private.vim
let g:startify_session_dir = $vim_data_dir.'/session'
let g:startify_relative_path = 1

" commands executed befor saving
let g:startify_session_before_save = [
  \ 'echo "Cleaning up before saving.."',
  \ 'silent! NERDTreeTabsClose'
  \ ]

" quit startify session
nnoremap <Leader>qs :SClose<CR>

