---@diagnostic disable: undefined-global
local builtin = require('telescope.builtin')
-- Popup window for finding any files within project
vim.keymap.set('n', '<leader>pf', function()
  -- hidden = true to find stuff like .nvmrc, .gitignore etc
  builtin.find_files({ hidden = true })
end, { silent=true, desc="Find Files" })
-- Popup window for searching only git-controlled files
vim.keymap.set('n', '<C-p>', builtin.git_files, { silent=true, desc="Find (Git) Files" } )
-- Popup for searching within files through files - kinda works
-- but can be a little difficult to work with
-- Searches for the string under your cursor in your current working directory  
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { silent=true, desc="Live Grep" })

vim.keymap.set('n', '<leader>pb', builtin.buffers, { silent=true, desc="Find Buffers" })
-- More search commands exist - see https://github.com/nvim-telescope/telescope.nvim#pickers 
