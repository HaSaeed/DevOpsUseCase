#!/bin/bash

# Unit test to check the working of app1 and app2 in parallel

set -m
hello_app > a.txt & sleep 3; kill -INT $!  # Stroing output of app1 in a.txt after 2 prints
world_app > b.txt & sleep 3; kill -INT $!  # Stroing output of app1 in b.txt after 2 prints

# Check if Hello and World has appeared twice in the two files or not
if [[ $(grep -o -w "Hello" a.txt | wc -l) -eq 2 ]] && [[ $(grep -o -w "World" b.txt | wc -l) -eq 2 ]]; then
    echo "Test passes, Hello and World have appeared twice."
    exit 0
else
    echo "Test fails, hello or world have not appeared twice"
    exit 1
fi
