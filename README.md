# Integrated Configuration Environment

Integrated Configuration Environment (ICE) is a collection of dotfiles.

Installation is easy:

    git clone --bare https://github.com/OctHe/ICE .ice
    alias ice='/usr/bin/git --git-dir=$HOME/.ice/ --work-tree=$HOME'
    ice checkout

Since lots of Linux use bash as their default shell.
The project does not directly change the `.bashrc` file.
To enable Bash's config, use
    
    echo 'source ~/.config/bash/bashrc' >> .bashrc
    source ~/.bashrc

The packages is installed by

    pip3 install flake8 gitlint vim-vint debugpy
