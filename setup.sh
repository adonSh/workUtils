#!/bin/bash

notesdir="$HOME/notes"
hourslog="$notesdir/hours.md"
todolist="$notesdir/todo.md"
rolodex="$HOME/.rolodex"

[[ ! -d "$notesdir" ]] && mkdir "$notesdir"
[[ ! -f "$hourslog" ]] && touch "$hourslog"
[[ ! -f "$todolist" ]] && touch "$todolist"
[[ ! -f "$rolodex" ]]  && touch "$rolodex"

{
echo "$(date +%A) Hours"
echo "================="
} > "$hourslog"

{
echo "Urgent:"
echo "-------"
echo
echo "Eventually:"
echo "-----------"
} > "$todolist"
