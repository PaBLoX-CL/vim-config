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
  execute 'source' fnameescape(expand('~/.vim/rc' . a:path))
endfunction

" ii. Load external configuration before anything else {{{2
for fpath in split(globpath('~/.vim/before', '*.vim'), '\n')
  exe 'source' fpath
endfor

" for local changes that aren't supposed to go under version control
if filereadable(expand("~/.vim/before.vimrc"))
  source ~/.vim/before.vimrc
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

" ~~~ Interludio ~~~ {{{1
call neobundle#end()
call yankstack#setup()

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
" set t_Co=256                      "force 256 colors
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
endif

" 1.2. Whitespace {{{2

set autoindent
set backspace=indent,eol,start    "allow backspacing everything in insert mode
set expandtab                     "spaces instead of tabs — sorry tab lovers
set smarttab                      "use shiftwidth to enter tabs

set tabstop=2
set softtabstop=2
set shiftwidth=2

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
set undodir=~/.vim/.cache/undo

" backups
" set backup
" set backupdir=~/.vim/.cache/backup
set nobackup

" swap files
set directory=~/.vim/.cache/swap
set noswapfile

call EnsureExists('~/.vim/.cache')
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
" noremap <Leader><Space> :noh<cr>:call clearmatches()<CR>
" nnoremap <BS> :set hlsearch! hlsearch?<CR>

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



" 2. UI Configuration {{{1

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

" Fold magic {{{2
set foldenable
set foldmethod=syntax
set foldlevelstart=4
set foldnestmax=10
let g:xml_syntax_folding=1        "enable xml folding
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

" 3. Mappings {{{1

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

set pastetoggle=<F6>

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

" Command Line {{{2
" easy expansion of the active file directory
cnoremap <expr>%% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Chords {{{2
call arpeggio#load()
Arpeggio nnoremap lq :noh<CR>:call clearmatches()<CR>
Arpeggio nnoremap la :ls<CR>
Arpeggio inoremap jk <Esc>


" 4. Completion {{{1
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

" All the omnifuncs, yo {{{2
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" 5. Miscellaneous {{{1

" stupid shift keys fixes {{{2
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

" This is important if you use powerline, setting the $PYTHONPATH from the
" shell could led to really weird issues.
let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" El fin {{{1
NeoBundleCheck
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker foldlevel=0
