#!/bin/bash

# a variable is an object that contains data used by one or more apps.

a=Amar
echo $a
echo "This is India, $a lives here"

# cmd substitution
# var=$(cmd)
a=$(pwd)
echo $a

## arithmetic expr

a=$((1+2))