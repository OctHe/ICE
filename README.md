# Graphicless

Graphicless (GL) is a `dotfile` project that contains a collection of personal-use configurations across a variety of Linux distributions and programs on them.

Install GL is easy:

    git clone --bare https://github.com/OctHe/Graphicless .graphicless
    alias gl='/usr/bin/git --git-dir=$HOME/.graphicless/ --work-tree=$HOME'
    gl checkout

Be careful! `gl checkout` overwritten other personal configuration files.
Please backup them manual.

Since lots of Linux use bash as their default shell.
GL does not directly change the `.bashrc` file.
To enable GL's bash config, use
    
    echo 'source ~/.config/bash/bashrc' >> .bashrc
    source ~/.bashrc


