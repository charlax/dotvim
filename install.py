#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import platform
import shutil
import sys

REPOSITORY = "git@github.com:charlax/dotvim.git"
FILES = {
    "~/.vim/vimrc": "~/.vimrc",
    "~/.vim/gvimrc": "~/.gvimrc", }


def die(msg):
    """Display a message and quit."""
    print msg
    sys.exit()


def install():
    """Install the vimrc files."""

    system = platform.system()

    # Backup and link the files
    for orig, dest in FILES.items():
        orig, dest = map(os.path.expanduser, (orig, dest))

        # Backup
        if os.path.exists(dest):
            backup = dest + ".old"

            if os.path.exists(backup):
                die("Can't backup to %s: file already exists. Please delete." %
                        backup)

            shutil.move(dest, backup)

        # Link
        os.symlink(orig, dest)

    os.system("git clone %s ~/.vim" % REPOSITORY)

    for d in ("~/.vim/temp/temp", "~/.vim/temp/backup"):
        d = os.path.expanduser(d)
        if not os.path.exists(d):
            os.makedirs(d)

    os.system("cd ~/.vim && git submodule update --init --recursive")

    if system == "Darwin":
        os.system("brew install ctags pandoc")
        os.system("pip install flake8")

    if system == "Linux":
        os.system("sudo aptitude install exuberant-ctags pandoc")
        os.system("sudo pip install flake8")

    os.system("sudo gem install github-markup")
    os.system("sudo easy_install rope ropevim")


if __name__ == '__main__':
    install()
