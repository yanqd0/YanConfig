# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

# Personal config
if [ -f ~/.bash/bashrc ]; then
    . ~/.bash/bashrc
fi

# PATH
PATH=$PATH:~/Library/Python/2.7/bin

# Setting bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion;
fi

# Setting Android SDK path
PATH="~/Library/Android/sdk/platform-tools:${PATH}"
export PATH
