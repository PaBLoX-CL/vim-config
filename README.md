Pablo's Vim Config
==================

Introduction
------------

This is my *personal* vim configuration, that I have tweaked over time, taking
bits, reading the documentation, (hint: probably the most useful command in
vim is `:help`) and a lot of trial & error. Hopefully, it could be useful for
someone else :)

Some things to keep in mind:

+ Opinionated
+ This is not a distribution
+ I use GNU/Linux (Arch Linux to be more specific)

I have tested my configuration on different systems and vps (linode, digital
ocean and works fine), and most times works fine out of the box.  Neobundle does
a great job not allowing loading plugins that can't work without dependencies.

One of the main reasons I decided to build my own vim configuration, it's
basically because I was never completely satisfied with having to intervene, and
I didn't like to start having tricky specific configuration `let`s, to customize
to my own needs. That's why I also avoided lots of `if`s to see if executables
or some tools were present. This could mean some things could not work, if you
think adding some of them could had value, and it's not too much I might be
willing to add it. In any case, just do the PR :)

Install
-------

0. Install external tools

    + `the_silver_searcher` (`ag`)
    + `git`

1. Clone this repo

        git clone https://github.com/PaBLoX-CL/vim-config ~/.vim

2. Install neobundle

         git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle

3. Install bundles

        vim +NeoBundleInstall +qall
        # or
        ~/.vim/bundle/neobundle.vim/bin/neoinstall

4. Profit! :moneybag:

UI Details
----------

+ I use [powerline][], but it's installed system wide, so that's why I don't have
  any kind of `statusline` configuration (though I have tested airline, and works
  good too)
+ I have `colorcolumn` activated by default
+ *Soft* wrap is on
+ My colorscheme is [jellybeans][]. I have tried to change it a lot of times. I keep
  coming back.
+ `cursorline` is set on by default, but only in normal mode and when in the
  window (this is extremely useful)
+ `relativenumber` is also set by default. I found it incredible useful when
  navigating, but not so much when leaving the window or losing focus (I got the
  idea from [Jeff Kreefmeijer post](http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/))

[jellybeans]: https://github.com/nanotech/jellybeans.vim
[powerline]: https://github.com/powerline/powerline

Mappings
--------

Besides common mappings, there are a couple that are a bit different to what's
normally used by the community:

+ <kbd>Esc</kbd><kbd>Esc</kbd> clears search match
+ `<Leader>` is <kbd>SPACE</kbd>

### Normal mode

Arrow keys are disabled in normal mode. No more cheating.

+ `<Leader>?`: open a quickfix window for the last search
+ `<Leader>{y,d,p,P}`: yank/delete/put (paste) from the OS clipboard
+ `<Leader>{|,-}`: quick splits
+ `<Leader>w`: quick save

#### Function keys

+ <kbd>F1</kbd>: Startify
+ <kbd>F2</kbd>: Toggle Relative Number
+ <kbd>F4</kbd>: GoldenView Autoresize
+ <kbd>F5</kbd>: Toggle Gundo
+ <kbd>F6</kbd>: Toggle Paste Mode
+ <kbd>F8</kbd>: Toggle Tagbar
+ <kbd>F9</kbd>: Toggle Spellcheck
+ <kbd>F10</kbd>: Get syntax group information

**Rationale:** Function keys are for things that I don't use too much, and can
be toggled.

#### Alt mappings

+ <kbd>ALT + p</kbd>: Toggle auto-pairs

### Insert Mode

+ Smash escape: `jk` and `kj` in rapid succession, or at the same time (thanks
  to [vim-arpeggio][])
+ <kbd>CTRL</kbd><kbd>l</kbd>: Suggests word when spelling and pick the first

### Visual Mode

