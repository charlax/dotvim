Installing Vim on Mac Os X
==========================

You need [Homebrew](http://mxcl.github.com/homebrew/).

If you use `pythonbrew`, desactivate it: `pythonbrew off`.

    $ brew install macvim --override-system-vim
    $ brew linkapps

Installation
============

    $ curl https://raw.github.com/charlax/dotvim/master/boostrap.sh -o- | sh

Plugins
=======

Adding a plugin
---------------

Example: vim-latex

    $ git submodule add git://github.com/jcf/vim-latex.git bundle/latex
    $ git status # check if nothing else is staged for commit
    $ git commit -m "added vim-latex plugin"

Upgrading all plugins
---------------------

    $ git submodule update --init --recursive
