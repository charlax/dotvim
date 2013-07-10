Installation
============

    $ wget https://raw.github.com/charlax/dotvim/master/install.py
    $ python install.py

You should read the script before executing it.

Prerequisites
=============

Tested on Mac Os X 10.6 and Ubuntu 12.04.

On Mac Os X: needs [Homebrew](http://mxcl.github.com/homebrew/).

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

1. `git submodule add git://github.com/jcf/vim-latex.git bundle/latex`
2. Add the description in `README`
3. Make sure nothing else is staged and commit: `git commit -m "Add vim-latex plugin"`

Upgrading all plugins
---------------------

    $ ./update.sh
    $ git add .
    $ git commit -m "Update plugins"

Removing a plugin
-----------------

1. Remove submodule from `.gitmodules`
2. `git rm --cached path_to_plugin`
3. `rm path_to_plugin`
4. Remove the description in `README`, and look for other mention of the plugin
5. Commit (including `.gitmodules`) and delete the files

List of plugins
---------------

* [Cocoa](http://www.vim.org/scripts/script.php?script_id=2674): a collection
  of scripts designed to make it easier to develop Cocoa/Objective-C
  applications.
* [ctrlp](https://github.com/kien/ctrlp.vim): full path fuzzy file, buffer,
  mru and tag finder
* [Tagbar](https://github.com/majutsushi/tagbar): Vim plugin that displays tags
  in a window, ordered by class etc.
* [Flake8](https://github.com/nvie/vim-flake8): runs the currently open file
  through Flake8, a static syntax and style checker for Python source code.
* [CoffeeScript](https://github.com/kchmck/vim-coffee-script): CoffeeScript
  support for Vim.
* [Mako](https://github.com/sophacles/vim-bundle-mako): a collection of vim
  scripts for the mako templating engine.
* [nerdtree](https://github.com/scrooloose/nerdtree): a tree explorer plugin.
* [json](https://github.com/elzr/vim-json): JSON highlighting script.
* [repeat](https://github.com/tpope/vim-repeat): enable repeating supported
  plugin maps with "."
* [Solarized](https://github.com/altercation/vim-colors-solarized): precision
  colorscheme for the vim text editor
* [SearchComplete](https://github.com/vim-scripts/SearchComplete): tab
  completion of words inside of a search
* [AutoTag](https://github.com/vim-scripts/AutoTag): updates entries in a tags
  file automatically when saving
* [PyUnit](https://github.com/charlax/vim-pyunit): plugin enabling advanced unit
  test support inside your favorite editor.
* [Python-Pep8-Indent](https://github.com/hynek/vim-python-pep8-indent) a nicer
  Python indentation style for Vim.
* [Eco](https://github.com/AndrewRadev/vim-eco): eco (embedded coffee-script)
  support for Vim
* [Stylus](https://github.com/wavded/vim-stylus): syntax highlighting for
  stylus
* [Jade](https://github.com/digitaltoad/vim-jade.git): Vim Jade template engine
  syntax highlighting and indentation
* [vim-less](https://github.com/groenewege/vim-less): vim syntax for LESS
  (dynamic CSS)
* [vim-gf-python](https://github.com/mkomitee/vim-gf-python.git): enhance
  support for vim's 'gf' map in python

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

* `<leader>pw`: show the Python documentation for the word under the cursor.
* `<F7>` runs `flake8` on the current file.

Acknowledgments
===============

Thanks to:

* Drew Neil's [Vimcasts](http://vimcasts.org/)
* [Tim Pope](http://tbaggery.com/)
* [Janus](https://github.com/carlhuda/janus)
