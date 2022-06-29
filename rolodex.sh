#!/bin/sh

fname="$HOME/.rolodex"

if [ "$1" = add ]; then
  [ -z "$2" ] && read -p "name: " name || name="$2"
  read -p "number: " number
  new "$name" "$number" >> "$fname"
  printf '%-8s %s\n' "$name" "$number" >> "$fname"
elif [ "$1" = edit ]; then
  vim "$fname"
elif [ -z "$1" ]; then
  cat "$fname"
else
  awk -v name="$1" '$1 ~ name { print $2 }' "$fname"
fi
