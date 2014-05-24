" vimrc
" Author: Pablo Olmos de Aguilera C.

" i. Bootstrap system {{{1
set nocompatible "anybody cares?

nnoremap <Space> <Nop>
let mapleader=" "
let localmapleader=" "

" i. Load external configuration before anything else {{{2
if filereadable(expand("~/.vim/before.vimrc"))
  source ~/.vim/before.vimrc
endif

" ii. NeoBundle Configuration {{{2

" Necessary to configure neobundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', { 'build' : { 'unix' : 'make -f make_unix.mak' } }

" 1. Packages {{{1

" _ General {{{
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired' "{{{
  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
"}}}
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'pbrisbin/vim-mkdir'
NeoBundle 'pbrisbin/vim-restore-cursor'
NeoBundle 'pbrisbin/vim-rename-file'

" _}}}

" _ Colorschemes {{{

NeoBundle 'ScrollColors'
"NeoBundle 'godlygeek/csapprox'

" __ Both dark and light {{{
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'altercation/vim-colors-solarized' "{{{
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  "}}}
" }}}

" __ Dark {{{
NeoBundle 'sjl/badwolf'
NeoBundle 'tomasr/molokai'
NeoBundle 'zaiste/Atom'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Elive/vim-colorscheme-elive'
NeoBundle 'zeis/vim-kolor'
NeoBundle 'twilight256.vim'
NeoBundle 'Wombat'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'dsolstad/vim-wombat256i'
NeoBundle 'wgibbs/vim-irblack'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'xoria256.vim'
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'twilight'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'candycode.vim'
NeoBundle 'candy.vim'
NeoBundle 'candyman.vim'
NeoBundle 'wgibbs/vim-irblack'
NeoBundle 'herald.vim'
NeoBundle 'sexy-railscasts'
NeoBundle 'Railscasts-Theme-GUIand256color'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'trapd00r/neverland-vim-theme'

" doesn't work in terminal vim
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'Guardian'

" seems to work with csa_snapshot
NeoBundle 'tir_black'

" doesn't work in gVim
NeoBundle 'wombat256.vim'
" __}}}

" __ Light {{{
NeoBundle 'github-theme'
" __ }}}
" }}}

" _ Development {{{
NeoBundle 'kana/vim-textobj-user'
NeoBundleLazy 'mattn/gist-vim', { 'depends': 'mattn/webapi-vim', 'autoload': { 'commands': 'Gist' } } "{{{
  let g:gist_post_private=1
  let g:gist_show_privates=1
  "}}}
NeoBundle 'tpope/vim-fugitive' "{{{
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gr :Gremove<CR>
  autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
  autocmd BufReadPost fugitive://* set bufhidden=delete
  "}}}
NeoBundle 'gregsexton/gitv', { 'depends': 'tpope/vim-fugitive', 'autoload': {'commands': 'Gitv'}}
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/syntastic' "{{{
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_warning_symbol = '∆'
  let g:syntastic_style_warning_symbol = '≈'
  "}}}
NeoBundle 'airblade/vim-gitgutter'
NeoBundleLazy 'sjl/gundo.vim', {'autoload':{'commands':'GundoToggle'}} "{{{
  nnoremap <silent> <F5> :GundoToggle<CR>
  "}}}
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim' "{{{
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets'
  let g:neosnippet#enable_snipmate_compatibility=1

  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-n>" : "\<TAB>")
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
  smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
"}}}
NeoBundleLazy 'Shougo/neocomplete.vim', {'autoload':{'insert':1}, 'vim_version':'7.3.885'} "{{{
  let g:neocomplete#enable_at_startup=1
  let g:neocomplete#data_directory='~/.vim/.cache/neocomplete'
  "}}}
" NeoBundle 'Valloric/YouCompleteMe', {'vim_version':'7.3.584'} "{{{
"   let g:ycm_complete_in_comments_and_strings=1
"   let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"   let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
"   let g:ycm_filetype_blacklist={'unite': 1}
"   "}}}
" NeoBundle 'SirVer/ultisnips' "{{{
"   let g:UltiSnipsExpandTrigger="<tab>"
"   let g:UltiSnipsJumpForwardTrigger="<tab>"
"   let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"   let g:UltiSnipsSnippetsDir='~/.vim/snippets'
" "}}}

