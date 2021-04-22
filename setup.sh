#!/bin/sh
set -e

echo "set runtimepath+=~/.vim/

source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/general.vim
source ~/.vim/vimrcs/mappings.vim

vim -c ':PlugInstall'" > ~/.vimrc

echo Setup Complete
