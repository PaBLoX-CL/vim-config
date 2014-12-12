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
ocean and works fine by default), and most times works fine out of the box.
Neobundle does a great job not allowing loading plugins that can't work without
dependencies.

One of the main reasons I decided to build my own vim configuration, it's
basically because I was never completely satisfied with having to intervene, and
I didn't like to start having tricky specific configuration `let`s, to customize
to my own needs. That's why I also avoided lots of `if`s to see if executables
were present or some tools were present. This could mean some things could not
work, if it's not too much I might be willing to add it. In any case, just do
the PR :)

Install
-------

1. Clone this repo

    git clone https://github.com/PaBLoX-CL/vim-config ~/.vim

2. Install neobundle

    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle

3. Install bundles

    vim +NeoBundleInstall +qall

    # or

    ~/.vim/bundle/neobundle.vim/bin/neoinstall

4. Profit! :moneybag:

Mappings
--------

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
