#!/bin/bash

# we can test our logics using conditions or conditional statements

# if [ conditions ]; then
#     some cmds
# else
#     some cmds
# fi

# if [ rain == false ]; then
#     echo "I'll take umbrella"
# else
#     echo "I'll not take umbrella"
# fi

# x=$1
# echo "$0"

# if [ $x -gt 100 ]; then
#     echo "$x is greater than 100"
# else
#     echo "$x is less than 100"
# fi

# read x
# echo "User passed this value: $x"

# if [ $x -gt 100 ]; then
#     echo "$x is greater than 100"
# else
#     echo "$x is less than 100"
# fi

read a 
read b 

if [ $a == $b ]; then
    echo "matched"
else
    echo "not"
fi
