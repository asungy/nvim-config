alias playground='docker run -it --rm --name playground ubuntu:latest /bin/bash'
alias playground-here='docker run -it --rm -v "$(pwd)":/mnt/"${PWD##*/}" \
                       --name playground-here \
                       ubuntu:latest /bin/bash'