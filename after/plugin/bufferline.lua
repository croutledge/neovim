---@diagnostic disable: undefined-global
require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
       {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "Directory",
          separator = true -- use a "true" to enable the default, or set your own character
       }
    },
    indicator = {
      style = 'underline',
    },
    show_tab_indicators = true,
  }
})

-- Quickly cycle through each buffer tab
vim.keymap.set("n", "<leader>h", ":BufferLineCyclePrev<CR>", { silent=true, desc="Next Buffer" })
vim.keymap.set("n", "<leader>l", ":BufferLineCycleNext<CR>", { silent=true, desc="Previous Buffer" })
vim.keymap.set("n", "<leader>bfp", ":BufferLineTogglePin<CR>", { silent=true, desc="Toggle Buffer Pin" })
