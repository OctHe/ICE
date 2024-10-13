# Packless

Packless (PL) is a dotfile and script project across a variety of Linux distributions.

Install PL is easy:

    git clone --bare https://github.com/OctHe/Packless .packless
    alias pl='/usr/bin/git --git-dir=$HOME/.packless/ --work-tree=$HOME'
    pl checkout

Be careful! `pl checkout` overwritten other personal configuration files.
Please backup them manual.

Since lots of Linux use bash as their default shell.
PL does not directly change the `.bashrc` file.
To enable PL's bash config, use
    
    echo 'source ~/.config/bash/bashrc' >> .bashrc
    source ~/.bashrc

The python packages of PL uses virtual environment:

    python3 -m venv .local/share/python/venv/pl

The packages is installed by

    pip3 install flake8 gitlint vim-vint debugpy
