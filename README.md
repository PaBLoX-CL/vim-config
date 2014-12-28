Introduction
------------

This is my *personal* vim configuration, that I have tweaked over time, taking
bits, reading the documentation, (hint: probably the most useful command in
vim is `:help`) and a lot of trial & error. Hopefully, it could be useful for
someone else :)

Some things to keep in mind:

+ Opinionated
+ This is not a distribution
+ I use GNU/Linux

I have tested my configuration on different systems and vps (linode, digital
ocean and works fine), and most times works fine out of the box.  Neobundle does
a great job not allowing loading plugins that can't work without dependencies.

One of the main reasons I decided to build my own vim configuration, it's
basically because I was never completely satisfied with having to intervene, and
I didn't like to start having tricky specific configuration `let`s, to customize
to my own needs. That's why I also avoided lots of `if`s to see if executables
or some tools were present. This could mean some things could not work, but if
it's not too much I might be willing to add it. In any case, just do the PR :)

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
  idea from [Jeff Kreefmeijer post](http://jeffkreeftmeijer.com/2012/relative-line
  -numbers-in-vim-for-super-fast-movement/))

[jellybeans]: https://github.com/nanotech/jellybeans.vim
[powerline]: https://github.com/powerline/powerline

Mappings
--------

Besides common mappings, there are a couple that are a bit different to what's
normally used by the community:

+ <kbd>Esc</kbd><kbd>Esc</kbd> clears search match
+ `<Leader>` is <kbd>SPACE</kbd>

Normal mode
===========

Arrow keys are disabled in normal mode. No more cheating.

+ `<Leader>?`: open a quickfix window for the last search
+ `<Leader>{y,d,p,P}`: yank/delete/put (paste) from the OS clipboard
+ `<Leader>{|,-}`: quick splits
+ `<Leader>w`: quick save

### Function keys

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

### Alt mappings

+ <kbd>ALT + p</kbd>: Toggle auto-pairs

### Miscellaneous

Insert Mode
===========

+ Smash escape: `jk` and `kj` in rapid succession, or at the same time (thanks
  to [vim-arpeggio][])
+ <kbd>CTRL</kbd><kbd>l</kbd>: Suggests word when spelling and pick the first

Visual Mode
===========

+ Clever trick from [sheerun's article](http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
    + <kbd>v</kbd> region_expand (once, visual mode; twice, select word; thrice,
      sentence ...)
    + <kbd>CTRL + V</kbd> region_shrink (the opposite)

Command Line
============

+ `%%` expand the directory of the current file anywhere at the command line
+ `<Leader>ew` expands to :edit (directory of current file)/ (open in the current buffer)
+ `<Leader>es` expands to :split (directory of current file)/ (open in a horizontal split)
+ `<Leader>ev` expands to :vsplit (directory of current file)/ (open in a vertical split)

Plugins
=======

+ <Leader>nr ([Narrow Region](https://github.com/chrisbra/NrrwRgn))

Miscellaneous
-------------

Colorschemes
============

If you want to include the extra colorschemes, just add the following in
your `before.vimrc` file:

    let g:colorscheme_extras = 1

Key-stuff
=========

I have added some alt + key mappings, if you need to add more, just modify
the `characters` list from [](rc/alt_mappings.rc.vim).

For [termite](https://github.com/thestinger/termite), I have configured the
support for `<S-F1>` to `<S-F4>`.

This [answer](https://stackoverflow.com/a/27206531/417527) on StackOverflow
explains how it is done.
