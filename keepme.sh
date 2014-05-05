#!/bin/bash
# keep vim color scheme in screen
#
# members
BUNDLE="~/.vim/bundle"
WRK=$(pwd)
#
# colors for screen
if ! grep "screen-256color" ~/.screenrc > /dev/null 2>&1; then
    echo "term screen-256color" >> ~/.screenrc
fi
if ! grep "xterm-256color" ~/.bashrc > /dev/null 2>&1; then
    echo "export TERM=xterm-256color" >> ~/.bashrc
fi

# initiate or overlay
if  ! cp -rp vim/* ~/.vim/ 
then
    echo "creating"
    cp -rp vim ~/.vim
fi

# overlay rc file
# TODO debian vs. arch line handling
cp vimrc ~/.vimrc

# bundle pkgs
if cd ~/.vim/bundle
then
    for pos in "https://bitbucket.org/kotarak/vimclojure" \
        "https://github.com/chrisbra/NrrwRgn.git" \
        "https://github.com/fugalh/desert.vim.git" \
        "https://github.com/kien/ctrlp.vim.git" \
        "https://github.com/mileszs/ack.vim.git" \
        "https://github.com/scrooloose/syntastic.git" \
        "https://github.com/ervandew/supertab.git" \
        "https://github.com/spolu/dwm.vim.git" \
        "https://github.com/pangloss/vim-javascript.git" \
        "https://github.com/tpope/vim-fugitive.git" \
        "https://github.com/MarcWeber/vim-addon-mw-utils.git" \
        "https://github.com/tomtom/tlib_vim.git" \
        "https://github.com/plasticboy/vim-markdown.git" \
        "https://github.com/garbas/vim-snipmate.git" \
        "https://github.com/terryma/vim-multiple-cursors.git" \
        "https://github.com/honza/vim-snippets.git" \
        "https://github.com/tpope/vim-surround.git" \
    do
        git clone $pos
    done
    cd $WRK
fi

# messages
echo "Don't forget to install ack!"
