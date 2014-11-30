" vimrc
" Author: Pablo Olmos de Aguilera C.

" 0. Bootstrap system {{{1
set nocompatible                  "anybody cares?

let mapleader="ñ"
let localmapleader="ñ"

let $CACHE = expand('~/.vim/.cache')

" i. Functions {{{2
function! EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction

function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

" ii. Load external configuration before anything else {{{2
for fpath in split(globpath('~/.vim/before', '*.vim'), '\n')
  exe 'source' fpath
endfor

" for local changes that aren't supposed to go under version control
if filereadable(expand("~/.vim/rc/before.vim"))
  call s:source_rc('before.vim')
endif

" iii. NeoBundle Configuration {{{2

" Necessary to configure neobundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('$CACHE/neobundle'))

if neobundle#has_cache()
  NeoBundleLoadCache
else
  call s:source_rc('neobundle.rc.vim')
  NeoBundleSaveCache
endif

NeoBundleCheck

" ~~~ Interludio ~~~ {{{1
call s:source_rc('alt_mappings.rc.vim')
call neobundle#end()

" 1. Base configuration {{{1
" 1.1 Basic options {{{2
filetype plugin indent on
syntax enable

set autoread
set display+=lastline
set encoding=utf-8
set hidden                        "allow buffer switch without saving
set history=1000
set matchpairs+=<:>
set mouse=a
set mousehide
set modeline
set modelines=5
set showcmd                       "display incomplete commands
set spellfile=~/.vim/spell/en.utf-8.add
set splitright
set splitbelow
set timeoutlen=800                "mapping timeout
set ttimeoutlen=70                "keycode timeout
set ttyfast                       "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash

" http://unix.stackexchange.com/a/34723/21088
" basically fixes use of ctrl and shift inside tmux
if &term =~ '^screen'
  " tmux will send xterm-style keys when xterm-keys is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
" https://unix.stackexchange.com/questions/58361/how-to-fix-the-shifted-function-keys-in-vim-in-xterm-in-gnome-terminal
elseif &term =~ 'termite$'
  execute "set <S-F1>=\e[1;2P"
  execute "set <S-F2>=\e[1;2Q"
  execute "set <S-F3>=\e[1;2R"
  execute "set <S-F4>=\e[1;2S"
endif

" 1.2. Whitespace {{{2

set autoindent
set smartindent
set backspace=indent,eol,start    "allow backspacing everything in insert mode
" set expandtab                     "spaces instead of tabs — sorry tab lovers
set smarttab                      "use shiftwidth to enter tabs

set tabstop=4
" set softtabstop=2
" set shiftwidth=2

set list                          "highlight whitespace
set listchars=tab:»·,extends:❯,precedes:❮,trail:␣,conceal:Δ
set showbreak=↪

" 1.3. Trailing whitespace {{{2
" Only shown when not in insert mode so I don't go insane.
augroup trailing
  au!
  au InsertEnter * :set listchars-=trail:␣
  au InsertLeave * :set listchars+=trail:␣
augroup END

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" If you want to remove trailing spaces when you want, so not automatically,
" see http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
autocmd BufWritePre * :%s/\s\+$//e

" 1.4. Vim file/folders {{{2

" trascendent undo
set undofile
set undolevels=3000
set undoreload=10000
let &undodir = expand('$CACHE/undo')

" backups
" set backup
" let &backupdir = expand('$CACHE/backup')

" swap files
let &directory = expand('$CACHE/swap')
set noswapfile

call EnsureExists('$CACHE')
call EnsureExists(&undodir)
" call EnsureExists(&backupdir)
call EnsureExists(&directory)

" 1.5. Searching {{{2
set hlsearch                      "highlight searches
set incsearch                     "incremental searching
set ignorecase                    "ignore case for searching
set smartcase                     "do case-sensitive if there's a capital letter
set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
set grepformat=%f:%l:%c:%m

" sane regexes
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v

" clear search matching
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Don't jump when using * for search
nnoremap * *<C-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" 2. Filetype {{{1

" All the omnifuncs, yo {{{2
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
if has('python3')
  autocmd FileType python setlocal omnifunc=python3complete#Complete
else
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:xml_syntax_folding=1        "enable xml folding

let g:markdown_fenced_languages = [
\ 'coffee',
\ 'css',
\ 'erb=eruby',
\ 'javascript',
\ 'js=javascript',
\ 'json=javascript',
\ 'ruby',
\ 'sass',
\ 'xml',
\ 'vim',
\ ]

" 3. UI Configuration {{{1

