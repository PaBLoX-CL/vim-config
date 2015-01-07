" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', {
      \   'build' : {
      \       'unix' : 'make -f make_unix.mak',
      \   }
      \ }

" 1. General {{{1
NeoBundle 'kana/vim-arpeggio'
NeoBundleLazy 'tpope/vim-capslock', {
      \ 'insert': 1
      \ }
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-repeat'
NeoBundleLazy 'tpope/vim-rsi', {
      \ 'insert': 1,
      \ }
NeoBundle 'pbrisbin/vim-restore-cursor'
NeoBundle 'pbrisbin/vim-rename-file'

" 2. Colorschemes {{{1

NeoBundleLazy 'ScrollColors', {
      \ 'commands': 'SCROLLCOLOR',
      \ }
"NeoBundle 'godlygeek/csapprox'

" Dark {{{2
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sjl/badwolf'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jnurmine/Zenburn'

" Both dark and light {{{2
NeoBundle 'altercation/vim-colors-solarized' "{{{
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  "}}}
NeoBundle 'morhetz/gruvbox'
NeoBundle 'chriskempson/base16-vim'

if exists('g:colorscheme_extras') " {{{2
  " Dark {{{3
  NeoBundle 'tomasr/molokai'
  NeoBundle 'zaiste/Atom'
  NeoBundle 'Elive/vim-colorscheme-elive'
  NeoBundle 'zeis/vim-kolor'
  NeoBundle 'twilight256.vim'
  NeoBundle 'Wombat'
  NeoBundle 'dsolstad/vim-wombat256i'
  NeoBundle 'wgibbs/vim-irblack'
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

  " Light {{{3
  NeoBundle 'github-theme'

endif " }}}

" 3. Development {{{1
NeoBundleLazy 'mattn/gist-vim', {
      \ 'depends': 'mattn/webapi-vim',
      \ 'commands': 'Gist',
      \ }
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', {
      \   'depends': 'tpope/vim-fugitive',
      \   'commands': 'Gitv',
      \ }
NeoBundleLazy 'matchit.zip', {
      \ 'mappings': ['%', 'g%']
      \ }
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'airblade/vim-gitgutter'
NeoBundleLazy 'sjl/gundo.vim', {
      \  'commands': 'GundoToggle',
      \ }
" NeoBundle 'honza/vim-snippets'
NeoBundleLazy 'Shougo/neocomplete.vim', {
      \   'insert': 1,
      \   'vim_version': '7.3.885',
      \ }
NeoBundleLazy 'Shougo/neosnippet.vim', {
      \ 'depends': 'Shougo/neosnippet-snippets',
      \ 'insert': 1,
      \ 'filetypes': 'snippet',
      \ 'unite_sources': [
      \   'neosnippet', 'neosnippet/user', 'neosnippet/runtime' ],
      \ }
" NeoBundle 'Shougo/neosnippet-snippets'
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

" Haskell {{{2
NeoBundleLazy 'eagletmt/neco-ghc', {
      \ 'filetypes': 'haskell',
      \ 'external_commands': 'ghc-mod',
      \ }
NeoBundleLazy 'Twinside/vim-haskellFold', {
      \ 'filetypes': 'haskell',
      \ }

" Ruby {{{2
NeoBundle 'tpope/vim-bundler'
NeoBundleLazy 'tpope/vim-rails', {
      \ 'filetypes': 'ruby',
      \ }
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {
      \ 'depends': 'vim-scripts/matchit.zip',
      \ 'filetypes': 'ruby',
      \ }
NeoBundleLazy 'bootleq/vim-textobj-rubysymbol', {
      \ 'filetypes': 'ruby',
      \ }
NeoBundleLazy 'skwp/vim-rspec', {
      \ 'filetypes': 'ruby',
      \ }

" Web {{{2
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
      \   'filetypes': 'javascript',
      \   'build': {
      \     'unix': 'npm install',
      \   }
      \ }
NeoBundleLazy 'maksimr/vim-jsbeautify', {
      \ 'filetypes': 'javascript',
      \ }
" 4. Editing {{{1
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundleLazy 'godlygeek/tabular', {
      \ 'commands': 'Tabularize',
      \ }
NeoBundle 'bufkill.vim'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundleLazy 'terryma/vim-expand-region', {
      \ 'mappings': '<Plug>(expand_'
      \ }
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'christoomey/vim-tmux-navigator'

" 5. Navigation {{{1
NeoBundleLazy 'EasyGrep', {
      \ 'commands': 'GrepOptions',
      \ }
NeoBundleLazy 'justinmk/vim-sneak', {
      \ 'mappings': ['s', 'S']
      \ }
NeoBundle 'ctrlpvim/ctrlp.vim', {
      \ 'depends': 'tacahiroy/ctrlp-funky',
      \ }
NeoBundle 'mileszs/ack.vim'
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
NeoBundleLazy 'tpope/vim-vinegar', {
      \ 'mappings': '<Plug>VinegarUp',
      \ }
NeoBundleLazy 'majutsushi/tagbar', {
      \ 'commands': 'TagbarToggle',
      \ 'external_commands': 'ctags',
      \ }

" 6. Filetypes {{{1
NeoBundle 'sheerun/vim-polyglot'
NeoBundleLazy 'Twinside/vim-syntax-haskell-cabal', {
      \ 'filetypes': ['haskell', 'cabal'],
      \ }
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {
      \ 'filetypes': ['javascript','coffee'],
      \ }
NeoBundleLazy 'jtratner/vim-flavored-markdown', {
      \ 'filetypes': 'markdown',
      \ }

" 7. Unite {{{1
NeoBundleLazy 'Shougo/unite.vim', {
      \ 'commands': [{ 'name': 'Unite',
      \                'complete': 'customlist,unite#complete_source'}],
      \ 'depends':  'Shougo/neomru.vim',
      \ }
NeoBundleLazy 'ujihisa/unite-colorscheme', {
      \ 'unite_sources': 'colorscheme',
      \ }
NeoBundleLazy 'osyo-manga/unite-fold', {
      \ 'unite_sources': 'fold',
      \ }
NeoBundleLazy 'tsukkee/unite-tag', {
      \ 'unite_sources': ['tag', 'tag/file'],
      \ }
NeoBundleLazy 'Shougo/unite-outline', {
      \ 'unite_sources': 'outline',
      \ }
NeoBundleLazy 'Shougo/unite-help', {
      \ 'unite_sources': 'help',
      \ }
NeoBundleLazy 'Shougo/junkfile.vim', {
      \ 'commands': 'JunkfileOpen',
      \ 'unite_sources': ['junkfile', 'junkfile/new']
      \ }
NeoBundleLazy 'Shougo/neomru.vim', {
      \ 'filetype': 'all',
      \ }
NeoBundleLazy 'kmnk/vim-unite-giti', {
      \ 'unite_sources': 'giti',
      \ }

" 8. UI {{{1
" NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundleLazy 'zhaocai/GoldenView.Vim', {
      \ 'mappings': ['<Plug>ToggleGoldenViewAutoResize','<Plug>GoldenViewSplit'],
      \ }

" 9. Misc {{{1
NeoBundleLazy 'Shougo/vimshell.vim', {
      \ 'commands': [{ 'name': 'VimShell',
      \                'complete': 'customlist,vimshell#complete' },
      \              'VimShellInteractive'
      \             ],
      \ 'mappings': '<Plug>'
      \ }
NeoBundle 'mhinz/vim-startify'
NeoBundle 'benmills/vimux'
NeoBundle 'tpope/vim-tbone'

" vim: foldmethod=marker foldlevel=0
