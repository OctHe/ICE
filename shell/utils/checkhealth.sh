#!/bin/bash
#
# Check the environment of ICE
#

ICE_SHELL=(bash zsh fish ipython ipython3)
ICE_PKT=(
    flatpak snap apt zypper pacman yay
    pip pip3
)

# screen has some unknown issue for nvim highlight.
# Specifically, in OpenSUSE version of WSL, when open 
# nvim in screen, all the highlight cannot correctly
# display.
ICE_TOOL=(
    find fd
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
    cmake make bear
    gcc g++ clang
    python python3
    xelatex xetex pdflatex pdftex bibtex latexmk
    ruby
    go
)
ICE_DEBUGGER=(gdb lldb)
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

ice_environment shell package_manage tool network viewer
ice_environment editor formatter compiler debugger server
