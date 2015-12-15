#!/usr/bin/env bash

# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

# Print color table of Bash
for STYLE in 0 1 2 3 4 5 6 7
do
    for FG in 30 31 32 33 34 35 36 37
    do
        for BG in 40 41 42 43 44 45 46 47
        do
            CTRL="\033[${STYLE};${FG};${BG}m"
            echo -en "${CTRL}"
            echo -n "${STYLE};${FG};${BG}"
            echo -en "\033[0m"
        done
        echo
    done
    echo
done
echo Style \| Frontground \| Background
# Reset
echo -e "\033[0m"

# vim: set shiftwidth=4 softtabstop=4 expandtab foldmethod=syntax:
# vim: set textwidth=80 colorcolumn=80:
