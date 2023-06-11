local onedark = require('onedark')
if (not onedark) then return end


onedark.setup({
  style = 'darker',
  toggle_style_key = '<leader>ts', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
  colors = {
    -- purple = "#c27fd7",
  },
  highlights = {}
})

vim.cmd("colorscheme onedark")
