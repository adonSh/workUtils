#!/bin/bash

list="$HOME/notes/todo.md"
tmp="$HOME/todo.tmp"

addLine() {
  urgency="$1"
  line="$2"

  if [[ "$urgency" = -u ]]; then
    sed '/^$/d' "$list" | awk '/Eventually:/{print "* "l"\n"}1' l="$line" > "$tmp"
    mv "$tmp" "$list"
  elif [[ "$urgency" = -e ]]; then
    echo "* $line" >> "$list"
  else
    echo -n "Is it urgent? "
    read urgency
    if [[ "$urgency" =~ [yY](es)? ]]; then
      addLine -u "$line"
    elif [[ "$urgency" =~ [nN]o? ]]; then
      addLine -e "$line"
    else
      exit 1
    fi
  fi
}

if [[ "$1" = c || "$1" = cat || "$1" = all ]]; then
  cat "$list" && echo
elif [[ "$1" = a || "$1" = add ]]; then
  if [[ -z "$2" ]]; then
    read line
    addLine idk "$line"
  elif [[ $( printf -- "$2" | head -c 1) != - ]]; then
    line="$2"
    addLine idk "$line"
  else
    [[ -z "$3" ]] && read line || line="$3"
    addLine "$2" "$line"
  fi
elif [[ "$1" = r || "$1" = rm ]]; then
  [[ -z "$2" ]] && read line || line="$2"
  sed "/$line/d" $list > $tmp
  mv "$tmp" "$list"
else
  head -n 3 "$list" | tail -n 1 | tail -c +3
fi