set colorcolumn=+3
" set conceallevel=1                "enable concealing by default
set formatoptions=qn1             "see 'fo-table' for more info
set lazyredraw
set laststatus=2                  "always show statusline
set matchtime=2                   "tens of a second to show the matching paren
set noshowmode
set number
set numberwidth=3
"set relativenumber
set ruler
set showmatch                     "briefly jump to the matching bracket when inserted
if exists('+breakindent')
  set breakindent
  set wrap
else
  set nowrap
endif
set viewdir=$CACHE/vim_view viewoptions-=options viewoptions+=slash,unix

" Fold magic {{{2
set foldenable
set foldmethod=syntax
set foldlevelstart=4
set foldnestmax=10
nnoremap zr zr:echo &foldlevel<cr>
nnoremap zm zm:echo &foldlevel<cr>
nnoremap zR zR:echo &foldlevel<cr>
nnoremap zM zM:echo &foldlevel<cr>

" Color {{{2
set background=dark
colorscheme jellybeans

" Cursorline {{{2
set cursorline

" Only show cursorline in the current window and in normal mode.
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END

" Navigation {{{2

set scrolljump=5 "minimum number of lines to scroll
set scrolloff=1

" Move cursor by display lines when wrapping
" NOTE: it seems that breaks the movement commands in conjunction with other
" commands
nnoremap <buffer> <silent> j gj
nnoremap <buffer> <silent> k gk
nnoremap <buffer> <silent> 0 g0
nnoremap <buffer> <silent> $ g$

vnoremap <buffer> <silent> j gj
vnoremap <buffer> <silent> k gk
vnoremap <buffer> <silent> 0 g0
vnoremap <buffer> <silent> $ g$

" 4. Mappings {{{1

" Function keys {{{2
" <F1> Startify
" <F2>
" <F3>
" <F4> GoldenView Autoresize
" <F5> Gundo Toggle
" <F6> Paste Toggle
" <F7>
" <F8> Tagbar Toggle
" <F9> Spellcheck Toggle
" <F10> Get syntax group information
" <F11>
" <F12>

if neobundle#tap('vim-startify') "{{{ <F1>
  nnoremap <F1> :Startify<cr>

  call neobundle#untap()
endif "}}}
if neobundle#tap('GoldenView.Vim') "{{{ <F4>
  let g:goldenview__enable_default_mapping=0
  nmap <silent> <F4> <Plug>GoldenViewSplit
  nmap <S-F4> <Plug>ToggleGoldenViewAutoResize

  call neobundle#untap()
endif "}}}
if neobundle#tap('gundo.vim') "{{{ <F5>
  nnoremap <silent> <F5> :GundoToggle<CR>

  call neobundle#untap()
endif "}}}

set pastetoggle=<F6>

if neobundle#tap('tagbar') "{{{ <F8>
  nnoremap <silent> <F8> :TagbarToggle<CR>

  call neobundle#untap()
endif "}}}

" toggle spell checking
map <F9> :setlocal invspell<CR>:set spell?<CR>

