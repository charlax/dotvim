#!/bin/sh

echo "Installing MacVim"
brew install macvim --override-system-vim

echo "Installing neovim"
brew install neovim

echo "Installing VimR"
brew cask install vimr
