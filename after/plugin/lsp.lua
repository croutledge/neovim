---@diagnostic disable: undefined-global
require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'dockerls',
    'bashls',
    'html',
    'pyright',
    'yamlls',
    'sumneko_lua'
  }
})

vim.o.completeopt="menuone,preview,noinsert"

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  -- Create your keybindings here...
   -- make these available even if there's not a supporting lsp for the current buffer
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
end

local lspconfig = require('lspconfig')
local get_servers = require('mason-lspconfig').get_installed_servers

for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
  })
end

