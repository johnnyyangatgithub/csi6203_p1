#!/bin/bash

while true;do

    echo -e "[1] Exact word match. \n[2] Wildcard line match." # Two choices are given.
    # Getting input from user.
    read -p 'Please enter your search pattern. (1 or 2) ' rv_inchar 
    read -p 'Enter what you want search: ' rv_instr
    read -p 'Do you want to do inverted match(y/n) ' rv_inbool

    rv_option_string='-in' #Set initial grep parameters
    if [[ ${rv_inchar} = 1 ]]
    then
        rv_option_string="${rv_option_string}w" # If user choose [a] then increase w.
    fi
    if [[ ${rv_inbool} = y ]]
    then
        rv_option_string="${rv_option_string}v" # If user choose [b] then increase v.
    fi

#The parameters set with the rv_option_string variable using grep. According to that, search access_log.txt
    rv_results=$(grep ${rv_option_string} "${rv_instr}" access_log.txt) 
    if [[ ${?} = 0 ]]
    then
        echo "$(echo "${rv_results}" | wc -l) match(es) found" #Pipe the matching results and count the number of rows and display the number of rows
        echo "${rv_results}"
    else
        echo 'No matches found'
    fi
    
    read -p 'Exit?(y/n) ' rv_inbool
    if [[ ${rv_inbool} = y ]]
    then
        exit 0
    fi
done