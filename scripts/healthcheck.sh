#!/usr/bin/bash
#
# Check the environment of ICE
#

ICE_SHELL=(bash zsh ipython ipython3)
ICE_PKT=(flatpak snap apt zypper pacman)

# screen has some unknown issue for nvim highlight.
# Specifically, in OpenSUSE version of WSL, when open 
# nvim in screen, all the highlight cannot correctly
# display.
ICE_TOOL=(
    find vifm
    grep ack ag rg
    git tokei
    screen tmux
    top htop
    less watch
    dict
)
ICE_NETWORK=(
    iw iwctl wpa_cli hostapd nmcli
    iwconfig iwlist ifconfig
    ip tc
    xrdp 
    lynx
    )
ICE_EDITOR=(vim nvim emacs kate micro)
ICE_FORMATTER=(
    astyle
)
ICE_COMPILER=(
    cmake make bear
    gcc g++ clang
    python python3
    ruby
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

ice_environment shell package_manage tool network
ice_environment editor formatter compiler debugger server
