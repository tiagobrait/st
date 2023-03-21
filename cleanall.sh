#!/bin/bash

printf 'Cleaning stuff...\n'
printf '  * make clean\n'
make clean > /dev/null
printf '  * undoing changes from tracked and unstage files...\n'
git co -q .
printf '  * removing untracked files...\n'
git clean -fq
if [ -f config.h ]; then
  rm config.h
fi
if [ "$1" == "p" ]; then
  printf '  * removing patch'\''s .orig and .rej files\n'
  for fl in *.{orig,rej}; do
    if [ -f "$fl" ]; then
      rm "$fl"
    fi
  done
fi
printf 'Done!\n'
