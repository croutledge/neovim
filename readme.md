# Goals

This Neovim configuration is a novice attempt at creating a familiar development experience one would see in VSCode for various languages however it is especially tailored to JS/TS/React development.

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

* All basic Neovim configuration and the installation of pluggins can be found under `/lua/init-nvim`
* Plugins are installed using `Packer` (see `/lua/init-nvim/packer.lua`)
* Any keyboard mapping changes that aren't specific to plugins are found under `/lua/init-nvim/remap.lua`
* Plugin specific configuration, once installed, is done so via named lua files under `/after/plugin`
* All other keyboard mappings specific to mapping plugin commands are found undder their plugin directories (see `/after/plugin/...`)
* `init.lua` at the root of this repository is the main entrypoint to neovim
* Any folder name changes should be reflected in `/init.lua` and `/lua/init-nvim/init.lua`

# Plugins

## Navigation

### [Nvim Tree](https://github.com/nvim-tree/nvim-tree.lua)
A file explorer

### [Harpoon](https://github.com/theprimeagen/harpoon)
Picked this one up from the internet, handy way to pin or favorite specific files so you can get back to them quickly

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)
Provides ways to find files or things in files within your current working directory/project (much like Ctrl+P or Ctrl+Shift+P)

### [Leap](https://github.com/ggandor/leap.nvim)
Faster ways to navigate to the line and column you want without lots of vim ceremony like `/` or `f` bindings

## Debugging

### [DAP](https://github.com/mfussenegger/nvim-dap)
This is the primary component that provides debug support using the same system used by VSCode. Comes with configurations that generally work for most Mocha and Jest tests too in addition to regular JS/TS files

### [DAPUI](https://github.com/rcarriga/nvim-dap-ui)
This provides a familiar visual debug experience during a debug session (like call stack, watch and output windows)

## Editing

### [comment](https://github.com/numtostr/comment.nvim)
Handy commands for various vim modes to comment code

### [Vim Surround](https://github.com/tpope/vim-surround)
Handy bindings to add/modify/delete characters surrounding words, blocks of text or selections in Visual mode

## Testing

### [Vimtest](https://github.com/vim-test/vim-test)
Primarily used to RUN whole files or tests nearest to your cursor in non-Debug modes

## Git

### [LazyGit](https://github.com/kdheepak/lazygit.nvim)
Because I'm lazy and dont like vim as merge tool
* MUST INSTALL: https://github.com/jesseduffield/lazygit

### [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
Indicate changes noticed by Git in the gutter

## Intellisense & Diagnostics 

### [CMP](https://github.com/hrsh7th/nvim-cmp)
Everything involved with intellisense, diagnostics and code fixes (lint, prettier etc)
Also includes additional extensons to cover what may be offered during completion for various languages

### [Vim Signature](https://github.com/kshenoy/vim-signature)
Helper to add gutter indicators for marks

## Terminal

### [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
Quick access to your shell/terminal/commandline from within Neovim - no need to jump out to a different windows
  
## Other

### [WhichKey](https://github.com/folke/which-key.nvim)
A popup that can show you available keybindings and their descriptions if you're unsure of what command you're trying to enter

### [Bufferline](https://github.com/akinsho/bufferline.nvim)
Bufferline adds familar tabs to Neovim so that each buffer you have open acts just like an open file would in VSCode

### [Colors](https://github.com/tomasiser/vim-code-dark)
Simply here to add theming

### [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
Supports various other plugins and provides better syntax highlighting

### [Lualine](https://github.com/nvim-lualine/lualine.nvim)
Enhanced per-buffer information about an open file

### [Undotree](https://github.com/mbbill/undotree)
Visually see and navigate through your document changes visually

### [Vimwiki](https://github.com/vimwiki/vimwiki)
Instead of yet-another app to structure and take notes Vimwiki can be accessed and navigated from within Vim at any point

### [Auto Session](https://github.com/rmagatti/auto-session)
Saves the state of your session based on your CWD
