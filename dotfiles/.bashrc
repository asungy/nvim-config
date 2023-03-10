#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable bash completion
if [ -f '/usr/share/bash-completion/bash_completion' ]; then
    source '/usr/share/bash-completion/bash_completion'
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Default text editor
export VISUAL=nvim

# Enable FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# AWS CLI bash completion
# complete -C '/usr/local/bin/aws_completer' aws

# Remove annoying directories
rm -fr ~/Documents

# Aliases
alias playground='docker run --network host -it --rm --name playground ubuntu:latest /bin/bash'
alias playground-here='docker run --network host -it --rm -v "$(pwd)":/mnt/"${PWD##*/}" \
                       --name playground-here \
                       --workdir /mnt/"${PWD##*/}" \
                       ubuntu:latest /bin/bash'
