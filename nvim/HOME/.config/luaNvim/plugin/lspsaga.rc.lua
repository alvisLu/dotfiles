local status, saga = pcall(require, "lspsaga")
if (not status) then return end

-- saga.init_lsp_saga
-- init_lsp_saga 支援到 commit: "b7b4777"
-- https://stackoverflow.com/questions/75105397/my-neovim-setup-but-i-dont-know-how-to-fix-error

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'go', '<cmd>LSoutlineToggle<CR>', opts)
vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
