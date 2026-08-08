-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.winbar = "%=%m %f"

-- Show vertical line at column 80
vim.opt.colorcolumn = "80"

-- Use macOS native clipboard directly instead of OSC 52.
-- In a tmux + nested-terminal (claudecode.nvim) setup, OSC 52 sequences leak
-- as literal `52;c;<base64>` garbage on the screen when yanking. pbcopy/pbpaste
-- avoids emitting any escape sequence.
if vim.fn.has("mac") == 1 and vim.fn.executable("pbcopy") == 1 then
  vim.g.clipboard = {
    name = "pbcopy/pbpaste",
    copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
    paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
    cache_enabled = 0,
  }
end