" __ Ruby {{{
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rails'
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'skwp/vim-rspec', {'autoload':{'filetypes':['ruby']}}
" __}}}

" __ Web {{{
" NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache']}} "{{{
"   function! s:zen_html_tab()
"     let line = getline('.')
"     if match(line, '<.*>') < 0
"       return "\<c-y>,"
"     endif
"     return "\<c-y>n"
"   endfunction
"   autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><tab> <c-y>,
"   autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()
"   "}}}
NeoBundleLazy 'marijnh/tern_for_vim', {
  \ 'autoload': { 'filetypes': ['javascript'] },
  \ 'build': {
    \ 'unix': 'npm install'
  \ },
\}

" __}}}

" _}}}

" _ Editing {{{
NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'}} " {{{
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
  " }}}
NeoBundle 'bufkill.vim'
NeoBundle 'maxbrunsfeld/vim-yankstack' "{{{
  call yankstack#setup()
  "}}}
NeoBundle 'vim-scripts/YankRing.vim' "{{{
  let g:yankring_replace_n_pkey = '<leader>['
  let g:yankring_replace_n_nkey = '<leader>]'
  let g:yankring_history_dir = '~/.vim/.cache/yankring'
  "}}}

" }}}

" _ Navigation {{{
NeoBundleLazy 'EasyGrep', {'autoload':{'commands':'GrepOptions'}} "{{{
      let g:EasyGrepRecursive=1
      let g:EasyGrepAllOptionsInExplorer=1
      let g:EasyGrepCommand=1
      nnoremap <leader>vo :GrepOptions<cr>
  "}}}
NeoBundle 'justinmk/vim-sneak' "{{{
  let g:sneak#streak = 1
  nmap s <Plug>Sneak_s
  nmap S <Plug>Sneak_S
  xmap s <Plug>Sneak_s
  xmap S <Plug>Sneak_S
  "}}}
NeoBundle 'kien/ctrlp.vim', { 'depends': 'tacahiroy/ctrlp-funky' } "{{{
  let g:ctrlp_clear_cache_on_exit=1
  let g:ctrlp_max_height=40
  let g:ctrlp_show_hidden=0
  let g:ctrlp_follow_symlinks=1
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_max_files=20000
  let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
  let g:ctrlp_reuse_window='startify'
  let g:ctrlp_extensions=['funky']
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

  let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.so$\|\.pyc$\|\.gem$'
  \ }

  nmap \ [ctrlp]
  nnoremap [ctrlp] <nop>

  nnoremap [ctrlp]t :CtrlPBufTag<cr>
  nnoremap [ctrlp]T :CtrlPTag<cr>
  nnoremap [ctrlp]l :CtrlPLine<cr>
  nnoremap [ctrlp]o :CtrlPFunky<cr>
  nnoremap [ctrlp]b :CtrlPBuffer<cr>
  "}}}
NeoBundle 'mileszs/ack.vim' "{{{
  let g:ackprg = "ag --nogroup --column --smart-case --follow"
  "}}}
" NeoBundleLazy 'scrooloose/nerdtree', {'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}} "{{{
"   let NERDTreeShowHidden=1
"   let NERDTreeQuitOnOpen=0
"   let NERDTreeShowLineNumbers=1
"   let NERDTreeChDirMode=0
"   let NERDTreeShowBookmarks=1
"   let NERDTreeIgnore=['\.git','\.hg']
"   let NERDTreeBookmarksFile='~/.vim/.cache/NERDTreeBookmarks'
"   nnoremap <F2> :NERDTreeToggle<CR>
"   nnoremap <F3> :NERDTreeFind<CR>
"   "}}}
NeoBundle 'tpope/vim-vinegar'

" _ Filetypes {{{
NeoBundleLazy 'tpope/vim-git', {'autoload':{'filetypes':['git','gitcommit','gitconfig','gitrebase','gitsendemail']}}
NeoBundleLazy 'Keithbsmiley/rspec.vim', {'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'tpope/vim-cucumber', {'autoload':{'filetypes':['cucumber']}}
NeoBundleLazy 'zaiste/tmux.vim', {'autoload':{'filetypes':['tmux']}}
NeoBundleLazy 'travitch/hasksyn', {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'Twinside/vim-syntax-haskell-cabal', {'autoload':{'filetypes':['haskell,cabal']}}

" Javascript
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
" NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundleLazy 'elzr/vim-json', {'autoload':{'filetypes':['javascript','json']}}
" NeoBundle 'leshill/vim-json'

" Html/CSS
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'slim-template/vim-slim', {'autoload':{'filetypes':['slim']}}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'tpope/vim-haml', {'autoload':{'filetypes':['haml']}}
NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['stylus']}}

