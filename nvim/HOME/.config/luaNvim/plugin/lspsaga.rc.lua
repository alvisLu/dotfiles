local status, saga = pcall(require, "lspsaga")
if (not status) then return end

-- saga.init_lsp_saga
-- init_lsp_saga 支援到 commit: "b7b4777"
-- https://stackoverflow.com/questions/75105397/my-neovim-setup-but-i-dont-know-how-to-fix-error

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  },
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      jump_to = 'p',
      expand_or_jump = '<CR>',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },
}

local opts = { noremap = true, silent = true }
-- "Lspsaga hover_doc" need install treesitter markdown and markdown_inline parser.
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opts)
vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', opts)

vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'go', '<cmd>Lspsaga outline<CR>', opts)

-- show diagnostic
vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
