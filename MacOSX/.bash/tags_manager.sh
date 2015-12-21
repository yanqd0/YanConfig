#!/bin/sh

# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

# Parse parameters
while getopts "h r n a u l c: d:" option
do
    case $option in
        h)
            help=true;;
        r)
            reset=true;;
        n)
            new=true;;
        a)
            add=true;;
        u)
            update=true;;
        l)
            list=true;;
        c)
            change=$OPTARG;;
        d)
            delete=$OPTARG;;
        *)
            echo "\033[1;31;401m" \
                There are some errors in arguments. See help: \
                "\033[0m"
            help=true;;
    esac
done

# Help
if [[ -n $help ]]
then
    echo " usage: tagsmgr [-h] [-n] [-l] [-c <TAG>] [-d <TAG>]"
    echo "                [-r] [-a] [-u]"
    echo "\033[1;33;401m" \
        "-h      " \
        "\033[0m" \
        Show the help.
    echo "\033[1;33;401m" \
        "-n      " \
        "\033[0m" \
        Creat a new tag in current directory.
    echo "\033[1;33;401m" \
        "-l      " \
        "\033[0m" \
        Show the list of existed tags.
    echo "\033[1;33;401m" \
        "-c <TAG>" \
        "\033[0m" \
        Change the default tag to \<TAG\>
    echo "\033[1;33;401m" \
        "-d <TAG>" \
        "\033[0m" \
        Delete the tag named \<TAG\>
    echo "\033[1;33;401m" \
        "-r      " \
        "\033[0m" \
        Reset \(clear\) all the tags.
    echo "\033[1;33;401m" \
        "-a      " \
        "\033[0m" \
        Add current directory to filepath.files .
    echo "\033[1;33;401m" \
        "-u      " \
        "\033[0m" \
        Update the default tags by filepath.files .
    exit -1
fi

# Check directory
tagdir=~/.vim/tags
if [[ ! ( -d $tagdir ) ]]
then
    mkdir -p $tagdir
fi

# Reset
if [[ -n $reset ]]
then
    rm -rf $tagdir
    mkdir -p $tagdir
    exit 0
fi

# Record the time of start
if [[ -n $new$update ]]; then
    DATE=$(date)
    START=$(date +%s)
fi

# Move current tags to backup if needed
if [[ -n $new$change ]]; then
    if [[ (  -n $new && -f $tagdir/tagname ) \
        || ( -n $change && -d $tagdir/$change ) ]]
    then
        name=$(cat $tagdir/tagname)
        mkdir -p $tagdir/$name
        mv $tagdir/cscope.* $tagdir/$name
        mv $tagdir/*.files $tagdir/$name
        mv $tagdir/tag* $tagdir/$name
        echo Default -\> $tagdir/$name
    fi
fi

# Move specified tag to default if needed
if [[ -n $change ]]
then
    if [[ -d $tagdir/$change ]]
    then
        mv $tagdir/$change/* $tagdir/
        rmdir $tagdir/$change
        echo $tagdir/$name -\> Default
    else
        echo "\033[1;31;401m" \
            " The tag <$change> not found!" \
            "\033[0m"
        exit -2
    fi
fi

# Make `filepath.files`
paths=filepath.files
if [[ -n $new$add ]]; then
    find $PWD -name '*.java' \
        -or -name '*.aidl' \
        -or -name '*.c' \
        -or -name '*.h' \
        -or -name '*.cpp' \
        >> $tagdir/$paths
    if test -s $tagdir/$paths
    then
        echo $tagdir/$paths Done.
    fi
fi

# Generate tags of `ctags` and `cscope`
if [[ -n $new$update ]]; then
    # Check filepath.files is not empty
    if [[ ! ( -f $tagdir/$paths ) ]]
    then
        echo "\033[1;31;401m" \
            $paths not found! \
            "\033[0m"
        exit -3
    elif ! ( test -s $tagdir/$paths )
    then
        echo "\033[1;31;401m" \
            $paths is empty! \
            "\033[0m"
        exit -4
    fi

    # Make tags
    ctags -L $tagdir/$paths -f $tagdir/tags
    echo ctags file is created.
    cscope -vRbkq -i $tagdir/$paths -f $tagdir/cscope.out
    echo cscope files are created.

    # Store current directory name as default tag name in file
    echo ${PWD##*/} > $tagdir/tagname

    # Display duration and date
    time=$(($(date +%s) - $START))
    echo "\033[0;30;46m" \
        "Begin: $DATE"
    echo " End  : $(date)"
    echo " Duration:" \
        $(($time / 3600)) h \
        $(($time / 60 % 3600)) m \
        $(($time % 60)) s \
        "\033[0m"
fi

# Delete the specified tag
if [[ -n $delete ]]; then
    for name in $(ls $tagdir)
    do
        if [[ $name == $delete ]]; then
            rm -rf $tagdir/$delete/
            break
        fi
    done
fi

# Display current tags' list
if [[ -n $new$list$change ]]; then
    if [[ -f $tagdir/tagname ]]
    then
        echo "*""\033[1;32;401m" \
            $(cat $tagdir/tagname) \
            "\033[0m"
    else
        echo "*"
    fi
    for name in $(ls $tagdir)
    do
        [ -d $tagdir/$name ] && echo "  "$name
    done
fi

# vim: set shiftwidth=4 softtabstop=4 expandtab foldmethod=marker:
# vim: set textwidth=80 colorcolumn=80:
