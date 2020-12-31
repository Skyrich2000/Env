#!/bin/bash
source ~/.tmux/mine/util.sh "$1"

curr=$(get_curr_index)
tmux command-prompt -I "#S" "rename-session -- '%%'; run-shell \"~/.tmux/mine/rename_session_sub.sh $client $curr\""
