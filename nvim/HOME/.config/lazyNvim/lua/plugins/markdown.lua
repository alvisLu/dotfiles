return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = false,
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = false,
      },
    },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, opts)
      require("render-markdown").disable()
      require("render-markdown").setup(opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = require("render-markdown").get,
        set = require("render-markdown").set,
      }):map("<leader>um")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        -- nvim-lint 是用 stdin 把內容餵給 markdownlint-cli2，而它在 stdin 模式下
        -- 只會從 cwd 找設定檔、不會往上翻父目錄；在 repo 子目錄開 nvim 就會讀不到
        -- repo root 的 .markdownlint-cli2.jsonc，於是套用內建預設值（MD013 上限 80）。
        -- 註冊成函式，每次 lint 時才動態把 cwd 指到專案根目錄。
        ["markdownlint-cli2"] = function()
          local linter = vim.deepcopy(require("lint.linters.markdownlint-cli2"))
          linter.cwd = vim.fs.root(0, {
            ".markdownlint-cli2.jsonc",
            ".markdownlint-cli2.yaml",
            ".markdownlint.jsonc",
            ".markdownlint.json",
            ".markdownlint.yaml",
            ".git",
          }) or vim.fn.getcwd()
          return linter
        end,
      },
    },
  },
}
