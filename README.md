# Graphicless

Graphicless (GL) is a `dotfile` project that contains a collection of personal-use configurations across a variety of Linux distributions and programs on them.

Install GL is easy

    git clone --bare https://github.com/OctHe/Graphicless .graphicless
    alias gl='/usr/bin/git --git-dir=$HOME/.graphicless/ --work-tree=$HOME'
    gl checkout

Be careful! `gl checkout` overwritten the origin files, such as `.bashrc` or `.zshrc`.

