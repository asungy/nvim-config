
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable bash completion
if [ -f '/usr/share/bash-completion/bash_completion' ]; then
    source '/usr/share/bash-completion/bash_completion'
fi

# Can add custom bash completions.
# Example: complete -C '/usr/local/bin/aws_completer' aws

# Shell prompt format
PS1='[\u@\h \W]\$ '

# Default text editor
export VISUAL=nvim

# Aliases
alias ls='ls --color=auto'
alias playground='docker run -it --rm --name playground ubuntu:latest /bin/bash'
alias playground-here='docker run -it --rm -v "$(pwd)":/mnt/"${PWD##*/}" \
                       --name playground-here \
                       --workdir /mnt/"${PWD##*/}" \
                       ubuntu:latest /bin/bash'
