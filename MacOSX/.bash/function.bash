#!/usr/bin/env bash

# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

# mkdir and cd into it
mcd () {
    mkdir -p "$1" && cd "$1";
}

# extract varioua condensed files
myextract () {
    if [ -f $1 ]
    then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# make tags for Vim
tagsmgr () {
    script=~/.bash/tags_manager.bash
    if [ -f $script ]
    then
        $script $*
    else
        echo $script not found!
    fi
}

printcolor () {
    script=~/.bash/print_color.bash
    if [ -f $script ]
    then
        $script $*
    else
        echo $script not found!
    fi
}

# save cmd to a file
cmd2sh () {
    if [[ -n $2 ]]
    then
        num=$2
    else
        num=1
    fi

    if [[ -n $1 ]]
    then
        file=$1.sh
        if [[ -e $file ]]
        then
            echo "$file exists. Abort!"
            return
        fi

        echo "#!/usr/bin/env bash" > $file
        echo "" >> $file
        fc -nl | tail -$num \
            | sed "s/	 //g" \
            | sed "s/  *$//g" >> $file
        chmod +x $file
    else
        echo "Usage: cmd2sh <FILE_file> [<CMD_NUM>]"
    fi
}

# vim: set shiftwidth=4 softtabstop=4 expandtab foldmethod=syntax:
# vim: set textwidth=80 colorcolumn=80:
