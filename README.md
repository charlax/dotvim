Installation
============

    $ curl -s https://raw.githubusercontent.com/charlax/dotvim/master/install.py | python

You should read the script before executing it.

Prerequisites
=============

Tested on Mac Os X 10.6, 10.10 and Ubuntu 12.04.

On Mac Os X: needs [Homebrew](http://mxcl.github.com/homebrew/).

You'll also need to install
[Solarized](http://ethanschoonover.com/solarized) palettes for iTerm.

Installing Vim on Mac Os X
==========================

You need [Homebrew](http://mxcl.github.com/homebrew/).

    $ brew install macvim --override-system-vim

Then open vim and run:

    :PlugInstall

Reinstalling
------------

It is a good idea to reinstall MacVim from time to time:

    $ brew reinstall macvim

Plugins
=======

I am using [vim-plug](https://github.com/junegunn/vim-plug).

* Add a plugin by adding a `Plug` line in `vimrc`.
* Update plugins with `:PlugUpdate`.
* Upgrade vim-plug from time to time with `:PlugUpgrade`.
* Remove a plugin by removing the line, running `:PlugClean` and removing the
  description from the `README.md`. Look for other mentions of the plugin in
  the repo by using `ag`.

List of plugins
---------------

* [Cocoa](http://www.vim.org/scripts/script.php?script_id=2674): a collection
  of scripts designed to make it easier to develop Cocoa/Objective-C
  applications.
* [Flake8](https://github.com/nvie/vim-flake8): runs the currently open file
  through Flake8, a static syntax and style checker for Python source code.
* [FZF](https://github.com/junegunn/fzf.vim): fuzzy file finder
* [json](https://github.com/elzr/vim-json): JSON highlighting script.
* [JSX](https://github.com/mxw/vim-jsx): React JSX syntax highlighting and indenting
* [Mako](https://github.com/sophacles/vim-bundle-mako): a collection of
  scripts for the mako templating engine.
* [nerdtree](https://github.com/scrooloose/nerdtree): a tree explorer plugin.
* [Python-Pep8-Indent](https://github.com/hynek/vim-python-pep8-indent) a nicer
  Python indentation style.
* [repeat](https://github.com/tpope/vim-repeat): enable repeating supported
  plugin maps with "."
* [rtf-highlight](https://github.com/jdonaldson/rtf-highlight.git): syntax
  highlighting to RTF
* [Solarized](https://github.com/altercation/vim-colors-solarized): precision
  colorscheme
* [Stylus](https://github.com/wavded/vim-stylus): syntax highlighting for
  stylus.
* [Tagbar](https://github.com/majutsushi/tagbar): displays tags
  in a window, ordered by class etc.
* [thrift.vim](https://github.com/solarnz/thrift.vim.git): syntax highlighting
  for thrift definition files.
* [ultisnips](https://github.com/SirVer/ultisnips): snippet engine
* [vim-arduino](https://github.com/sinisterstuf/vim-arduino.git): compile and
  deploy Arduino sketches.
* [vim-go](https://github.com/fatih/vim-go.git): go development plugin
* [vim-less](https://github.com/groenewege/vim-less): syntax for LESS
  (dynamic CSS).
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors.git):
  True Sublime Text style multiple selections for Vim
* [vim-snippets](https://github.com/honza/vim-snippets): snippets file for various
  programming languages.
* [xmledit](https://github.com/sukima/xmledit/): help edit XML files.

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

Feel free to read my article: [Why I use
Vim](http://blog.d3in.org/post/14220797290/why-i-keep-on-using-vim-instead-of-going-back-to)

Here's some other good articles:

* [A Good Vimrc](http://dougblack.io/words/a-good-vimrc.html)

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
