#!/bin/bash

# Set initial variable to 0, 'f'means file. 'fe'means file that empty and so on.
let "f=0"
let "fe=0"
let "d=0"
let "de=0"

cd $1 # change directory to where user input.

for i in $( ls );do #Using a for loop traverse the directory.
    if [ -d $i ];then # Judge if its a directory.
        if [ "$(ls -A $i)" = "" ];then
            let de+=1 
        else
            let d+=1
        fi
    else
        if [ -s $i ];then # Judge if its a file.
            let f+=1
        else
            let fe+=1
        fi
    fi
done
# Print relative data to terminal.
echo "The [$1] directory contains"
echo "$f files that contains data."
echo "$fe files that are empty."
echo "$d non-empty directory."
echo "$de empty directories."

exit 0