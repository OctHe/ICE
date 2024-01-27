#!/bin/bash
#
# Collection of awesome open source projects

gl_shell=(
    Bash-it/bash-it \\n
    ohmyzsh/ohmyzsh \\n
    fish-shell/fish-shell \\n
)

gl_pkg=(
    flatpak/flatpak
    Jguer/yay \\n
    pypa/pip \\n
    rust-lang/cargo \\n
)

gl_tool=(
    sharkdp/bat ajeetdsouza/zoxide eza-community/eza htop-dev/htop \\n
    dylanaraps/neofetch \\n
    flameshot-org/flameshot \\n
    gnome-terminator/terminator \\n
)

gl_win=(
    tmux/tmux \\n
)

gl_net=(
    soimort/translate-shell \\n
)

# TODO: Plugins for vim and neovim
gl_editor=(
    vim/vim
    neovim/neovim \\n
    mawww/kakoune \\n
    helix-editor/helix \\n
    zyedidia/micro \\n
)

gl_finder=(
    sharkdp/fd junegunn/fzf \\n
    Genivia/ugrep beyondgrep/ack3 ggreer/the_silver_searcher BurntSushi/ripgrep \\n
)

# Help manual, PDF viewver, file explorer, and web browser
gl_viewer=(
    cheat/cheat \\n
    atlas-engineer/nyxt qutebrowser/qutebrowser fanglingsu/vimb \\n
    jarun/nnn ranger/ranger vifm/vifm \\n
)

gl_code=(universal-ctags/ctags danmar/cppcheck llvm/llvm-project \\n)

gl_build=(
    xmake-io/xmake rizsotto/Bear ccache/ccache \\n
    python/cpython rust-lang/rust golang/go \\n
    jgm/doxygen/doxygen pandoc \\n
)

gl_langsrv=(
    MaskRay/ccls \\n
    koalaman/shellcheck \\n
    LuaLS/lua-language-server \\n
)

# Get repos info
function gl_repos() {
  for arg in $@
  do
    echo ${arg}
    app_name=gl_${arg}[@]
    apps=${!app_name}

    for app in ${apps[@]}; do
        if [ ${app} = "\n" ]; then
            echo
            continue
        fi
        echo -en " ${app} [star: $(curl -s https://api.github.com/repos/${app} | jq '.stargazers_count')]\t"
    done
  done
}


gl_repos shell pkg tool win net editor finder viewer code build langsrv

