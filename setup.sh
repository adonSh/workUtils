#!/bin/bash

notesdir="$HOME/notes"
hourslog="$notesdir/hours.md"
todolist="$notesdir/todo.md"

[[ ! -d "$notesdir" ]] && mkdir "$notesdir"
[[ ! -f "$hourslog" ]] && touch "$hourslog"
[[ ! -f "$todolist" ]] && touch "$todolist"

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
