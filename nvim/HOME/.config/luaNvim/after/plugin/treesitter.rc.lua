local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "toml",
    "json",
    "yaml",
    "css",
    "html",
    "bash",
    "lua"
  },

  autotag = {
    enable = true,
  },
  ts_context_commentstring = {
    enable = true,
    enable_autocmd = true
  }
}
vim.g.skip_ts_context_commentstring_module = true

-- fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false


local M = {}
-- function to create a list of commands and convert them to autocommands
-------- REF: https://www.jmaguire.tech/posts/treesitter_folding/
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup ' .. group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

local autoCommands = {
  -- other autocommands
  open_folds = {
    { "BufReadPost,FileReadPost", "*", "normal zR" }
  }
}
M.nvim_create_augroups(autoCommands)

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript", "jsx", "tsx", "vue" }
