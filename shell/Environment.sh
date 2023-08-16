#!/bin/bash
#
# Efficient programs for work flow
#

GRAPHICLESS_SHELL=(bash csh zsh fish ipython ipython3 \\n)

GRAPHICLESS_PKT=(
    flatpak snap apt zypper pacman yay \\n
    pip pip3 \\n
)

# screen and tmux need to set true color
GRAPHICLESS_TOOL=(
    find fd fzf \\n
    grep ack ag rg \\n
    git \\n
    terminator \\n
    screen tmux \\n
    top htop \\n
    neofetch \\n
    less watch \\n
)

GRAPHICLESS_NETWORK=(
    iw iwctl wpa_cli hostapd nmcli \\n
    ip tc \\n
    xrdp \\n
)

GRAPHICLESS_EDITOR=(vim nvim emacs kate micro \\n)

# Help manual, PDF viewver, file explorer, and web browser
GRAPHICLESS_VIEWER=(
    man info dict cppman \\n
    evince zathura okular \\n
    chromium firefox lynx nyxt vimb \\n
    vifm \\n
)

GRAPHICLESS_FORMATTER=(astyle \\n)

# A simple discription about Tex
#     Tex is a language, but is difficult to understand for human. LaTex is the macro language of Tex.
#     It also can be called a 'format' of Tex. LaTex is easier to use in practice.
#     pdftex and xetex are two compilers that can compile Tex to readable document, such as pdf.
#     xetex includes Unicode but pdftex does not.
#     pdflatex and xelatex are two compiles for latex. Since latex is more useful, in most of time, 
#     pdftex and xetex are the same as pdflatex and xelatex.
GRAPHICLESS_COMPILER=(
    ctags cscope \\n
    cmake make bear ccache \\n
    gcc g++ clang \\n
    python python3 \\n
    texi2any pandoc pdflatex xelatex bibtex latexmk \\n
    rust \\n
    go \\n
)

# ddd is the GUI of gdb
GRAPHICLESS_DEBUGGER=(gdb ddd lldb \\n)
GRAPHICLESS_LS=(
    clangd ccls \\n
    shellcheck \\n
    lua-language-server \\n
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

    for prog in ${prog_list[@]}; do
        if [ ${prog} = "\n" ]; then
            echo
            continue
        fi
        if which ${prog} > /dev/null 2>&1; then
            echo -en "  [y] ${prog}\t"
        else
            echo -en "  [ ] ${prog}\t"
        fi
    done
  done
}

bash_environment()
{
    if [[ ! -f ~/.xmodmap-`uname -n` ]]; then
        echo "~/.xmodmap-`uname -n` is not find"
    fi

    echo "[bash-completion]"
    if [[ ! -f /usr/share/bash-completion/bash_completion ]]; then
        echo "  bash-completion is not installed"
        echo "  Please use packet manager to install it"
        echo "  In OpenSUSE, run: "
        echo "      sudo zypper install bash-completion"
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