+ Clever trick from [sheerun's article](http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
    + <kbd>v</kbd> region_expand (once, visual mode; twice, select word; thrice,
      sentence ...)
    + <kbd>CTRL + V</kbd> region_shrink (the opposite)

### Command Line

+ `%%` expand the directory of the current file anywhere at the command line
+ `<Leader>ew` expands to :edit (directory of current file)/ (open in the current buffer)
+ `<Leader>es` expands to :split (directory of current file)/ (open in a horizontal split)
+ `<Leader>ev` expands to :vsplit (directory of current file)/ (open in a vertical split)

### Plugins

I have [vinegar][] as a plugin, but I use <kbd>`_`</kbd> instead of <kbd>-</kbd>.

#### Ctrl-p

I'm using [ctrl-p][] with a pseudo-leader key: <kbd>,</kbd>.

+ <kbd>CTRL + P</kbd>: summon ctrl-p :heart:
+ <kbd>,b</kbd>: search buffers
+ <kbd>,o</kbd>: search outline (using [ctrlp-funky][])
+ <kbd>,l</kbd>: search line
+ <kbd>,t</kbd>: search tag within the current buffer
+ <kbd>,T</kbd>: search tag globally

#### Unite

This was a recent discovery, I found it more awesome everyday I use it, problem
is that I have been using [ctrl-p][] for a long time, and I can't get rid of my
muscle memory that fast. I'm using also a pseudo-leader key: <kbd>-</kbd>

+ <kbd>- + SPACE</kbd>: a mix of buffers, most recent used files and bookmarks
+ <kbd>-/</kbd>: grep
+ <kbd>-b</kbd>: buffers
+ <kbd>-e</kbd>: recent files (from within the directory)
+ <kbd>-f</kbd>: directory files (async)
+ <kbd>-l</kbd>: lines
+ <kbd>-m</kbd>: mappings
+ <kbd>-s</kbd>: buffers (with quick-match)
+ <kbd>-y</kbd>: yanks

##### And with some plugins (or *sources*)

+ <kbd>-c</kbd>: colorschemes
+ <kbd>-d</kbd>: git status
+ <kbd>-h</kbd>: help
+ <kbd>-j</kbd>: junkfile
+ <kbd>-o</kbd>: outline
+ <kbd>-t</kbd>: tags
+ <kbd>-z</kbd>: folds

#### Filetype plugin mappings

All filetype plugins, start with a pseudo-leader, <kbd><Leader>f</kbd>

+ <kbd>js</kbd>: jsbeautify

#### General mappings

+ `<Leader>a{&,=,:,,,|}`: [Tabular][tabularize] align commands
+ <kbd>[]c</kbd>: [GitGutter][gitgutter] prev/next hunk
+ `<Leader>h{s,r}`: [GitGutter's][gitgutter] hunk-staging/reverting
+ `<Leader>g{s,d,c,b,l,p,w,r}`: [Fugitive's][fugitive] git status/diff/commit/
  blame/log/push/write/remove
+ `<Leader>nr`: [Narrow Region][narrow_region]
+ `<Leader>vo`: [EasyGrep][easy_grep]
+ `<Leader>c`: [vim-shell][] mappings
    + `c` open vimshell in a vertical split
    + `n` node repl
    + `r` ruby repl
    + `p` python repl

[fugitive]: https://github.com/tpope/vim-fugitive
[gitgutter]: https://github.com/airblade/vim-gitgutter
[narrow_region]: https://github.com/chrisbra/NrrwRgn
[tabularize]: https://github.com/godlygeek/tabular
[easy_grep]: http://www.vim.org/scripts/script.php?script_id=2438
[ctrl-p]: https://github.com/kien/ctrlp.vim
[ctrlp-funky]: https://github.com/tacahiroy/ctrlp-funky
[vim-arpeggio]: https://github.com/kana/vim-arpeggio
[vim-shell]: https://github.com/Shougo/vimshell.vim

Miscellaneous
-------------

### Colorschemes

If you want to include the extra colorschemes, just add the following in
your `before.vimrc` file:

    let g:colorscheme_extras = 1

### Key-stuff

I have added some alt + key mappings, if you need to add more, just modify
the `characters` list from [rc/alt_mappings.rc.vim](rc/alt_mappings.rc.vim).

For [termite](https://github.com/thestinger/termite), I have configured the
support for `<S-F1>` to `<S-F4>`.

This [answer](https://stackoverflow.com/a/27206531/417527) on StackOverflow
explains how it is done.

Acknowledgments
---------------

This vim configuration has been created from a lot of years of tweaking and
reading other more clever vim developers. I tried to document what did I took
and where, but of course something could be unintentionally left out.

>        If I have seen further than others, it is by standing upon the shoulders
>        of giants.
>
>                                       Letter to Robert Hooke (15 February 1676)
>                                                                 —  Isaac Newton

Well, I haven't seen any further, but oh well, you get the idea.

##### [Shougo's vim](https://github.com/Shougo/shougo-s-github)

This configuration is heavily based on this configuration, the distribution, and
some functions. Most notorious thing should be the use of the `neobundle#tap`
function.

##### [bling's Dotvim](https://github.com/bling/dotvim)

Until a couple of months ago I was using a fork from this vim distribution until
I found Shougo's. I didn't like to declare every plugin configuration along
with the plugin, besides that doesn't play along very well with Neobundle.

##### [vimified](https://zaiste.github.io/vimified)

I used this from at least a couple of years. It's awesome, easier to follow, and
doesn't suffer the problem that big distributions like Janus had, overly
complex, and annoying configuration.

##### [Spf13](https://github.com/spf13/spf13-vim)

I never used spf13 as a whole, I just stole a couple of ideas from it. It looks
very good for use with gVim though.

##### [Janus](https://github.com/carlhuda/janus)

Janus was the first distribution I ever used when I started using vim more
seriously. It was awesome to use out-of-the box, but the submodule
configuration, the use of local directories, discouraged me (and also, I always
felt that was focus to MacVim, more than linux version).

##### [Terryma's Dotfiles](https://github.com/terryma/dotfiles)

I found this one just a while ago, so I haven't checked it with detail, but it
is definitely on the todo list.

##### [YADR project](https://github.com/skwp/dotfiles)

It has a very modular distribution, but sometimes feel it's way too much.
I tried to use it a while ago, but I never felt comfortable with that. I rather
have a sort of "long" vimrc that having every possible option spread trough the
repo.

License
-------

Copyright © Pablo Olmos de Aguilera Corradini. Distributed under the same terms
as vim itself. See `:help license` for more information.
