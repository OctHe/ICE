#!/bin/bash
#
# Efficient programs for work flow
#

GRAPHICLESS_SHELL=(bash csh zsh fish ipython ipython3)

GRAPHICLESS_PKT=(
    flatpak snap apt zypper pacman yay
    pip pip3
)

# screen and tmux need to set true color
GRAPHICLESS_TOOL=(
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

GRAPHICLESS_NETWORK=(
    iw iwctl wpa_cli hostapd nmcli
    ip tc
    xrdp 
    lynx nyxt vimb
)

GRAPHICLESS_EDITOR=(vim nvim emacs kate micro)

GRAPHICLESS_VIEWER=(evince zathura okular)

GRAPHICLESS_FORMATTER=(
    astyle
)

GRAPHICLESS_COMPILER=(
    ctags
    cmake make bear ccache
    gcc g++ clang
    python python3
    xelatex xetex pdflatex pdftex bibtex latexmk
    rust
    go
)

# ddd is the GUI of gdb
GRAPHICLESS_DEBUGGER=(gdb ddd lldb)
GRAPHICLESS_LS=(
    clangd ccls
    shellcheck
    lua-language-server
)

graphicless_environment()
{
  for arg in $@
  do
    echo ${arg}
    case ${arg} in
        shell)
            prog_list=${GRAPHICLESS_SHELL[@]}
            ;;
        package_manage)
            prog_list=${GRAPHICLESS_PKT[@]}
            ;;
        network)
            prog_list=${GRAPHICLESS_NETWORK[@]}
            ;;
        tool)
            prog_list=${GRAPHICLESS_TOOL[@]}
            ;;
        viewer)
            prog_list=${GRAPHICLESS_VIEWER[@]}
            ;;
        editor)
            prog_list=${GRAPHICLESS_EDITOR[@]}
            ;;
        server)
            prog_list=${GRAPHICLESS_LS[@]}
            ;;
        formatter)
            prog_list=${GRAPHICLESS_FORMATTER[@]}
            ;;
        compiler)
            prog_list=${GRAPHICLESS_COMPILER[@]}
            ;;
        debugger)
            prog_list=${GRAPHICLESS_DEBUGGER[@]}
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

graphicless_environment shell package_manage tool network viewer
graphicless_environment editor formatter compiler debugger server

bash_environment
