#!/bin/sh
set -e

echo "set runtimepath+=~/.vim/

source ~/.vim/vimrcs/plugins_config.vim" > ~/.vimrc

vim +PlugInstall +qall

echo "source ~/.vim/vimrcs/general.vim
source ~/.vim/vimrcs/mappings.vim" >> ~/.vimrc

echo Setup Complete
