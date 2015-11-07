#!/bin/sh

CONFIG_DIR="MacOSX"

function install_before_check {
file=$1
TARGET_FILE=$2/$file

if [ -f $TARGET_FILE ]; then
    echo $TARGET_FILE exists!
    echo Try make update instead.
    exit
else
    cp $CONFIG_DIR/vim/$file $TARGET_FILE
    echo $TARGET_FILE is installed.
fi
}

FILE_LIST=`ls $CONFIG_DIR/vim/`
for file in $FILE_LIST
do
    install_before_check $file ~/.vim
done
echo Done.
