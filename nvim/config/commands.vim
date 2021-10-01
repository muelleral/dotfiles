
if has('autocmd')
   autocmd VimEnter * source $MYVIMRC
   " toggles hybrid numbers when entering a buffer
   augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
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
   autocmd BufNewFile,BufRead,BufEnter Jenkinsfile setfiletype groovy
endif


"" Remap for destroying trailing whitespace cleanly
command! RemoveTrailingWhiteSpaces silent :let _save_pos=getpos(".") <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>
