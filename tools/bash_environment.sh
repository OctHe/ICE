#!/usr/bin/bash

if [[ ! -f ~/.xmodmap-`uname -n` ]]; then
    echo "~/.xmodmap-`uname -n` is not find"
    echo "Disable key swap"
fi

if [[ ! -f /usr/share/bash-completion/bash_completion ]]; then
    echo "bash-completion is not installed"
    echo "Please use packet manager to install it"
    echo "In OpenSUSE, run: "
    echo " sudo zypper install bash-completion"
else
    echo "bash-completion is installed"
fi

if [[ `uname -a` =~ "arch" ]]; then
    echo "Arch Linux"
    echo "Download and config font to enable CJK："
    echo "    https://wiki.archlinuxcn.org/wiki/字体配置/中文"
fi
