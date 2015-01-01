" Idea taken from:
" https://github.com/bruno-/vim-alt-mappings

let characters = ['x']

function! s:enable_alt_map(char)
  execute "set <M-" . a:char . ">=\e" . a:char
endfunction

for char in characters
  call s:enable_alt_map(char)
endfor