"}}}

" _ Unite {{{
NeoBundle 'Shougo/unite.vim' "{{{
  let bundle = neobundle#get('unite.vim')
  function! bundle.hooks.on_source(bundle)
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#set_profile('files', 'smartcase', 1)
    call unite#custom#source('line,outline','matchers','matcher_fuzzy')
  endfunction

  let g:unite_data_directory='~/.vim/.cache/unite'
  let g:unite_enable_start_insert=1
  let g:unite_source_history_yank_enable=1
  let g:unite_source_rec_max_cache_files=5000
  let g:unite_prompt='» '

  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''

  function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
  endfunction
  autocmd FileType unite call s:unite_settings()

  nmap , [unite]
  nnoremap [unite] <nop>

  nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<CR><C-u>
  nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<CR><C-u>

  nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<CR>
  nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
  nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<CR>
  nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<CR>
  nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<CR>
  nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<CR>
  nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<CR>
  "}}}
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':'colorscheme'}} "{{{
  nnoremap <silent> [unite]c :<C-u>Unite -winheight=10 -auto-preview -buffer-name=colorschemes colorscheme<cr>
  "}}}
NeoBundleLazy 'tsukkee/unite-tag', {'autoload':{'unite_sources':['tag','tag/file']}} "{{{
  nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
  "}}}
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}} "{{{
  nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
  "}}}
NeoBundleLazy 'Shougo/unite-help', {'autoload':{'unite_sources':'help'}} "{{{
  nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>
  "}}}
NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen','unite_sources':['junkfile','junkfile/new']}} "{{{
  let g:junkfile#directory=expand("~/.vim/.cache/junk")
  nnoremap <silent> [unite]j :<C-u>Unite -auto-resize -buffer-name=junk junkfile junkfile/new<cr>
  "}}}
NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources':'file_mru'}}

" _ }}}

" _ UI {{{
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides' "{{{
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
  "}}}
NeoBundleLazy 'zhaocai/GoldenView.Vim', {'autoload':{'mappings':['<Plug>ToggleGoldenViewAutoResize']}} "{{{
  let g:goldenview__enable_default_mapping=0
  nmap <F4> <Plug>ToggleGoldenViewAutoResize
"}}}
" _}}}

" _ Misc {{{
NeoBundleLazy 'Shougo/vimshell.vim', {'autoload':{'commands':[ 'VimShell', 'VimShellInteractive' ]}} "{{{
  let g:vimshell_editor_command='vim'
  let g:vimshell_right_prompt='getcwd()'
  let g:vimshell_data_directory='~/.vim/.cache/vimshell'
  let g:vimshell_vimshrc_path='~/.vim/vimshrc'

  nnoremap <leader>c :VimShell -split<cr>
  nnoremap <leader>cc :VimShell -split<cr>
  nnoremap <leader>cn :VimShellInteractive node<cr>
  nnoremap <leader>cl :VimShellInteractive lua<cr>
  nnoremap <leader>cr :VimShellInteractive irb<cr>
  nnoremap <leader>cp :VimShellInteractive python<cr>
  "}}}
NeoBundleLazy 'tpope/vim-scriptease', {'autoload':{'filetypes':['vim']}}
NeoBundle 'mhinz/vim-startify' "{{{
  let g:startify_session_dir = '~/.vim/.cache/sessions'
  let g:startify_change_to_vcs_root = 1
  let g:startify_show_sessions = 1
  nnoremap <F1> :Startify<cr>
"}}}
NeoBundle 'benmills/vimux' "{{{
  map <Leader>rp :VimuxPromptCommand<CR>
  map <Leader>rl :VimuxRunLastCommand<CR>

  "map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>
  "}}}

" _}}}

" }}}

call neobundle#end()

" 2. Base configuration {{{

filetype plugin indent on
syntax enable

" set t_Co=256
set autoread

set timeoutlen=500 "mapping timeout
set ttimeoutlen=50 "keycode timeout

set matchpairs+=<:>

