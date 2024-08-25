#!/bin/bash
#
# Effective applications for graphicless. This is a bash script, 
# it does not compatible with zsh or other shells

# bash is the default shell for most Linux distributions
# ash is the shell from busybox
# csh is the default shell for FreeBSD
# zsh is the default shell for part of the Linux distributions and macOS
# fish is a ready-out-of-box shell
pl_shell=(
    bash csh ash zsh fish \\n
    ipython3 \\n
)

pl_pkg=(
    flatpak appimage snap apt zypper pacman yay \\n
    pip3 cargo cpanm \\n
)

# bc: A command-line calculator
pl_tool=(
    bat zoxide eza htop \\n
    fastfetch screenfetch neofetch \\n
    flameshot \\n
    terminator konsole \\n
)

# screen and tmux need to set true color
pl_win=(
    screen tmux zellij \\n
)

pl_mail=(thunderbird kmail evolution mutt \\n)

# trans is a network tools that uses translate.google.com (and other online translators).
# It may require http_proxy and https_proxy
pl_net=(
    iw iwctl wpa_cli hostapd_cli nmcli \\n
    ip iptables \\n
    ssh scp sftp rsync \\n
    curl trans   \\n
)

pl_editor=(
    vim nvim emacs kakoune helix micro \\n
    kate gnome-text-editor \\n 
)

# fzf is an interactive filter. It can be integrated with other search tools (such as find and fd)
pl_finder=(
    fd \\n
    fzf \\n
    ugrep ack ag rg \\n
)

# Help manual, PDF viewver, file explorer, and web browser
pl_viewer=(
    man info cheat \\n
    evince zathura okular \\n
    chromium firefox lynx nyxt qutebrowser vimb \\n
    nnn ranger vifm \\n
)

# Command-line tools for tag and lint
# Some lints are python moduels. As an example, install them user-wide with:
#   python3 -m venv /path/to/venv
#   pip3 install pyflakes vim-vint
# xmllint is in the libxml2-utils package, to install it in Debian
#   sudo apt install libxml2-utils
pl_linter=(
    ctags cscope cppcheck cpplint \\n
    pyflakes flake8 \\n
    vint \\n
    gitlint \\n
    xmllint \\n
)

pl_formatter=(
    uncrustify astyle \\n
    black yapf autopep8 \\n
    stylua \\n
)

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
pl_builder=(
    cmake xmake make bazel rpmbuild bear ccache \\n
    gcc g++ clang python3 rust go octave \\n
    graphviz \\n
    doxygen makeinfo pandoc pdflatex xelatex bibtex latexmk \\n
)

# ddd is the GUI of gdb
pl_debugger=(gdb ddd lldb \\n)

pl_langsrv=(
    clangd ccls \\n
    shellcheck \\n
    lua-language-server \\n
)

# osc: openSUSE Commander. The commandline tool for packaging openSUSE packages
pl_vcs=(
    svn  \\n
    git lazygit onefetch \\n
    hg \\n
    osc \\n
)

# Graphicless desktop environment
function pl_status() {
  for arg in $@
  do
    echo ${arg}
    app_name=pl_${arg}[@]
    apps=${!app_name}

    for app in ${apps[@]}; do
        if [ ${app} = "\n" ]; then
            echo
            continue
        fi
        if which ${app} > /dev/null 2>&1; then
            echo -en "  [y] ${app}\t"
        else
            echo -en "  [ ] ${app}\t"
        fi
    done
  done
}

function pl_status_command() {
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

pl_status shell pkg tool win mail net viewer
pl_status editor finder linter formatter builder debugger langsrv vcs

pl_status_command
