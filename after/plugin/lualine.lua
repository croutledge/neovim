---@diagnostic disable: undefined-global
local function shortVimMode()
  local mode = string.upper(vim.api.nvim_get_mode().mode)
  if mode == 'N' then
    return 'NRM'
  end
  if mode == 'C' then
    return 'CMD'
  end
  if mode == 'V' then
    return 'VIS'
  end
  if mode == 'I' then
    return 'INS'
  end
  return mode
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'everforest',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {shortVimMode},
    lualine_b = {'diff',
      {
        'diagnostics',
        sources = { 'nvim_lsp', 'nvim_diagnostic' },
        sections = { 'error' },
        symbols = { error = '', warn = '', info = '', hint = '' },
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = '',      -- Text to show when the file is modified.
          readonly = '',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '', -- Text to show for unnamed buffers.
          newfile = '',     -- Text to show for newly created file before first write
        }
      }
    },
    lualine_x = {'branch' },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'}
}
