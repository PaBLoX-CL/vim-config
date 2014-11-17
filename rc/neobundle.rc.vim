" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', { 'build' : { 'unix' : 'make -f make_unix.mak' } }

" 1. General {{{1
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'pbrisbin/vim-restore-cursor'
NeoBundle 'pbrisbin/vim-rename-file'

" 2. Colorschemes {{{1

NeoBundle 'ScrollColors'
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
NeoBundle 'kana/vim-textobj-user'
NeoBundleLazy 'mattn/gist-vim', {
      \ 'depends': 'mattn/webapi-vim',
      \ 'autoload': {
      \   'commands': 'Gist',
      \   }
      \ }
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv', {
      \   'depends': 'tpope/vim-fugitive',
      \   'autoload': {
      \     'commands': 'Gitv'
      \   },
      \ }
NeoBundle 'matchit.zip'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'airblade/vim-gitgutter'
NeoBundleLazy 'sjl/gundo.vim', {
      \  'commands': 'GundoToggle',
      \  }
" NeoBundle 'honza/vim-snippets'
NeoBundleLazy 'Shougo/neocomplete.vim', {
      \   'autoload': {
      \     'insert': 1
      \   },
      \   'vim_version': '7.3.885',
      \ }
NeoBundle 'Shougo/neosnippet.vim'
  " let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets'
  " let g:neosnippet#disable_runtime_snippets= { '_' : 1 }
NeoBundle 'Shougo/neosnippet-snippets'
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
      \ }
NeoBundleLazy 'Twinside/vim-haskellFold', {
      \ 'filetypes': 'haskell',
      \ }

" Ruby {{{2
NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'filetypes': 'ruby',
      \ }
NeoBundle 'tpope/vim-bundler'
NeoBundleLazy 'tpope/vim-rails', {
      \ 'filetypes': 'ruby',
      \ }
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {
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

" 4. Editing {{{1
NeoBundleLazy 'godlygeek/tabular', {
      \ 'commands': 'Tabularize',
      \ }
NeoBundle 'bufkill.vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'terryma/vim-multiple-cursors'
" NeoBundle 'jiangmiao/auto-pairs' " {{{
"    let g:AutoPairsShortcutToggle = '<C-q>'
"   " }}}
NeoBundle 'christoomey/vim-tmux-navigator'

" 5. Navigation {{{1
NeoBundleLazy 'EasyGrep', {
      \ 'commands': 'GrepOptions',
      \ }
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'kien/ctrlp.vim', {
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
NeoBundle 'tpope/vim-vinegar'
NeoBundleLazy 'majutsushi/tagbar', {
      \ 'commands': 'TagbarToggle',
      \ }

" 6. Filetypes {{{1
NeoBundleLazy 'tpope/vim-git', {
      \ 'filetypes': ['git', 'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail'],
      \ }
NeoBundleLazy 'Keithbsmiley/rspec.vim', {
      \ 'filetypes': 'ruby',
      \ }
NeoBundleLazy 'tpope/vim-cucumber', {
      \ 'filetypes': 'cucumber',
      \ }
NeoBundleLazy 'zaiste/tmux.vim', {
      \ 'filetypes': 'tmux',
      \ }
NeoBundleLazy 'travitch/hasksyn', {
      \ 'filetypes': 'haskell',
      \ }
NeoBundleLazy 'Twinside/vim-syntax-haskell-cabal', {
      \ 'filetypes': ['haskell', 'cabal'],
      \ }

" Javascript {{{2
NeoBundleLazy 'pangloss/vim-javascript', {
      \ 'filetypes': 'javascript',
      \ }
NeoBundleLazy 'maksimr/vim-jsbeautify', {
      \ 'filetypes': 'javascript',
      \ }
NeoBundleLazy 'kchmck/vim-coffee-script', {
      \ 'filetypes': 'coffee',
      \ }
NeoBundleLazy 'mmalecki/vim-node.js', {
      \ 'filetypes': 'javascript',
      \ }
" NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundleLazy 'elzr/vim-json', {
      \ 'filetypes': ['javascript', 'json'],
      \ }
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {
      \ 'filetypes': ['javascript','coffee'],
      \ }

" Html/CSS {{{2
NeoBundleLazy 'othree/html5.vim', {
      \ 'filetypes': 'html',
      \ }
NeoBundleLazy 'slim-template/vim-slim', {
      \ 'filetypes': 'slim',
      \ }
NeoBundleLazy 'cakebaker/scss-syntax.vim', {
      \ 'filetypes': ['scss','sass'],
      \ }
NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ 'filetypes': ['css','scss','sass'],
      \ }
NeoBundleLazy 'tpope/vim-markdown', {
      \ 'filetypes': 'markdown',
      \ }
NeoBundleLazy 'tpope/vim-haml', {
      \ 'filetypes': 'haml',
      \ }
NeoBundleLazy 'digitaltoad/vim-jade', {
      \ 'filetypes': 'jade',
      \ }
NeoBundleLazy 'wavded/vim-stylus', {
      \ 'filetypes': 'stylus',
      \ }
NeoBundleLazy 'juvenn/mustache.vim', {
      \ 'filetypes': 'mustache',
      \ }

" 7. Unite {{{1
NeoBundle 'Shougo/unite.vim' "{{{
  let bundle = neobundle#get('unite.vim')
  function! bundle.hooks.on_source(bundle)
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#custom#source('line,outline','matchers','matcher_fuzzy')
    call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1,
      \ 'direction': 'botright',
      \ 'prompt': '» ',
      \ })
  endfunction

  let g:unite_data_directory='~/.vim/.cache/unite'
  let g:unite_source_history_yank_enable=1
  let g:unite_source_rec_max_cache_files=5000

  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''

  function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
  endfunction
  autocmd FileType unite call s:unite_settings()

  nmap <Space> [unite]
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

" 8. UI {{{1
" NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundleLazy 'zhaocai/GoldenView.Vim', {
      \ 'mappings': ['<Plug>ToggleGoldenViewAutoResize','<Plug>GoldenViewSplit'],
      \ }

" 9. Misc {{{1
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

" vim: foldmethod=marker foldlevel=0
