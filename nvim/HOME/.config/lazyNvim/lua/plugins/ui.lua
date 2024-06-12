return {
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "famiu/bufdelete.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>qq", "<Cmd>Bdelete<CR>", desc = "Quit buf" },
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buf" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buf" },
      { "<leader>.", "<Cmd>BufferLineMoveNext<CR>", desc = "Move Next buf" },
      { "<leader>,", "<Cmd>BufferLineMovePrev<CR>", desc = "Move Prev buf" },

      { "<leader>1", "<Cmd>lua require('bufferline').go_to_buffer(1, true)<CR>", desc = "Go to 1 tab" },
      { "<leader>2", "<Cmd>lua require('bufferline').go_to_buffer(2, true)<CR>", desc = "Go to 2 tab" },
      { "<leader>3", "<Cmd>lua require('bufferline').go_to_buffer(3, true)<CR>", desc = "Go to 3 tab" },
      { "<leader>4", "<Cmd>lua require('bufferline').go_to_buffer(4, true)<CR>", desc = "Go to 4 tab" },
      { "<leader>5", "<Cmd>lua require('bufferline').go_to_buffer(5, true)<CR>", desc = "Go to 5 tab" },
      { "<leader>6", "<Cmd>lua require('bufferline').go_to_buffer(6, true)<CR>", desc = "Go to 6 tab" },
      { "<leader>7", "<Cmd>lua require('bufferline').go_to_buffer(7, true)<CR>", desc = "Go to 7 tab" },
      { "<leader>8", "<Cmd>lua require('bufferline').go_to_buffer(8, true)<CR>", desc = "Go to 8 tab" },
      { "<leader>9", "<Cmd>lua require('bufferline').go_to_buffer(9, true)<CR>", desc = "Go to 9 tab" },
      { "<leader>0", "<Cmd>lua require('bufferline').go_to_buffer(10, true)<CR>", desc = "Go to 10 tab" },
      { "<leader>=", "<Cmd>lua require('bufferline').go_to_buffer(-1, true)<CR>", desc = "Go to last tab" },
    },
    opts = {
      options = {
        numbers = "ordinal",
        mode = "buffers",
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            highlight = "Directory",
          },
        },
      },
    },
  },
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        theme = "onedark",
      },
    },
  },
}
