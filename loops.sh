#!/bin/bash

# we have to do a work 10 times eg. print hello world 100 times
# loops = tasks will be done until the condition is met/true
## for, while

# for arg in list
# do
#     some cmds
# done

# while [ condition ]
# do
#     some cmds
# done

for (( i=1 ; i<=10 ; i++))
do
    Hello "World got printed $1 times"
done
