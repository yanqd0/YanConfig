#!/usr/bin/bash

#解析参数
while getopts "h n a u l c: d:" option
do
    case $option in
        h)
            echo "Help's document is not ready.";;
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
            rename=$OPTARG;;
        *)
            echo There are some errors in arguments.
    esac
done

echo ----------------------------------------

#检查路径
tagdir=~/.vim/tags
if [[ ! ( -d $tagdir ) ]];
    then mkdir -p $tagdir
fi

#记录开始时间
if [[ -n $new$update ]]; then
    echo "Begin!"
    DATE=$(date)
    echo $DATE
    START=$(date +%s)
fi

#把当前tag移动到文件夹内
if [[ -n $new$change ]]; then
    name=$(cat $tagdir/tagname)
    if [[ -n $name ]]; then
        mkdir -p $tagdir/$name
        #把当前tag移动到文件夹内
        mv $tagdir/cscope.* $tagdir/$name
        mv $tagdir/*.files $tagdir/$name
        mv $tagdir/tag* $tagdir/$name
        echo $name的tag已被移动到$name的文件夹中
    fi
fi

#切换tags #把指定tag移动出来
if [[ -n $change ]]; then
    for name in $(ls $tagdir)
    do
        if [[ $name == $change ]]; then
            mv $tagdir/$change/* $tagdir/
            rmdir $tagdir/$change
            echo $name的tag已被移动到默认的文件夹中
            break
        fi
    done
fi

#配置filepath.files
paths=filepath.files
if [[ -n $new$add ]]; then
    #创建需要处理的文件目录
    find $PWD -name '*.java' \
        -or -name '*.aidl' \
        -or -name '*.c' \
        -or -name '*.h' \
        -or -name '*.cpp' \
        -or -name '*.mk' \
        >> $tagdir/$paths
fi

#生成ctags和cscope的tags
if [[ -n $new$update ]]; then
    if [[ ! ( -f $tagdir/$paths ) ]]; then
        #仍然要创建
        echo $paths is still creating!
        find $PWD -name '*.java' -or -name '*.xml' -or -name '*.c' -or -name '*.h' -or -name '*.cpp' -or -name '*.mk' > $tagdir/$paths
    fi
    ctags -L $tagdir/$paths -f $tagdir/tags
    echo ctags file is created.
    cscope -Rbkq -i $tagdir/$paths -f $tagdir/cscope.out
    echo cscope files are created.

    #保存tags的名称，默认为父文件夹名
    echo ${PWD##*/} > $tagdir/tagname

    #显示处理时间
    echo ----------------------------------------------------------
    echo Begin time: $DATE
    time=$(($(date +%s) - $START))
    echo Working time duration: $(($time / 3600)) h $(($time / 60 % 3600)) m $(($time % 60)) s
    DATE=$(date)
    echo End time: $DATE
    echo ----------------------------------------------------------
fi

#记录开始时间
if [[ -n $delete ]]; then
    for name in $(ls $tagdir)
    do
        if [[ $name == $delete ]]; then
            rm -rf $tagdir/$delete/
            echo $name的tag已被删除
            break
        fi
    done
fi

#显示既有的列表
if [[ -n $new$list ]]; then
    name=$(cat $tagdir/tagname)
    echo "当前的tag是：" $name
    echo "其它的tag有："
    for name in $(ls $tagdir)
    do
        [ -d $tagdir/$name ] && echo $name
    done
fi

echo ----------------------------------------
