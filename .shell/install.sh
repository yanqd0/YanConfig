#!/bin/sh

CONFIG_DIR="MacOSX"

function sh_main {
echo install begin
echo -------------

install_vimrc

echo -------------
echo install end
}

function install_vimrc {
file_list=`ls $CONFIG_DIR/vim/`
for file in $file_list
do
    install_before_check $CONFIG_DIR/vim/$file ~/.vim/$file
done
}

function install_before_check {
source_file=$1
target_file=$2

if [ -f $target_file ]; then
    echo $target_file exists! Try make update instead.
else
    cp $source_file $target_file
    echo $target_file is installed.
fi
}

# execute
sh_main
