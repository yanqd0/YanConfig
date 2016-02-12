#!/usr/bin/env bash

# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Bash completion {{{
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# }}}

# Personal config {{{
if [ -f ~/.bash/bashrc ]; then
    . ~/.bash/bashrc
fi
# }}}

# vim: set shiftwidth=4 softtabstop=4 expandtab foldmethod=marker:
# vim: set textwidth=80 colorcolumn=80:
