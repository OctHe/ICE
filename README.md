# onePoint

OnePoint is a collection of dotfiles and scripts.

Installation is easy:

    git clone --bare https://github.com/OctHe/OnePoint .onepoint
    alias onepoint='/usr/bin/git --git-dir=$HOME/.onepoint/ --work-tree=$HOME'
    onepoint checkout

Since lots of Linux use bash as their default shell.
The project does not directly change the `.bashrc` file.
To enable Bash's config, use
    
    echo 'source ~/.config/bash/bashrc' >> .bashrc
    source ~/.bashrc

To use the python virtual environment:

    python3 -m venv .local/share/python/venv/onepoint

The packages is installed by

    pip3 install flake8 gitlint vim-vint debugpy
