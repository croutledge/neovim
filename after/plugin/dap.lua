require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      -- trace = true, -- include debugger info
      name = "(Jest) Debug All",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "(Jest) Debug Current",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
        "${file}",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "(Mocha) Debug All",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/mocha/bin/mocha",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "(Mocha) Debug Current",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/mocha/bin/mocha",
        "${file}",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    }
  }
end

vim.api.nvim_set_hl(0, "red",   { fg = "#8c0000" })
vim.api.nvim_set_hl(0, "green",  { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

vim.fn.sign_define('DiagnosticSignError',   { text='', texthl='red', linehl='DiagnosticSignError', numhl='DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn',    { text='', texthl='yellow', linehl='DiagnosticSignWarn', numhl='DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignHint',    { text='', texthl='green', linehl='DiagnosticSignHint', numhl='DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignInfo',    { text='', texthl='green', linehl='DiagnosticSignInfo', numhl='DiagnosticSignInfo' })

vim.fn.sign_define('DapBreakpoint',          { text='', texthl='red',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='red',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',  { text='', texthl='orange', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapStopped',             { text='', texthl='green',  linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapLogPoint',            { text='', texthl='yellow', linehl='DapBreakpoint', numhl='DapBreakpoint' })

vim.keymap.set("n", "<Leader>db", "<Cmd>lua require'dap'.continue()<CR>", { silent = true, desc = "Debug/Continue" })
vim.keymap.set("n", "<Leader>do", "<Cmd>lua require'dap'.step_over()<CR>", { silent = true, desc = "Step Over" })
vim.keymap.set("n", "<Leader>di", "<Cmd>lua require'dap'.step_into()<CR>", { silent = true, desc = "Step Into" })
vim.keymap.set("n", "<Leader>dt", "<Cmd>lua require'dap'.step_out()<CR>", { silent = true, desc = "Step Out" })
vim.keymap.set("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true, desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true, desc = "Conditional Breakpoint" })
vim.keymap.set("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", { silent = true, desc = "Debug REPL" })
vim.keymap.set("n", "<Leader>bl", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = false, desc = "Log Point" })


