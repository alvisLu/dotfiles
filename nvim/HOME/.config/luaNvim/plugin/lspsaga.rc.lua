local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
  ui = {
    code_action = '', -- '💡'
  },
  outline = {
    keys = {
      toggle_or_open = '<CR>',
    },
  },
  finder = {
    keys = {
      toggle_or_open = '<CR>',
    },
  },
}

local opts = { noremap = true, silent = true }
-- "Lspsaga hover_doc" need install treesitter markdown and markdown_inline parser.
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gf', '<cmd>Lspsaga finder<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opts)

vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'go', '<cmd>Lspsaga outline<CR>', opts)

-- show diagnostic
vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
