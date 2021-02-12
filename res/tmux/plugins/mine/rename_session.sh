#!/bin/bash
source ~/.tmux/plugins/mine/util.sh "$1"

curr=$(get_curr_index)
tmux command-prompt -I "#S" "rename-session -- '%%'; run-shell \"~/.tmux/plugins/mine/rename_session_sub.sh $client $curr\""
