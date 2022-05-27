#!/bin/bash

this=$0
dir=$(dirname $this)
news=()

declare -A index
index[index.sh]="This very index"

for f in $dir/*; do
  fname=$(basename $f)
  if [[ -z ${index[$fname]} ]]; then
    news+=("$fname")
  else
    printf "%-8s -- %s\n" "$fname" "${index[$fname]}"
  fi
done

for fname in ${news[@]}; do
  printf "Unrecognized file. What is %s? " "$fname"
  read description
  index["$fname"]="$description"
done
