#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import logging
import os
import platform
import shutil

REPOSITORY = "https://github.com/charlax/dotvim.git"
DOTFILES_PATH = os.path.join(os.environ["HOME"], ".vim")
FILES = {
    "~/.vim/vimrc": "~/.vimrc",
    "~/.vim/gvimrc": "~/.gvimrc",
    "~/.vim/config/nvim/init.vim": "~/.config/nvim/init.vim",
}


def symlink(source, target):
    """Symlink vim configuration files."""
    source, target = map(os.path.expanduser, (source, target))
    print("Will symlink %s to %s" % (source, target))

    if os.path.exists(target):
        if os.path.islink(target) and os.path.realpath(target) == source:
            logging.info("%s exists" % target)
            return

        backup = target + ".old"

        if os.path.exists(backup):
            raise Exception(
                "Can't backup to %s: file already exists." % backup)

        shutil.move(target, backup)

    else:
        os.symlink(source, target)
        logging.info("%s symlinked to %s" % (source, target))


def clone_dotfile(repo, path):
    """Clone or update the dotfiles directory."""
    if not os.path.exists(path):
        os.system("git clone %s %s" % (repo, path))
    else:
        os.system("cd %s && git checkout master && git pull" % path)

    if not os.path.exists(path):
        raise Exception("Dotfiles path '%s' does not exist. "
                        "Might be a git error, see above." % path)


def install(args):
    """Install the vimrc files."""
    # Backup and link the files
    os.makedirs(os.path.expanduser("~/.config/nvim/"), exist_ok=True)
    for source, target in FILES.items():
        symlink(source, target)

    if args.only_symlink:
        return

    clone_dotfile(REPOSITORY, DOTFILES_PATH)

    print("You can ignore any error - plugins haven't been installed yet.")
    os.system("vim +PlugInstall +qall")

    for d in ("~/.vim/temp/temp", "~/.vim/temp/backup"):
        d = os.path.expanduser(d)
        if not os.path.exists(d):
            os.makedirs(d)

    system = platform.system()
    if system == "Darwin":
        os.system("brew install ctags pandoc")

    if system == "Linux":
        os.system("sudo apt-get install -q -y exuberant-ctags pandoc")

    print("Installing neovim Python package")
    os.system("pip3 install --user neovim")

    print("Installing gocode")
    os.system("go get -u github.com/nsf/gocode")

    print("Installing spell files: check install.py")
    # wget http://ftp.vim.org/vim/runtime/spell/fr.latin1.spl
    # wget http://ftp.vim.org/vim/runtime/spell/fr.latin1.sug
    # wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl
    # wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Install charlax's dotvim.")
    parser.add_argument(
        "--only-symlink", action="store_true", help="Only symlink the files")
    args = parser.parse_args()

    install(args)
