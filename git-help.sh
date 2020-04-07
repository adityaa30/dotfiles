#!/bin/bash

ALLOWED_COMMANDS=(show-branches)

# Check if arguments passed are OK
if [ $# != 1 ]
then
    echo "Usage: ./git-help <command>"
    echo "Available commands: [${ALLOWED_COMMANDS[*]}]"
    exit
fi

if [ $1 == ${ALLOWED_COMMANDS[0]} ]
then
    read -p "Enter git name (default=all): " name
    git for-each-ref --format=' %(authorname) %09 %(refname)' --sort=authorname | grep "$name"
else
    echo "Error: $1 is not a valid command"
    echo "Command can be on of [${ALLOWED_COMMANDS[*]}]"
    exit
fi
