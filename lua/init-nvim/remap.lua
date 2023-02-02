vim.g.mapleader = " "
-- Move a selection up and down (and indent too)
-- Commented out - these are taken care of by Alt+j/k to avoid
-- weird typing conflicts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- In normal mode allow moving a line up onto the prior
-- line but don't send the cursor to the end of the above line
vim.keymap.set("n", "J", "mzJ`z")

-- Improve Half page jumping by keeping cursor in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When searching keep the search term in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When you've copied something and then want to
-- paste over another word, to avoid copying
-- the word you just pasted over instead it will
-- retain the original word you had copied
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Allow yank into system clipboard with + register
vim.keymap.set("n", "<leader>y", "\"+y", { silent=true, desc="Copy to System Clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { silent=true, desc="Copy to System Clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { silent=true, desc="Copy to System Clipboard" })

-- Disable capital Q, its just bad
vim.keymap.set("n", "Q", "<nop>")

-- Quick fix list (via grep) allow for key bindings to nav up and down
-- to what is found instead of just commands
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Less keystrokes to navigate splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { silent=true, desc="Move to Left Window" });
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { silent=true, desc="Move down a Window" });
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { silent=true, desc="Move to right Window" });
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { silent=true, desc="Move up a Window" });

-- Location list (via lgrep) is local to the open windows
-- in Vim instead of regular grep which is global
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Move lines in normal and visual modes with Alt
-- Visual mode movement allows block moves
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent=true, desc="Move Line Down" }) -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent=true, desc="Move Line Up" }) -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent=true, desc="Move Line Down" }) -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent=true, desc="Move Line Up" }) -- move line down(v)

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
