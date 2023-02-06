#!/bin/sh

cd /Users/martinsingstad/Projects

for folder in */biztalk-applications/ ; do
    folderName=${folder%/}
    repoName=${folderName#Norwegian.}
    echo $repoName
    git subtree split -P $folderName -b $repoName
    cd ..
    mkdir $repoName && cd $repoName
    git init
    git checkout -b main
    git pull "/Users/martinsingstad/Projects/biztalk-applications" $repoName
    git remote add origin "git@bitbucket.org:norwegianairshuttle/$repoName.git"
    git push -u origin main
    cd /Users/martinsingstad/Projects/biztalk-applications
    rm -rf $folderName
done

