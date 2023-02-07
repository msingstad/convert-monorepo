#!/bin/sh

cd /Users/martinsingstad/Projects

for folder in */ ; do
    if [[ $folder == "BizBus."* ]] ; then
        cp .gitignore $folder
        cp .gitattributes $folder
        cd $folder
        git add .gitignore
        git add .gitattributes
        git commit -a -m "Update gitignore and gitattributes"
        git pull origin main
        git push -u origin main
        cd ..
    fi 
done