set mouse=a
set mousehide

set history=1000

set ttyfast "assume fast terminal connection
set encoding=utf-8

set viewoptions=folds,options,cursor,unix,slash
set modeline
set modelines=5

set hidden " allow buffer switch without saving

set showcmd "display incomplete commands

" __ Whitespace {{{

set autoindent
set backspace=indent,eol,start "allow backspacing everything in insert mode
set expandtab "spaces instead of tabs — sorry tab lovers
set smarttab "use shiftwidth to enter tabs

set tabstop=2
set softtabstop=2
set shiftwidth=2

set list "highlight whitespace
set listchars=tab:»·,extends:❯,precedes:❮,trail:␣,conceal:Δ
set showbreak=↪

" ____ Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
  au!
  au InsertEnter * :set listchars-=trail:␣
  au InsertLeave * :set listchars+=trail:␣
augroup END

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" If you want to remove trailing spaces when you want, so not automatically,
" see
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
autocmd BufWritePre * :%s/\s\+$//e

" ____ }}}
" __ }}}

" __ Vim file/folders {{{

" trascendent undo
set undofile
set undolevels=3000
set undoreload=10000
set undodir=~/.vim/.cache/undo

" backups
set backup
set backupdir=~/.vim/.cache/backup

" swap files
set directory=~/.vim/.cache/swap
set noswapfile

" __ }}}

" __ Searching {{{
set hlsearch                                        "highlight searches
set incsearch                                       "incremental searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter
" set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
set grepformat=%f:%l:%c:%m

" sane regexes
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v

" clear search matching
" noremap <Leader><Space> :noh<cr>:call clearmatches()<CR>
nnoremap <BS> :set hlsearch! hlsearch?<CR>

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" __ }}}

set splitright
set splitbelow
set display+=lastline

" }}}

" 3. UI Configuration {{{

set showmatch "briefly jump to the matching bracket when inserted
set matchtime=2
set number
set numberwidth=3
set lazyredraw
set laststatus=2
set noshowmode
set ruler
set formatoptions=qn1
set conceallevel=1

" fold magic
set foldenable
set foldmethod=syntax
set foldlevelstart=99 "open all fold by default
let g:xml_syntax_folding=1                          "enable xml folding

" Color
" set background=dark
let g:jellybeans_use_lowcolor_black = 0
" colorscheme jellybeans
"let g:zenburn_alternate_Visual = 1
"let g:zenburn_high_Contrast = 1
"let g:zenburn_old_Visual = 1

set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
color base16-default

" color base16-monokai
set colorcolumn=+3

" __ Cursorline {{{
set cursorline

" Only show cursorline in the current window and in normal mode.
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END
" __ }}}

" __ Navigation {{{

set scrolloff=1
set scrolljump=5 "minimum number of lines to scroll

" move cursor by display lines when wrapping
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

" Easier indenting
nmap <C-Left> <<
nmap <C-Right> >>
vmap <C-Left> <gv
vmap <C-Right> >gv

" http://unix.stackexchange.com/a/34723/21088
if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"__ }}}

" }}}

" 4. Mappings {{{

" set pastetoggle=<F2>
map <F6> :set invpaste<CR>:set paste?<CR>

" _ Insert mode {{{

" smash scape
inoremap jk <Esc>
inoremap kj <Esc>

" change cursor position
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap <C-u> <C-g>u<C-u>
"}}}

" remap arrow keys (aka hard mode)
" nnoremap <Left> :bprev<CR>
" nnoremap <Right> :bnext<CR>
" nnoremap <Up>
" nnoremap <Down>

" yank and put to/from the OS's clipboard
vnoremap <Leader>yo "+y
nnoremap <Leader>po "+p

" make Y consistent with C and D. See :help Y
nnoremap Y y$

" window shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Spell {{{

set spellfile=~/.vim/spell/en.utf-8.add

" normal mode mappings
" TODO toggle with the same key
" nnoremap <F8> :setlocal spell! spelllang=en_us<CR>
" noremap <F9> :setlocal nospell<CR>
map <F9> :setlocal invspell<CR>:set spell?<CR>

" insert mode mappings
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<C-g>u
" }}}

" easy expansion of the active file directory
cnoremap <expr>%% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" }}}

" Completion {{{
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
" }}}

" El fin {{{1
NeoBundleCheck
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
