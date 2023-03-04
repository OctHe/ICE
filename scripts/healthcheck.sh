#!/usr/bin/bash
#
# Check the prerequisites of ICE


ICE_SHELL=(bash zsh ipython ipython3)
ICE_PKT=(flatpak snap apt zypper pacman)
ICE_TOOL=(
    find fzf
    grep ack ag rg
    git tokei
    tmux
    iw
    lynx
)
ICE_EDITOR=(vim gvim nvim emacs micro)
ICE_LINTER=(
    clangd ccls
    shellcheck
)
ICE_FORMATTER=(
    astyle
)
ICE_COMPILER=(
    cmake make
    gcc clang
    python python3
    ruby
)
ICE_DEBUGGER=(gdb lldb)

ice_environment()
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
        linter)
            prog_list=${ICE_LINTER[@]}
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

ice_environment shell pm tool 
ice_environment editor linter formatter compiler debugger
