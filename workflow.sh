#!/bin/bash

## Workflow functions ##
demo()
{
  tmux new-session -d -s demo
  tmux send-keys -t demo:1 'echo "This is a demonstration"' Enter
  tmux attach-session -t demo
}

## Interface ##
[[ -z $1 ]] && read -rp "Enter workflow (? for help): " workflow || workflow=$1

if [[ $workflow = ? ]]; then
  echo Options:
  declare -F | sed 's/declare -f/ /'
else
  $workflow 2> /dev/null || echo "Unkown workflow: \"$workflow\""
fi
