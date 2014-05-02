git fetch origin master
git merge origin/master
git submodule foreach git pull -q origin master
git add .
git commit -e -m "Update plugins"
git push
