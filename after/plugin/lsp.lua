---@diagnostic disable: undefined-global
local lsp = require('lsp-zero')

lsp.preset('recommended')

-- Can call :Mason to choose to install more later
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'dockerls',
	'bashls',
	'html',
	'pylsp',
	'yamlls',
	'sumneko_lua'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete()
})

lsp.set_preferences({
	sign_icons = { }
})

-- Every time a buffer is opened attach these mappings so that there
-- is some basic kinds of code navigation handy

-- FOR MORE BINDING INFO:
-- To see what can be invoked on the LSP run the following command
-- :help vim.lsp.*
-- For preconfigured keybindings go to:
-- See: https://github.com/neovim/nvim-lspconfig
lsp.on_attach(function (client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	-- The only reason these are specified here is to
  -- make these available even if there's not a supporting lsp for the current buffer
	-- so that Vim will do a best attempt regardless
  -- "Go to Definition"
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = false, desc="Go To Definition"})
  -- Shift+k - "View documentation of element under the cursor"
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc="Signature Info"})
  -- Kind of a find all for the current file
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = false, desc="View Workspace Symbol"})
  -- View errors/warnings & other messages when underlined 
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false, desc="Go To Definition"})
  -- Jump to next error or warning 
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = false, desc="Next Diagnostic"})
  -- Jump to previous error or warning
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = false, desc="Previous Diagnostic"})
  -- "See suggestions/fixes"
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc="Open Code Actions"})
  -- "Find all References"
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = false, desc="View References"})
  -- Self descriptive...
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc="Rename Symbol"})
end)

lsp.setup()
