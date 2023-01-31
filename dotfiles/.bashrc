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

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# AWS CLI bash completion
complete -C '/usr/local/bin/aws_completer' aws

# Add Go to PATH
export PATH=$PATH:/usr/local/go/bin
. "$HOME/.cargo/env"

complete -C /usr/bin/terraform terraform

# Aliases
alias playground='docker run --network host -it --rm --name playground ubuntu:latest /bin/bash'
alias playground-here='docker run --network host -it --rm -v "$(pwd)":/mnt/"${PWD##*/}" \
                       --name playground-here \
                       --workdir /mnt/"${PWD##*/}" \
                       ubuntu:latest /bin/bash'
