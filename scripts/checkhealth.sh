#!/usr/bin/bash
#
# Check the environment of ICE
#

ICE_SHELL=(bash zsh ipython ipython3)
ICE_PKT=(flatpak snap apt zypper pacman)

# screen has some unknown issue for nvim highlight
# Specifically, in OpenSUSE version of WSL, when open 
# nvim in screen, all the highlight cannot correctly
# display. It might be a issue between screen and nvim, 
# but it is unknown whether other distributions have 
# the same problem
ICE_TOOL=(
    find vifm
    grep ack ag rg
    git tokei
    screen tmux
    dict
    iw
    lynx
)
ICE_EDITOR=(vim gvim nvim emacs micro)
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

ice_checkhealth()
{
  for arg in $@
  do
    echo ${arg}
    case ${arg} in
        shell)
            prog_list=${ICE_SHELL[@]}
            ;;
        pm)
            prog_list=${ICE_PKT[@]}
            ;;
        tool)
            prog_list=${ICE_TOOL[@]}
            ;;
        editor)
            prog_list=${ICE_EDITOR[@]}
            ;;
        compiler)
            prog_list=${ICE_COMPILER[@]}
            ;;
        debugger)
            prog_list=${ICE_DEBUGGER[@]}
            ;;
        server)
            prog_list=${ICE_LS[@]}
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
  done
}

ice_checkhealth shell pm tool 
ice_checkhealth editor compiler debugger server
