vim.g.mapleader = " "

local keymap = vim.keymap.set
-- Move a selection up and down (and indent too)
-- Commented out - these are taken care of by Alt+j/k to avoid
-- weird typing conflicts
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- In normal mode allow moving a line up onto the prior
-- line but don't send the cursor to the end of the above line
keymap("n", "J", "mzJ`z")

-- Improve Half page jumping by keeping cursor in center
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- When searching keep the search term in the middle
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- When you've copied something and then want to
-- paste over another word, to avoid copying
-- the word you just pasted over instead it will
-- retain the original word you had copied
keymap("x", "<leader>p", "\"_dP")

-- Allow yank into system clipboard with + register
keymap("n", "<leader>y", "\"+y", { silent=true, desc="Copy to System Clipboard" })
keymap("v", "<leader>y", "\"+y", { silent=true, desc="Copy to System Clipboard" })
keymap("n", "<leader>Y", "\"+Y", { silent=true, desc="Copy to System Clipboard" })

-- Disable capital Q, its just bad
keymap("n", "Q", "<nop>")

-- Close evrything and exit (with extra umph)
keymap("n", "<leader>qq", ":bufdo q!<CR>", { silent=true, desc="Close all and exit" });

-- Less keystrokes to navigate splits
keymap("n", "<C-h>", "<C-w><C-h>", { silent=true, desc="Move to Left Window" });
keymap("n", "<C-j>", "<C-w><C-j>", { silent=true, desc="Move down a Window" });
keymap("n", "<C-l>", "<C-w><C-l>", { silent=true, desc="Move to right Window" });
keymap("n", "<C-k>", "<C-w><C-k>", { silent=true, desc="Move up a Window" });

-- Resize buffers easier
keymap("n", "<C-Up>", ":resize +2<CR>", { silent=true, desc="Horizontal Shrink" })
keymap("n", "<C-Down>", ":resize -2<CR>", { silent=true, desc="Horizontal Expand" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent=true, desc="Vertical Shrink" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent=true, desc="Vertical Expand" })

-- Easier escape from insert mode
keymap("i", "jk", "<ESC>", { silent=true, desc="Exit insert mode" })

-- Easier indents (Shift + < or >)
keymap("v", "<", "<gv", { silent=true, desc="Exit insert mode" })
keymap("v", ">", ">gv", { silent=true, desc="Exit insert mode" })

-- Move lines in normal and visual modes with Alt
-- Visual mode movement allows block moves
keymap("n", "<A-j>", ":m .+1<CR>==", { silent=true, desc="Move Line Down" }) -- move line up(n)
keymap("n", "<A-k>", ":m .-2<CR>==", { silent=true, desc="Move Line Up" }) -- move line down(n)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent=true, desc="Move Line Down" }) -- move line up(v)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent=true, desc="Move Line Up" }) -- move line down(v)

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
