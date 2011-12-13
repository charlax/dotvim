function die()
{
    echo "${@}"
    exit 1
}

# Backup old configuration files
for i in $HOME/.vimrc $HOME/.gvimrc; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    echo "${i} has been renamed to ${i}.old"
    mv "${i}" "${i}.old" || die "Could not move ${i} to ${i}.old"
  fi
done

ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/gvimrc $HOME/.gvimrc


# Clone dotvim into .vimrc-perso
git clone git@github.com:charlax/dotvim.git $HOME/.vim \
  || die "Could not clone the repository to ${HOME}/.vim"

# Installing vim-preview
cd $HOME/.vim
git submodule add git://github.com/greyblake/vim-preview.git janus/vim/custom/preview
