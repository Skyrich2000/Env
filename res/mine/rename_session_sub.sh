#!/bin/bash
source ~/.tmux/mine/util.sh
client=$1

set_name $2 "$(get_curr_name)"
save

tmux display-message "[$(get_curr_index)] #S"
