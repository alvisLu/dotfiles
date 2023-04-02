local status, diffview = pcall(require, "diffview")
if (not status) then return end

diffview.setup {
}


vim.keymap.set('n', 'dh', '<cmd>DiffviewFileHistory<CR>')
vim.keymap.set('n', 'do', '<cmd>DiffviewOpen<CR>')
vim.keymap.set('n', 'dc', '<cmd>DiffviewClose<CR>')
vim.keymap.set('n', 'dr', '<cmd>DiffviewRefresh<CR>')
