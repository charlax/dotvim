Installation
============

    $ curl https://raw.github.com/charlax/dotvim/master/boostrap.sh -o- | sh

Installing Vim on Mac Os X
==========================

You need [Homebrew](http://mxcl.github.com/homebrew/).

If you use `pythonbrew`, desactivate it: `pythonbrew off`.

    $ brew install macvim --override-system-vim
    $ brew linkapps

Plugins
=======

I am using [Pathogen](https://github.com/tpope/vim-pathogen).

Adding a plugin
---------------

Example: vim-latex

    $ git submodule add git://github.com/jcf/vim-latex.git bundle/latex
    $ git status # check if nothing else is staged for commit
    $ git commit -m "added vim-latex plugin"

Don't forget to add it to the `README.markdown` file!

Upgrading all plugins
---------------------

    $ git submodule update --init --recursive

List of plugins
---------------

* [MRU](http://www.vim.org/scripts/script.php?script_id=521): most recently
  used files.
* [Cocoa](http://www.vim.org/scripts/script.php?script_id=2674): a collection
  of scripts designed to make it easier to develop Cocoa/Objective-C
  applications.

How to try Vim
==============

If you want to try Vim, just follow these steps:

1. Read [Seven habits of effective text editing](http://www.moolenaar.net/habits.html) by Bram Moolenaar (Vim's main author)
2. Resist the urge to use a plugin or anyone else’s `vimrc`. [Really](http://mislav.uniqpath.com/2011/12/vim-revisited/).
3. Use `vimtutor` to learn the basics.
4. Along the way, add plugins and improve your `.vimrc` little
   by little, making sure you understand and comment all your options.

Feel free to read my article: [Why I use Vim](http://blog.d3in.org/post/14220797290/why-i-keep-on-using-vim-instead-of-going-back-to)

Acknowledgments
===============

Thanks to:

* Drew Neil's [Vimcasts](http://vimcasts.org/)
* [Tim Pope](http://tbaggery.com/)
* [Janus](https://github.com/carlhuda/janus)
