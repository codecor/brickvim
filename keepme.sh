#!/bin/bash
# keep me vim 
#
# members
BUNDLE="~/.vim/bundle"
WRK=$(pwd)
#
# colors for screen
#TODO dont write to a file that doesn't previously exist
homedir=~
eval homedir=$homedir
my_shell="${homedir}/.zshrc"
if ! grep "256color" $my_shell > /dev/null 2>&1; then
    echo "export TERM=xterm-256color" >> $my_shell
    echo "alias lss='ls -ltr'" >> $my_shell
    echo "alias s='git status'" >> $my_shell
    echo "alias P='git pull origin master'" >> $my_shell
    echo "alias p='git push origin master'" >> $my_shell
fi

# initiate or overlay
if ! mkdir ~/.vim/
then
    echo "fatal: unable to create vim dir"
    exit 1
fi

# plugin placeholder
if ! mkdir ~/.vim/bundle
then
    echo "fatal: unable to create bundle dir"
    exit 1
fi

if ! mkdir ~/.vim/autoload
then
    echo "fatal: unable to create autoload dir"
    exit 1
fi

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# overlay rc file
if uname -a | grep -i debian > /dev/null 2>&1
then
    sed -i.bak s/archlinux/debian/g vimrc 
    echo runtime set to debian
else
    echo runtime set to archlinux
fi
cp vimrc ~/.vimrc

# bundle pkgs
if cd ~/.vim/bundle
then
    for pos in "https://github.com/chrisbra/NrrwRgn.git" \
        "https://github.com/ctrlpvim/ctrlp.vim.git" \
        "https://github.com/scrooloose/syntastic.git" \
        "https://github.com/ervandew/supertab.git" \
        "https://github.com/spolu/dwm.vim.git" \
	    "https://github.com/mileszs/ack.vim.git" \
        "https://github.com/MarcWeber/vim-addon-mw-utils.git" \
        "https://github.com/tomtom/tlib_vim.git" \
        "https://github.com/plasticboy/vim-markdown.git" \
        "https://github.com/garbas/vim-snipmate.git" \
        "https://github.com/terryma/vim-multiple-cursors.git" \
        "https://github.com/honza/vim-snippets.git" \
        "https://github.com/airblade/vim-gitgutter" \
        "https://github.com/esneider/YUNOcommit.vim.git" \
        "https://github.com/vim-scripts/BusyBee.git" \
        "https://github.com/tpope/vim-surround.git" \
        "https://github.com/reedes/vim-lexical.git"
do
    git clone $pos
done
cd $WRK
cp BusyBee.vim ~/.vim/bundle/BusyBee/colors/
fi

# messages
echo "Don't forget to install ack!"
