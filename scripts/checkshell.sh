#!/usr/bin/bash

[[ ! -f /usr/share/bash-completion/bash_completion ]] && \
    echo "bash-completion is not installed"
    echo "Please use packet manager to install it"
    echo "In OpenSUSE, run: "
    echo " sudo zypper install bash-completion"

[[ -f /usr/share/bash-completion/bash_completion ]] && \
    echo "bash-completion is installed"
