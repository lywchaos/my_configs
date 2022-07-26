#!/bin/bash

nvim_config_dir="$HOME/.config/nvim/"
nvim_config_name="init.vim"
tmux_config_dir="$HOME/"
tmux_config_name=".tmux.conf"

dirs=($nvim_config_dir $tmux_config_dir)
names=($nvim_config_names $tmux_config_names)
len=${#dirs[*]}

for ((num=0; num<$len; num++))
do
    if [ ! -d ${dirs[$num]} ]
    then
        mkdir -p ${dirs[$num]}
    fi
    cp $HOME/my_mess/${names[$num]} ${dirs[$num]}${names[$num]}
done
