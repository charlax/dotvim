# Add .old to any existing Vim file in the home directory
for i in $HOME/.vimrc.before $HOME/.vimrc.after $HOME/.gvimrc.before $HOME/.gvimrc.after; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    echo "${i} has been renamed to ${i}.old"
    mv "${i}" "${i}.old" || die "Could not move ${i} to ${i}.old"
  fi
done

ln -s $HOME/.vimrc.perso/vimrc.before $HOME/.vimrc.before
ln -s $HOME/.vimrc.perso/vimrc.after $HOME/.vimrc.after
ln -s $HOME/.vimrc.perso/gvimrc.after $HOME/.gvimrc.after
