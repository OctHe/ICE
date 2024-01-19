# Graphicless

Graphicless (GL) is a `dotfile` project that contains a collection of personal-use configurations across a variety of Linux distributions and programs on them.

Install GL is easy

    git clone --bare https://github.com/OctHe/Graphicless .graphicless
    alias gl='/usr/bin/git --git-dir=$HOME/.graphicless/ --work-tree=$HOME'
    gl checkout

Since lots of Linux uses bash as its default shell.
GL does not directly change `.bashrc` file.
To enable GL's bash config, use
    
    source ~/.config/bash/bashrc

Be careful! `gl checkout` overwritten other personal configuration files.
Please backup it manual.

