Installation
============

    $ curl https://raw.github.com/charlax/dotvim/master/boostrap.sh -o- | sh

You may need:

* [Pandoc](http://johnmacfarlane.net/pandoc/):  a Haskell library for converting from one markup format to another.

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

1. `git submodule add git://github.com/jcf/vim-latex.git bundle/latex`
2. Add the description in `README`
3. Make sure nothing else is staged and commit: `git commit -m "added vim-latex plugin"`

Upgrading all plugins
---------------------

    $ ./update.sh

Removing a plugin
-----------------

1. Remove submodule from `.gitmodules`
2. `git rm --cached path_to_plugin`
3. `rm path_to_plugin`
4. Remove the description in `README`
5. Commit (including `.gitmodules`) and delete the files

List of plugins
---------------

* [Cocoa](http://www.vim.org/scripts/script.php?script_id=2674): a collection
  of scripts designed to make it easier to develop Cocoa/Objective-C
  applications.
* [pydoc](http://www.vim.org/scripts/script.php?script_id=910): allows you
  view Python documentation inside Vim
* [ctrlp](https://github.com/kien/ctrlp.vim): full path fuzzy file, buffer,
  mru and tag finder

How to try Vim
==============

If you want to try Vim, just follow these steps:

1. Read [Seven habits of effective text
   editing](http://www.moolenaar.net/habits.html) by Bram Moolenaar (Vim's main
   author)
2. Resist the urge to use a plugin or anyone else’s `vimrc`.
   [Really](http://mislav.uniqpath.com/2011/12/vim-revisited/).
3. Use `vimtutor` to learn the basics.
4. Along the way, add plugins and improve your `.vimrc` little by little,
   making sure you understand and comment all your options.

Feel free to read my article: [Why I use Vim](http://blog.d3in.org/post/14220797290/why-i-keep-on-using-vim-instead-of-going-back-to)

Reference card
==============

Keyboard shortcuts
------------------

* `<leader>pw`: show the Python documentation for the word under the cursor

Acknowledgments
===============

Thanks to:

* Drew Neil's [Vimcasts](http://vimcasts.org/)
* [Tim Pope](http://tbaggery.com/)
* [Janus](https://github.com/carlhuda/janus)
