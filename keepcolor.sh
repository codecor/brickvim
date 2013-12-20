#!/bin/bash
# keep vim color scheme in screen
#
echo "term screen-256color" >> ~/.screenrc
echo "export TERM=xterm-256color" >> ~/.bashrc

cp -rp vim ~/.vim
cp vimrc ~/.vimrc
