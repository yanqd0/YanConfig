#!/bin/sh

CONFIG_DIR="MacOSX"

VIMRC=~/.vim/vimrc
if [[ -f $VIMRC ]]; then
    echo $VIMRC exists!
    echo Try make update instead.
    exit
else
    cp $CONFIG_DIR/vim/vimrc $VIMRC
    echo $VIMRC is installed.
fi

echo Done.
