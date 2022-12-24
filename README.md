# Neovim Configuration

<div>
<p>
    <a>
      <img alt="Windows" src="https://img.shields.io/badge/Windows-%23.svg?style=flat-square&logo=windows&color=0078D6&logoColor=white" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
      <img src="https://img.shields.io/badge/Neovim-v0.9.0-green?logo=neovim" alt="Neovim minimum version"/>
    </a>
</p>
</div>

This repository holds my Neovim configuration files. This Neovim configuration file is directly inspired by [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and also [ThePrimeagen](https://www.youtube.com/@ThePrimeagen)'s config files. The configuration should directly work in Linux and Windows, not yet tested for Mac.

## Installation
To install, you need a working version of Neovim. Take a look at the Neovim resources for building from [source](https://github.com/neovim/neovim/wiki/Building-Neovim). Once Neovim is installed, Create a folder called `nvim` in `~/.config/` and run `git clone https://github.com/AndrewL-64/neovim-config.git` in your `~/.config/nvim/` folder.

### Debug Adapter Setup
This configuration uses `nvim-dap` to set up debuggers. For the C/C++/Rust debug adapter, download the `cpptools` adapter following these [instructions](https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)), and move the extension folder to `~/.config/nvim/`.

## Notable Plugins
- [Packer.nvim](https://github.com/wbthomason/packer.nvim): Lua-based plugin manager
- [Nvim-Lspconfig](https://github.com/neovim/nvim-lspconfig): Helps with installing LSPs
- [Vim-Hardtime](https://github.com/takac/vim-hardtime): For developing better vim habits (optional)
- [Alpha-nvim](https://github.com/goolord/alpha-nvim): Customizable startup screen
- [Nvim-surround](https://github.com/kylechui/nvim-surround): For better surround manipulation.
- [Leap.nvim](https://github.com/ggandor/leap.nvim): Motion plugin for faster workflow.
- [Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Used in conjunction with a LSP to simulate IDE features such as syntax highlighting and snippets.
- [Vim-fugitive](https://github.com/tpope/vim-fugitive): Vim wrapper for Git
- [Vim-rhubarb](https://github.com/tpope/vim-rhubarb): Allows for Github integration within Neovim
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Fuzzy Finder for Nvim


## Screenshots
![image](https://user-images.githubusercontent.com/70496262/209270717-dfab4b8f-3b5c-4d8c-8301-c2ecc3d0f6a5.png)
![image](https://user-images.githubusercontent.com/70496262/209270801-363894e7-866e-41e8-8461-ac47cfc80a83.png)



