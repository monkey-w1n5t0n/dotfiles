#!/usr/bin/sh

FILES=$(echo dotfiles checkout 2>&1 | sed 1d | head -n -2 | awk '{print $1}')

echo $FILES

for f in $FILES
do
    echo f
done
