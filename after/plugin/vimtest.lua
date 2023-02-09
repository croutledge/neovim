---@diagnostic disable: undefined-global
vim.g['test#strategy'] = 'neovim'

vim.keymap.set("n", "<Leader>dn", "<Cmd>TestNearest<CR>", { silent = true, desc = "Run Nearest Test" })
vim.keymap.set("n", "<Leader>df", "<Cmd>TestFile<CR>", { silent = true, desc = "Run Test in File" })
