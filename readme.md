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
