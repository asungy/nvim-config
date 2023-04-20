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

###############################################################
# A la Sam Williams
###############################################################

# Override FZF bindings for scrolling previews for consistency.
export FZF_DEFAULT_OPTS="--bind \"ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,shift-up:preview-top,shift-down:preview-bottom\""

# Define custom command to read git diffs with delta and FZF
if (command -v fzf >/dev/null 2>&1) && (command -v git >/dev/null 2>&1) && (command -v delta >/dev/null 2>&1); then
    fzfdiff() {
        project_root=$(git rev-parse --show-toplevel)
        if [ -n "$project_root" ]; then
            pushd "$project_root" >/dev/null
            preview="\"git diff $@ --color=always -- {-1} | delta -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}\""
            bash -c "git diff $@ --name-only | fzf -m --ansi --preview-window=top:80% --preview $preview"
            popd >/dev/null
        fi
    }
fi