" Get syntax information
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Insert mode {{{2

" smash scape
inoremap jk <Esc>
inoremap kj <Esc>

" change cursor position
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap <C-u> <C-g>u<C-u>

" suggests word when spelling it's on
" https://stackoverflow.com/a/16481737/417527
inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u

" Visual mode {{{2

" Easier indenting
nnoremap <C-S-Left> <<
nnoremap <C-S-Right> >>
xnoremap <C-S-Left> <gv
xnoremap <C-S-Right> >gv

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" vim-unimpaired "{{{
" Bubble single lines
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv
"}}}

" Normal mode {{{2

" remap arrow keys (aka hard mode)
" nnoremap <Left> :bprev<CR>
" nnoremap <Right> :bnext<CR>
" nnoremap <Up>
" nnoremap <Down>

nnoremap <Leader>tag :Dispatch ctags -R<CR>

" yank and put to/from the OS's clipboard
vnoremap <Leader>yo "+y
nnoremap <Leader>po "+p

" make Y consistent with C and D. See :help Y
nnoremap Y y$

" window shortcuts
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Quick horizontal/vertical splits
nnoremap <Leader><Bar> :vsp<CR>
nnoremap <Leader>- :sp<CR>

" Command Line {{{2
" easy expansion of the active file directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <Leader>ew :edit %%
nmap <Leader>es :split %%
nmap <Leader>ev :vsplit %%

" when I forget to use sudoedit
cnoremap w!! w !sudo tee % >/dev/null

" Chords {{{2
if neobundle#tap('vim-arpeggio')
  call arpeggio#load()
  Arpeggio nnoremap la :ls<CR>
  Arpeggio inoremap jk <Esc>

  call neobundle#untap()
endif

" Plugins {{{2

if neobundle#tap('vim-fugitive') "{{{
  nnoremap <silent> <Leader>gs :Gstatus<CR>
  nnoremap <silent> <Leader>gd :Gdiff<CR>
  nnoremap <silent> <Leader>gc :Gcommit<CR>
  nnoremap <silent> <Leader>gb :Gblame<CR>
  nnoremap <silent> <Leader>gl :Glog<CR>
  nnoremap <silent> <Leader>gp :Git push<CR>
  nnoremap <silent> <Leader>gw :Gwrite<CR>
  nnoremap <silent> <Leader>gr :Gremove<CR>
  autocmd BufReadPost fugitive://* set bufhidden=delete
  call neobundle#untap()
endif "}}}
if neobundle#tap('tabular') "{{{
  nmap <Leader>a& :Tabularize /&<CR>
  vmap <Leader>a& :Tabularize /&<CR>
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>a:: :Tabularize /:\zs<CR>
  vmap <Leader>a:: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a, :Tabularize /,<CR>
  nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

  call neobundle#untap()
endif "}}}
if neobundle#tap('EasyGrep') "{{{
  nnoremap <leader>vo :GrepOptions<cr>

  call neobundle#untap()
endif "}}}
if neobundle#tap('ctrlp.vim') "{{{
  nmap , [ctrlp]
  nnoremap [ctrlp] <Nop>

  nnoremap [ctrlp]t :CtrlPBufTag<CR>
  nnoremap [ctrlp]T :CtrlPTag<CR>
  nnoremap [ctrlp]l :CtrlPLine<CR>
  nnoremap [ctrlp]o :CtrlPFunky<CR>
  nnoremap [ctrlp]b :CtrlPBuffer<CR>

  call neobundle#untap()
endif "}}}
if neobundle#tap('vim-jsbeautify') "{{{
  nnoremap <Leader>fjs :call JsBeautify()<CR>

  call neobundle#untap()
endif "}}}
if neobundle#tap('vimshell.vim') "{{{
  nnoremap <Leader>c  :VimShell -split<CR>
  nnoremap <Leader>cc :VimShell -split<CR>
  nnoremap <Leader>cn :VimShellInteractive node<CR>
  nnoremap <Leader>cl :VimShellInteractive lua<CR>
  nnoremap <Leader>cr :VimShellInteractive irb<CR>
  nnoremap <Leader>cp :VimShellInteractive python<CR>

  call neobundle#untap()
endif "}}}
if neobundle#tap('vimux') "{{{
  map <Leader>rp :VimuxPromptCommand<CR>
  map <Leader>rl :VimuxRunLastCommand<CR>

  "map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>

  call neobundle#untap()
endif "}}}
if neobundle#tap('vim-vinegar') "{{{
  nmap _ <Plug>VinegarUp

  call neobundle#untap()
endif "}}}
if neobundle#tap('vim-expand-region') "{{{
  vmap v     <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)

  call neobundle#untap()
endif "}}}
if neobundle#tap('auto-pairs') "{{{
  let g:AutoPairsShortcutToggle = "<M-a>"

  call neobundle#untap()
endif "}}}
" 5. Completion {{{1
set completeopt=longest,menuone,preview
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set wildignore+=.git,.hg,.svn
set wildignore+=*.,*.a,*.class,*.mo,*.la,*.so,*.obj,*.out
set wildignore+=*.jpg,*.png,*.xpm,*.gif
set wildignore+=.DS_Store,tmp,*.swp,*.scssc
set wildignore+=log/
set wildignore+=vendor/,node_modules/

" 6. Plugins {{{1

if neobundle#tap('gist-vim') "{{{
  let g:gist_post_private=1
  let g:gist_show_privates=1

  call neobundle#untap()
endif "}}}
if neobundle#tap('syntastic') "{{{
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_warning_symbol = '∆'
  let g:syntastic_style_warning_symbol = '≈'

  call neobundle#untap()
endif "}}}
if neobundle#tap('neocomplete.vim') "{{{
  let g:neocomplete#enable_at_startup=1
  let g:neocomplete#data_directory= expand('$CACHE/neocomplete')

  call neobundle#untap()
endif "}}}
if neobundle#tap('neosnippet.vim') "{{{
  let g:neosnippet#snippets_directory='~/.vim/snippets'

  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-n>" : "\<TAB>")
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
  smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""

  call neobundle#untap()
endif "}}}
if neobundle#tap('vim-yankstack') "{{{
  let g:yankstack_yank_keys = [ 'c', 'C', 'd', 'D', 'x', 'X', 'y', 'Y' ]
  call yankstack#setup()

  call neobundle#untap()
endif "}}}
if neobundle#tap('EasyGrep') "{{{
  let g:EasyGrepRecursive=1
  let g:EasyGrepAllOptionsInExplorer=1
  let g:EasyGrepCommand=1

  call neobundle#untap()
endif "}}}
if neobundle#tap('ctrlp.vim') "{{{
  " let g:ctrlp_clear_cache_on_exit=1
  let g:ctrlp_max_height=40
  let g:ctrlp_show_hidden=0
  let g:ctrlp_follow_symlinks=1
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_max_files=20000
  let g:ctrlp_use_caching=0
  let g:ctrlp_reuse_window='startify'
  let g:ctrlp_extensions=['funky']
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

  " this only applies when ctrlp_user_command is **not** defined
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.so$\|\.pyc$\|\.gem$'
  \ }

  call neobundle#untap()
endif "}}}
if neobundle#tap('ack.vim') "{{{
  let g:ackprg = 'ag --nogroup --column --smart-case --follow'

  call neobundle#untap()
endif "}}}
if neobundle#tap('vim-indent-guides') "{{{
  let g:indent_guides_start_level=1
  let g:indent_guides_guide_size=1
  let g:indent_guides_enable_on_vim_startup=0
  let g:indent_guides_color_change_percent=3
  if !has('gui_running')
    let g:indent_guides_auto_colors=0
    function! s:indent_set_console_colors()
      hi IndentGuidesOdd ctermbg=235
      hi IndentGuidesEven ctermbg=236
    endfunction
    autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
  endif

  call neobundle#untap()
endif "}}}
if neobundle#tap('vimshell.vim') "{{{
  let g:vimshell_editor_command='vim'
  let g:vimshell_right_prompt='getcwd()'
  let g:vimshell_data_directory=expand('$CACHE/vimshell')
  let g:vimshell_vimshrc_path='~/.vim/vimshrc'

  call neobundle#untap()
endif "}}}
if neobundle#tap('vim-startify') "{{{
  let g:startify_session_dir = expand('$CACHE/sessions')
  let g:startify_change_to_vcs_root = 1
  let g:startify_show_sessions = 1

  call neobundle#untap()
endif "}}}
if neobundle#tap('unite.vim') "{{{

  let bundle = neobundle#get('unite.vim')
  function! bundle.hooks.on_source(bundle)
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#custom#source('line,outline', 'matchers', 'matcher_fuzzy')
    call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1,
      \ 'direction': 'botright',
      \ 'prompt': '» ',
      \ })
  endfunction

  let g:unite_data_directory=expand('$CACHE/unite')
  let g:unite_source_history_yank_enable=1
  let g:unite_source_rec_max_cache_files=5000
  let g:unite_source_rec_async_command='ag --follow --nocolor --nogroup --hidden -g ""'

  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''

  function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
  endfunction
  autocmd FileType unite call s:unite_settings()

  nmap - [unite]
  nnoremap [unite] <Nop>

  nnoremap <silent> [unite]<Space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<CR><C-u>
  nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<CR><C-u>

  nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<CR>
  nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
  nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<CR>
  nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<CR>
  nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<CR>
  nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<CR>
  nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<CR>

  " unite plugins

  nnoremap <silent> [unite]c :<C-u>Unite -winheight=10 -auto-preview -buffer-name=colorschemes colorscheme<CR>
  nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<CR>

  nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<CR>
  nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<CR>

  let g:junkfile#directory=expand('$CACHE/junk')
  nnoremap <silent> [unite]j :<C-u>Unite -auto-resize -buffer-name=junk junkfile junkfile/new<CR>

  call neobundle#untap()
endif "}}}
" 7. Miscellaneous {{{1

" stupid shift keys fixes " {{{
" stolen from spf13
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
" }}}

" This is important if you use powerline, setting the $PYTHONPATH from the
" shell could led to really weird issues.
let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" 8. GUI Settings {{{1

if has('gui_running')
  set guioptions-=T         " Remove the toolbar
  set guioptions-=m         " No menu
  set guioptions-=rL        " No scrollbars
  set lines=40                " 40 lines of text instead of 24
  set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 9
endif

" El fin {{{1

" for local changes that aren't supposed to go under version control
if filereadable(expand("~/.vim/rc/after.vim"))
  call s:source_rc('after.vim')
endif

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker foldlevel=0
