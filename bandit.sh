#!/bin/bash

title="# Bandit Level $1"
instructions=$(curl https://overthewire.org/wargames/bandit/bandit$1.html | awk '/<p>/,/<\/p>/' | sed -E 's/<p>//g ; s/<\/p>/\n/g')
path="ssh bandit$1@bandit.labs.overthewire.org -p 2220"

if [ -f "./levels/bandit$1.md" ]; then
  echo "File already exists. Overwrite? (Careful not to overwrite any existing passwords!) y/n"
  read ${REPLY}
  if [ $REPLY = "y" ]; then
    echo -e "$title\n\n$instructions\n\n$path\n\nPassword: " > ./levels/bandit$1.md
    cat ./levels/bandit$1.md
  elif [ $REPLY != "y" ]; then
    echo "Aborting..."
  fi

else
    echo -e "$title\n\n$instructions\n\n$path\n\nPassword: " > ./levels/bandit$1.md
    cat ./levels/bandit$1.md
fi
