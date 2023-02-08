-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer is the tool managing all other plugins
  -- Packer can manage itself
  use { "wbthomason/packer.nvim" }

  -- Fuzzy finder (e.g. find file in current working dir, etc)
  -- See /after/plugin/telescope.lua
  use {
	  "nvim-telescope/telescope.nvim", tag = "0.1.0",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- Dependency for nvim-tree to give icons to files
  use "nvim-tree/nvim-web-devicons"

  -- File explorer (Ctrl+e) 
  -- See /after/plugin/nvimtre
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly" -- optional, updated every week. (see issue #1193)
  }

  -- Color theme for vim in general that will be close to vscode dark theme
  -- See /after/plugin/colors.lua
  use {
    "tomasiser/vim-code-dark",
    as = "codedark",
    config = function()
      vim.cmd("colorscheme codedark")
    end
  }

  -- For each buffer that's open a 'tab' will appear at the top of the 
  -- terminal (see remap file for changes to cycle thru tabs)
  -- See /after/plugin/bufferline.lua
  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons"
  }

  -- Improve NeoVIMS ability to highlight code
  -- by hooking into VIM features around parsing
  use { "nvim-treesitter/nvim-treesitter",
    {
      run = ":TSUpdate"
    }
  }

  -- If you feel like writing plugins use this tool
  -- to see the underbelly of your plugin(s) in action
  use { "nvim-treesitter/playground" }

  -- Handy tool that acts as a way to pin important files
  -- See /after/plugin/harpoon.lua
  use { "theprimeagen/harpoon" }

  -- The ability to navigate your undo tree
  -- See /after/plugin/undotree.lua
  use { "mbbill/undotree" }

  -- Perform git commands from within VIM without
  -- needing to always have a separate
  -- See /after/plugin/fugitive.lua
  use { "tpope/vim-fugitive" }

  -- The whole apparatus for supporting working with code
  -- Includes intellisense, code actions etc
  -- Can configure it for lots of various languages
  -- see the specific plugin config for more
  -- See /after/plugin/lsp.lua
  use { 'hrsh7th/nvim-cmp' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use {
    "L3MON4D3/LuaSnip"
  }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- Configure a better status line for NeoVIM
  -- See /after/plugin/lualine.lua
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true
    }
  }

  -- Better context aware commenting of code
  use { "numToStr/Comment.nvim" }

  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  }

  use {
    "mfussenegger/nvim-dap",
    requires = {
       "mxsdev/nvim-dap-vscode-js",
       {
         "microsoft/vscode-js-debug",
         opt = true,
         run = "npm install --legacy-peer-deps && npm run compile",
         tag = 'v1.74.1'
       },
     }
    }

  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"}
  }

  use { "vim-test/vim-test" }

  use { "vimwiki/vimwiki" }

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  }

  use { "tpope/vim-surround" }
end)
