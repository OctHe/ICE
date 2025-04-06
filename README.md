# onePoint

OnePoint is a dotfile and script project across a variety of Linux distributions.

Installation is easy:

    git clone --bare https://github.com/OctHe/OnePoint .onepoint
    alias onepoint='/usr/bin/git --git-dir=$HOME/.onepoint/ --work-tree=$HOME'
    onepoint checkout

Be careful! `onepoint checkout` overwritten other personal configuration files.
Please backup them manual.

Since lots of Linux use bash as their default shell.
PL does not directly change the `.bashrc` file.
To enable PL's bash config, use
    
    echo 'source ~/.config/bash/bashrc' >> .bashrc
    source ~/.bashrc

The python packages of PL uses virtual environment:

    python3 -m venv .local/share/python/venv/onepoint

The packages is installed by

    pip3 install flake8 gitlint vim-vint debugpy
