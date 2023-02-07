#!/bin/sh

cd /Users/martinsingstad/Projects

for folder in */ ; do
    if [[ $folder == "BizBus."* ]] ; then
        cp Norwegian.Bizbus.snk $folder
        cd $folder
        projectFiles=$(find . -name "*.*proj")
        for file in $projectFiles; do
            fileName=${file#./}
            cd ${fileName%/*}
            sed -i '' 's#\.\.\\\.\.\\Norwegian\.BizBus\.snk#\.\.\\Norwegian\.BizBus\.snk#g' ${fileName#*/}

            cd ..
        done
        git add Norwegian.Bizbus.snk
        git commit -a -m "Automatically move snk and update project files"
        git config pull.rebase true
        git pull origin main
        git push -u origin main
        cd ..
    fi 
done
