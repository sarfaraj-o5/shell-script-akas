#!/bin/bash

# example() {
#     operations command
# }

# example

# or 

# function function_name {
#     command
# }

# function_name

# example() {
#     echo "Hello World"
# }

# example


example1() {
    echo "Value of 1 - $1"
    echo "Value of All - $*"
}

example1 10 20 30 