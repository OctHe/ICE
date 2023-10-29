#!/bin/bash
#
# Effective programs for graphicless. This is a bash script, 
# it does not compatible with zsh or other shells

# bash is the default shell for most Linux distributions
# ash is the shell from busybox
# csh is the default shell for FreeBSD
# zsh is the default shell for part of the Linux distributions and macOS
# fish is a ready-out-of-box shell
GRAPHICLESS_SHELL=(
    bash csh ash zsh fish \\n
    ipython ipython3 \\n
)

GRAPHICLESS_PKT=(
    flatpak snap apt zypper pacman yay \\n
    pip pip3 \\n
)

# screen and tmux need to set true color
GRAPHICLESS_TOOL=(
    find fd fzf \\n
    grep ack ag rg \\n
    terminator \\n
    screen tmux \\n
    htop \\n
    neofetch \\n
)

# osc: openSUSE Commander. The commandline tool for packaging openSUSE packages
GRAPHICLESS_VCS=( svn git osc \\n )

# trans is a network tools that uses translate.google.com (and other online translators).
# It may require http_proxy and https_proxy
GRAPHICLESS_NETWORK=(
    iw iwctl wpa_cli hostapd_cli nmcli \\n
    ip iptables \\n
    ssh scp sftp rsync \\n
    curl trans   \\n
)

GRAPHICLESS_EDITOR=(
    vim nvim helix micro \\n
    emacs \\n
    kate gnome-text-editor \\n 
)

GRAPHICLESS_MAIL=(
    thunderbird kmail evolution \\n
    mutt \\n
)

# Help manual, PDF viewver, file explorer, and web browser
GRAPHICLESS_VIEWER=(
    man info cheat cppman \\n
    evince zathura okular \\n
    chromium firefox lynx nyxt vimb \\n
    nnn ranger vifm \\n
)

# xmllint is in the libxml2-utils package, to install it in Debian
#   sudo apt install libxml2-utils
GRAPHICLESS_FORMATTER=(astyle xmllint \\n)

# rpmbuild is the buildtool in for rpm.
# As an example, download and build the source code with
#     sudo zypper source-install hostapd
#     cd /usr/src/packages
#     sudo rpmbuild -ba SPECS/hostapd.spec
# A simple discription about Tex:
#     Tex is a language, but is difficult to understand for human. LaTex is the macro language of Tex.
#     It also can be called a 'format' of Tex. LaTex is easier to use in practice.
#     pdftex and xetex are two compilers that can compile Tex to readable document, such as pdf.
#     xetex includes Unicode but pdftex does not.
#     pdflatex and xelatex are two compiles for latex. Since latex is more useful, in most of time, 
#     pdftex and xetex are the same as pdflatex and xelatex.
GRAPHICLESS_COMPILER=(
    ctags cscope \\n
    cmake make rpmbuild bear ccache \\n
    gcc g++ clang \\n
    python python3 \\n
    doxygen texi2any pandoc pdflatex xelatex bibtex latexmk \\n
    rust \\n
    go \\n
    groff \\n
)

# ddd is the GUI of gdb
GRAPHICLESS_DEBUGGER=(gdb ddd lldb \\n)

GRAPHICLESS_LS=(
    clangd ccls \\n
    shellcheck \\n
    lua-language-server \\n
)

# Graphicless desktop environment
function gl_de()
{
  for arg in $@
  do
    echo ${arg}
    case ${arg} in
        shell)
            prog_list=${GRAPHICLESS_SHELL[@]}
            ;;
        package_management)
            prog_list=${GRAPHICLESS_PKT[@]}
            ;;
        network)
            prog_list=${GRAPHICLESS_NETWORK[@]}
            ;;
        tool)
            prog_list=${GRAPHICLESS_TOOL[@]}
            ;;
        mail)
            prog_list=${GRAPHICLESS_MAIL[@]}
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

function gl_bash_env()
{
    if [[ ! -f ~/.xmodmap-`uname -n` ]]; then
        echo "~/.xmodmap-`uname -n` is not find"
    fi

    echo "[bash-completion]"
    if [[ ! -f /usr/share/bash-completion/bash_completion ]]; then
        echo "  bash-completion is not installed"
        echo "  Please use packet manager to install it"
        echo "  In openSUSE, run: "
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

gl_de shell package_management tool network viewer mail
gl_de editor formatter compiler debugger server

gl_bash_env
