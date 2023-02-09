---@diagnostic disable: undefined-global
require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  diagnostics = {
    enable = true,
    severity = {
      min = vim.diagnostic.severity.ERROR,
      max = vim.diagnostic.severity.ERROR,
    }
  },
  modified = {
    enable = true,
  },
  renderer = {
    highlight_modified = "all",
    indent_width = 1,
    special_files = { "package.json", "package-lock.json", "Cargo.toml", "Makefile", "README.md", "readme.md", }
  }
})
-- I = toggle git ignored files visibility
-- a = add new file (use trailing slash to create a folder)
-- d = remove file (with prompt)
-- D = super delete a file
-- r = rename
-- x = cut
-- c = copy
-- p = paste
-- f = filter files
-- F = clear the filter

-- Open/Close the file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent=true, desc="Toggle Explorer" })
vim.keymap.set("n", "<leader>fe", ":NvimTreeFocus<CR>", { silent=true, desc="Focus on Explorer" })

