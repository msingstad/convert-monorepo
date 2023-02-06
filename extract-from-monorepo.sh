#!/bin/sh

PATH="/Users/martinsingstad/Projects"
cd $PATH

for folder in */biztalk-applications/ ; do
    folderName=${folder%/}
    repoName=${folderName#Norwegian.}
    
    #Create new branch that contains the folder only and keeps commit log
    git subtree split -P $folderName -b $repoName
    
    #Pull new branch into new git folder
    cd ..
    mkdir $repoName && cd $repoName
    git init
    git checkout -b main
    git pull "$PATH/biztalk-applications" $repoName
    
    #Make repo ready for push and push to remote
    git remote add origin "git@bitbucket.org:norwegianairshuttle/$repoName.git"
    git config pull.rebase true
    git pull origin main
    git push -u origin main
    
    #Remove project-folder from monorepo (just to keep track of un-moved projects)
    cd $PATH/biztalk-applications
    rm -rf $folderName
    cd ..
done

