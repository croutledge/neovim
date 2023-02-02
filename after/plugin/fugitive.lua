vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { silent=true, desc="Git" })
vim.keymap.set("n", "<leader>gdf", ":Gvdiffsplit<CR>", { silent=true, desc="Vertical Git Diff" })
