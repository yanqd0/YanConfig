#!/bin/sh

CONFIG_DIR="MacOSX"

VIMRC=~/.vim/vimrc
if [[ -f $VIMRC ]]; then
    cp $CONFIG_DIR/vim/vimrc $VIMRC
    echo $VIMRC is updated.
else
    echo Nothing is updated!
    exit
fi

echo Done.
