#!/usr/bin/bash
#
# Check the prerequisites of ICE


ICE_SHELL=(bash zsh ipython)
ICE_PKT=(apt zypper)
ICE_TOOL=(
    find fzf
    grep ack ag rg
    git tokei
    tmux
    iw
    lynx
)
ICE_EDITOR=(vim gvim nvim emacs micro)
ICE_COMPILER=(
    cmake make
    gcc clang
    python python3
)
ICE_DEBUGGER=(gdb lldb)
ICE_LS=(
    clangd ccls
    pyright
    shellcheck
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

ice_environment shell pm tool 
ice_environment editor compiler debugger server
