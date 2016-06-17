git fetch origin master
git merge origin/master
git submodule update --recursive --jobs=4
git add .
git commit -e -m "Update plugins"
git push
