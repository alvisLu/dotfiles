local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    numbers = 'ordinal',
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    buffer_close_icon = "",
    -- buffer_close_icon = '',
    modified_icon = "●",
    close_icon = "",
    -- close_icon = '',
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --   -- remove extension from markdown files for example
    --   if buf.name:match('%.md') then
    --     return vim.fn.fnamemodify(buf.name, ':t:r')
    --   end
    -- end,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,

    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        highlight = "Directory",
        separator = true
      }
    },
  },
  highlights = {
    fill = {
      bg = '#304059', --'#073642'
    },
    background = {
      fg = '#cdcecf', --'#657b83',
      bg = '#283a4f' --'#002b36'
    },
    buffer_visible = {
      fg = '#cdcecf', --'#657b83',
      bg = '#283a4f' --'#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    separator = {
      fg = '#304059', --'#073642',
      bg = '#283a4f' --'#002b36'
    },
    separator_visible = {
      fg = '#304059', --'#073642',
      bg = '#283a4f' --'#002b36'
    },
    separator_selected = {
      fg = '#304059', --'#073642',
    },
    close_button = {
      fg = '#cdcecf', --'#657b83',
      bg = '#283a4f' --'#002b36'
    },
    close_button_visible = {
      fg = '#fdf6e3',
      bg = '#283a4f' --'#002b36'
    },
    close_button_selected = {
      fg = '#fdf6e3',
    },
    numbers = {
      fg = '#cdcecf', --'#657b83',
      bg = '#283a4f' --'#002b36'
    },
    numbers_visible = {
      fg = '#fdf6e3',
      bg = '#283a4f' --'#002b36'
    },
    numbers_selected = {
      fg = '#fdf6e3',
    },
    modified = {
      fg = '#cdcecf', --'#657b83',
      bg = '#283a4f' --'#002b36'
    },
  },
})

vim.keymap.set('n', '<leader>q', '<Cmd>Bdelete<CR>', {})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

vim.keymap.set('n', '<leader>,', '<Cmd>BufferLineMovePrev<CR>', {})
vim.keymap.set('n', '<leader>.', '<Cmd>BufferLineMoveNext<CR>', {})

vim.keymap.set('n', '<leader>1', '<Cmd>lua require("bufferline").go_to_buffer(1, true)<CR>', {})
vim.keymap.set('n', '<leader>2', '<Cmd>lua require("bufferline").go_to_buffer(2, true)<CR>', {})
vim.keymap.set('n', '<leader>3', '<Cmd>lua require("bufferline").go_to_buffer(3, true)<CR>', {})
vim.keymap.set('n', '<leader>4', '<Cmd>lua require("bufferline").go_to_buffer(4, true)<CR>', {})
vim.keymap.set('n', '<leader>5', '<Cmd>lua require("bufferline").go_to_buffer(5, true)<CR>', {})
vim.keymap.set('n', '<leader>6', '<Cmd>lua require("bufferline").go_to_buffer(6, true)<CR>', {})
vim.keymap.set('n', '<leader>7', '<Cmd>lua require("bufferline").go_to_buffer(7, true)<CR>', {})
vim.keymap.set('n', '<leader>8', '<Cmd>lua require("bufferline").go_to_buffer(8, true)<CR>', {})
vim.keymap.set('n', '<leader>9', '<Cmd>lua require("bufferline").go_to_buffer(9, true)<CR>', {})
vim.keymap.set('n', '<leader>0', '<Cmd>lua require("bufferline").go_to_buffer(10, true)<CR>', {})
vim.keymap.set('n', '<leader>=', '<Cmd>lua require("bufferline").go_to_buffer(-1, true)<CR>', {})
