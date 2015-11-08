#!/bin/sh

CONFIG_DIR="MacOSX"

TARGET_VIM=~/.vim
VIM_LIST=`ls $CONFIG_DIR/.vim/`

function sh_main {
break_if_not_exist $VIM_LIST

echo update begin
echo ------------

update_vimrc

echo ------------
echo update end
}

function break_if_not_exist {
for file in $*
do
    if [ ! -f $TARGET_VIM/$file ];
    then
        echo $TARGET_VIM/$file not exists.
        exit 1
    fi
done
}

function update_vimrc {
for file in $VIM_LIST
do
    cp $CONFIG_DIR/.vim/$file $TARGET_VIM/$file
    echo ~/.vim/$file is updated.
done
}

function update_if_exist {
source_file=$1
target_file=$2

if [ -f $target_file ]; then
    cp $source_file $target_file
    echo $target_file is updated.
else
    echo $target_file is not exists! Try make install first.
fi
}

# execute
sh_main
