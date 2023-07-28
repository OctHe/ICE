#!/bin/bash
#
# Efficient programs for work flow
#

ICE_SHELL=(bash csh zsh fish ipython ipython3)

ICE_PKT=(
    flatpak snap apt zypper pacman yay
    pip pip3
)

# screen and tmux need to set true color
ICE_TOOL=(
    find fdfind
    vifm
    grep ack ag rg
    git
    terminator
    screen tmux
    top htop neofetch
    less watch
    dict cppman
)

ICE_NETWORK=(
    iw iwctl wpa_cli hostapd nmcli
    ip tc
    xrdp 
    lynx nyxt vimb
)

ICE_EDITOR=(vim nvim emacs kate micro)

ICE_VIEWER=(evince zathura okular)

ICE_FORMATTER=(
    astyle
)

ICE_COMPILER=(
    ctags
    cmake make bear ccache
    gcc g++ clang
    python python3
    xelatex xetex pdflatex pdftex bibtex latexmk
    rust
    go
)

# ddd is the GUI of gdb
ICE_DEBUGGER=(gdb ddd lldb)
ICE_LS=(
    clangd ccls
    shellcheck
    lua-language-server
)

ice_environment()
{
  for arg in $@
  do
    echo ${arg}
    case ${arg} in
        shell)
            prog_list=${ICE_SHELL[@]}
            ;;
        package_manage)
            prog_list=${ICE_PKT[@]}
            ;;
        network)
            prog_list=${ICE_NETWORK[@]}
            ;;
        tool)
            prog_list=${ICE_TOOL[@]}
            ;;
        viewer)
            prog_list=${ICE_VIEWER[@]}
            ;;
        editor)
            prog_list=${ICE_EDITOR[@]}
            ;;
        server)
            prog_list=${ICE_LS[@]}
            ;;
        formatter)
            prog_list=${ICE_FORMATTER[@]}
            ;;
        compiler)
            prog_list=${ICE_COMPILER[@]}
            ;;
        debugger)
            prog_list=${ICE_DEBUGGER[@]}
            ;;
        *)
          ;;
    esac

    for prog in ${prog_list[@]}
    do
        if which ${prog} > /dev/null 2>&1
        then
            echo -e "  [y] ${prog}"
        else
            echo -e "  [ ] ${prog}"
        fi
    done
    echo
  done
}

bash_environment()
{
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
}

ice_environment shell package_manage tool network viewer
ice_environment editor formatter compiler debugger server

bash_environment
