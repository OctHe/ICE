## Coding-in-Vim

Coding-in-vim, or CIM in short, is a terminal-based coding environment that uses vim/neovimm as the editor.
It is benefited by the powerful plugin ecosystem of vim and integrates open-source language servers, compilers, debuggers and other useful tools.

CIM implements common edit, language-specific features (provided by language servers), and debug modules.
The options can be used to configure the default configuration of CIM.

- Neovim
    - Plugin manager
    - UI
    - Text
    - Search
    - Lint
        - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
        - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    - Completion
    - Debug
    - Version control system

The configuration of *neovim* is in master branch, and that of vim is in *vim* branch.

## OpenSUSE

    sudo zypper install git neovim

Then, CIM can be installed by git

    git clone https://github.com/OctHe/Coding-in-Vim ~/.config/nvim

