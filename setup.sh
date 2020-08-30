#!/bin/bash

notesdir="$HOME/notes"
hourslog="$notesdir/hours.md"
todolist="$notesdir/todo.md"

[[ ! -d "$notesdir" ]] && mkdir "$notesdir"
[[ ! -f "$hourslog" ]] && touch "$hourslog"
[[ ! -f "$todolist" ]] && touch "$todolist"

echo "$(date +%A) Hours" >  "$hourslog"
echo "=================" >> "$hourslog"

echo "Urgent:"     >  "$todolist"
echo "-------"     >> "$todolist"
echo               >> "$todolist"
echo "Eventually:" >> "$todolist"
echo "-----------" >> "$todolist"
echo               >> "$todolist"
