# Graphicless

Graphicless (GL) is a dotfile and script project across a variety of Linux distributions.

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

The python packages of GL uses virtual environment:

    python3 -m venv .local/share/python/venv/gl/

The packages is installed by

    pip3 install flake8 gitlint vim-vint
