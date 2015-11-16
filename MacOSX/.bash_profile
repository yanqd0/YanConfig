# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

# Setting bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion;
fi

# Setting git completion
source ~/.git-completion.bash

# Persinal bash profile #
# ls
export CLICOLOR=1   #ls color
export CLICOLOR_FORCE=1
export LSCOLORS=gxfxaxdxcxegedabagacad  #ls color specific
# grep
export GREP_OPTIONS='--color=always'
export GREP_COLOR='5;40'

# alias
source ~/.alias.bash

# Setting Android SDK path
PATH="~/Library/Android/sdk/platform-tools:${PATH}"
export PATH
