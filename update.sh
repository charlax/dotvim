git fetch origin master
git merge origin/master
git submodule foreach git pull -q origin master
echo "Deactive pythonbrew (pythonbrew off), then run:"
echo "sudo easy_install --upgrade rope ropevim"
