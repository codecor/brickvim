#!/bin/bash
# keep vim color scheme in screen
#
echo "term screen-256color" >> ~/.screenrc
echo "export TERM=xterm-256color" >> ~/.bashrc

if  ! cp -rp vim/* ~/.vim/ 
then
    echo "creating"
    cp -rp vim ~/.vim
fi
cp vimrc ~/.vimrc
