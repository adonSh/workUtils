#!/bin/bash

log="$HOME/notes/hours.md"
today=$(date +'%A')
units=hours
units_len=$(echo " $units" | wc -c)

if [[ -z "$1" || "$1" = cat ]]; then
  echo
  cat "$log"
  echo
  exit $?
elif [[ "$1" = save ]]; then
  archive="$HOME/notes/$(date +'%F')_hours.md"
  echo "Saving log to $archive"
  cp "$log" "$archive"
  exit $?
elif [[ "$1" != log ]]; then
  grep "$1" "$log" | tail -c +3
  exit $?
fi

[[ -z "$2" ]] && read -p "Program: " program || program="$2"
begin=$(date +"%s")
date +%H:%M
read -p "Press ENTER to log hours "
date +%H:%M
end=$(date +"%s")
hours=$(dc --expression "2 k $end $begin - 3600 / p")

if [[ "$(head -n 1 "$log")" != "$today Hours" ]]; then
  echo "$today Hours" > "$log"
  echo "=====================" >> "$log"
fi

if existing="$(grep "$program" "$log")"; then
  prg_len=$(echo "* $program: " | wc -c)
  prv_hrs=$(echo "$existing" | tail -c +$prg_len | head -c -$units_len)
  hours=$(dc --expression "2 k $hours $prv_hrs + p")
  sed -i "s/$existing/\* $program: $hours $units/" "$log"
else
  echo "* $program: $hours $units" >> "$log"
fi

echo "$program: $hours $units"
