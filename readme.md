# Goals

This Neovim configuration is a novice attempt at creating a familiar development experience for various languages however it is especially tailored to JS/TS/React development.

# Installation

1. Prepare your Neovim configuration directory 
```shell
# Backup
cp -R ~/.config/nvim ~/.config/nvim-backup
# Clear out the existing configuration
rm -rf ~/.config/nvim
```
2. Clone this repository 
```shell
# Switch your current working directory to your now clear Neovim configuration directory
cd ~/.config/nvim
# Clone into the current directory (note the usage of the trailing period)
git clone https://github.com/croutledge/neovim.git . 
```
 
# Details

* All basic Neovim configuration and the installation of pluggins can be found under /lua/init-nvim
* Plugins are installed using `Packer` (see `/lua/init-nvim/packer.lua`)
* Any keyboard mapping changes that aren't specific to plugins are found under `/lua/init-nvim/remap.lua`
* Plugin specific configuration, once installed, is done so via named lua files under `/after/plugin`
* All other keyboard mappings specific to mapping plugin commands are found undder their plugin directories (see `/after/plugin/...`)
* `init.lua` at the root of this repository is the main entrypoint to neovim
* Any folder name changes should be reflected in `/init.lua` and `/lua/init-nvim/init.lua`

# Plugins

## Bufferline
Bufferline adds familar tabs to Neovim so that each buffer you have open acts just like an open file would in VSCode

## Colors
Simply here to add theming

## Comment
Handy commands for various vim modes to comment code

## DAP
This is the primary component that provides debug support using the same system used by VSCode. Comes with configurations that generally work for most Mocha and Jest tests too in addition to regular JS/TS files

## DAP UI
This provides a familiar visual debug experience during a debug session (like call stack, watch and output windows)

## Fugitive
Do everything you can do with git in the shell but with Vim commands or keybindings

## Harpoon
Picked this one up from the internet, handy way to pin or favorite specific files so you can get back to them quickly

## Lualine
Enhanced per-buffer information about an open file

## Zero LSP (LSP)
Everything involved with intellisense, code diagnostics and code fixes (lint, prettier etc)

## Nvim Tree
A file explorer

## Telescope
Provides ways to find files or things in files within your current working directory/project (much like Ctrl+P or Ctrl+Shift+P)

## Toggleterm
Quick access to your shell/terminal/commandline from within Neovim - no need to jump out to a different windows

## Treesitter
Supports various other plugins and provides better syntax highlighting

## Undotree
Visually see and navigate through your document changes visually

## Vimtest
Primarily used to RUN whole files or tests nearest to your cursor in non-Debug modes

## Vimwiki
Instead of yet-another app to structure and take notes Vimwiki can be accessed and navigated from within Vim at any point
