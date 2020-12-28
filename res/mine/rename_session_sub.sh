#!/bin/bash
source ~/.tmux/mine/util.sh

set_name $1 $(get_curr_name)
save

tmux display-message "[$(get_curr_index)] #S"
