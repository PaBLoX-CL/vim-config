setlocal spell spelllang=en_us
setlocal expandtab softtabstop=4 shiftwidth=4
setlocal textwidth=80
setlocal filetype=ghmarkdown

function! s:underline_with()
  call inputsave()
  let char = input('Underline with?: ')
  call inputrestore()
  execute "normal! :t.\<cr>Vr" . char
endfunction

" underline current line
command! Underline call s:underline_with()
nnoremap <LocalLeader>ul :Underline<CR>

" another _lightweight_ alternative that works without inputs
" nnoremap <LocalLeader>ul= :t.<CR>Vr=
" nnoremap <LocalLeader>ul- :t.<CR>Vr-
