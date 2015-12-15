#!/bin/sh

# Parse parameters
while getopts "h n a u l c: d:" option
do
    case $option in
        h)
            # TODO: help hint
            echo "The help document is not ready!";;
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
        r)
            # TODO: rename
            rename=$OPTARG;;
        *)
            echo There are some errors in arguments.
    esac
done

# Check directory
tagdir=~/.vim/tags
if [[ ! ( -d $tagdir ) ]]
then
    mkdir -p $tagdir
fi

# Record the time of start
if [[ -n $new$update ]]; then
    echo "Begin!"
    DATE=$(date)
    echo $DATE
    START=$(date +%s)
fi

# Move current tags to backup if needed
if [[ -n $new$change ]]; then
    name=$(cat $tagdir/tagname)
    if [[ -n $name ]]; then
        mkdir -p $tagdir/$name
        mv $tagdir/cscope.* $tagdir/$name
        mv $tagdir/*.files $tagdir/$name
        mv $tagdir/tag* $tagdir/$name
        echo Default -\> $tagdir/$name
    fi
fi

# Move specified tag to default if needed
if [[ -n $change ]]; then
    # FIXME: Not working in Mac OS X
    for name in $(ls $tagdir)
    do
        if [[ $name == $change ]]; then
            mv $tagdir/$change/* $tagdir/
            rmdir $tagdir/$change
            echo $tagdir/$name -\> Default
            break
        fi
    done
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
    echo $paths Done.
fi

# Generate tags of `ctags` and `cscope`
if [[ -n $new$update ]]; then
    if [[ ! ( -f $tagdir/$paths ) ]]; then
        echo $paths not found!
        exit -1
    fi

    ctags -L $tagdir/$paths -f $tagdir/tags
    echo ctags file is created.
    cscope -Rbkq -i $tagdir/$paths -f $tagdir/cscope.out
    echo cscope files are created.

    # Store current directory name as default tag name in file
    echo ${PWD##*/} > $tagdir/tagname

    # Display duration and date
    echo --------------------------------
    echo Begin time: $DATE
    time=$(($(date +%s) - $START))
    echo Working time duration: \
        $(($time / 3600)) h $(($time / 60 % 3600)) m $(($time % 60)) s
    echo End time: $(date)
    echo --------------------------------
fi

# Delete the specified tag
if [[ -n $delete ]]; then
    for name in $(ls $tagdir)
    do
        if [[ $name == $delete ]]; then
            rm -rf $tagdir/$delete/
            echo $tagdir/$name -\>
            break
        fi
    done
fi

# Display current tags' list
if [[ -n $new$list ]]; then
    name=$(cat $tagdir/tagname)
    echo "Default tag: " $name
    echo "Other tag:"
    # FIXME: Not working in Mac OS X
    for name in $(ls $tagdir)
    do
        [ -d $tagdir/$name ] && echo $name
    done
fi

echo --------------------------------

# vim: set shiftwidth=4 softtabstop=4 expandtab foldmethod=marker:
# vim: set textwidth=80 colorcolumn=80:
