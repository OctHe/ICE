#! /usr/bin

sudo apt update
# vim-gnome support system clipboard
# ctags is used to support YCM and taglist in vim
sudo apt install -y make cmake vim-gnome zsh qemu ctags

# install python development tool
sudo apt install -y python-dev python3-dev python-pip python3-pip ipython

# This is the dir for my prjects
mkdir ~/Projects

# install clang and Bear because they are needed for YCM
sudo apt install -y clang
git clone https://github.com/rizsotto/Bear.git ~/Projects/bear

# Install Bear from source
# Bear is used for clang-based programs. https://github.com/rizsotto/Bear
mkdir ~/Projects/bear/build
cd ~/Projects/bear/build
cmake ..
make
sudo make install
sudo make package
cd      # come back to the home dir

# Install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy the default config file for vim, the other plugin is not installed
cp ./vim_setup.vim ~/.vimrc

# Install YouCompleteMe
git clone --recursive https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

# Install tex
sudo apt install -y texlive latexmk

# Install libnl for iw
sudo apt install -y libnl-3-dev libnl-genl-3-dev

# Upgrate installed packages
sudo apt full-upgrade -y

sudo pip install --upgrade pip

# Install shadowsocks
sudo pip install shadowsocks

# Finally, install oh-my-zsh and change the default shell to zsh
# This is must be the final process
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


