#!/bin/bash

read -p "Please input a number between 20 to 40:" var # Getting input from user.

 #An until loop is used to execute as long as the given condition evaluates to false.
until [[ $var -gt 20 && $var -lt 40 ]];do

    echo "Invalid input, please try again."
    read -p "Please input a number between 20 to 40:" var

done 

echo "Valid input. Well done!"

exit 0