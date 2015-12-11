# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

# ls
# List files and directories with human readable detailed infomation
alias ll='ls -hlF'
# Show hidden files only
alias l.='ls -d .*'
# Show files only
alias lsf='ls -hl | grep ^d'
# Show directories only
alias lsd='ls -hl | grep -v ^d'
# Recursive directory listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

# Jump back n directories at a time
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

# git
# Compact, colorized git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# Visualise git log (like gitk, in the terminal)
alias glg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# Human readable df
alias df='df -h'
# rm will be more safe by reminding you if without -f behind
alias rm='rm -i'
# Show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
# Search for process
alias tm='ps -ef | grep'
# Set vi as vim
alias vi='vim --noplugin'
# open MacVim app quickly
alias macvim='open -a MacVim'
