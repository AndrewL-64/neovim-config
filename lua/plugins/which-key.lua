return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    vim.o.timeout= true
    vim.o.timeoutlen = 300
    wk.setup {
      replace = {
        {"<space>", "SPC" },
        {"<tab>", "TAB" },
        {"<cr>", "RET" },
      }
    }
    wk.add(
    {
      {
        mode = { "n", "v"},
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>w", group = "workspace" },
        { "<leader>d", group = "document" },
        { "<leader>r", group = "rename" },
        { "<leader>c", group = "code" },
        { "<leader>v", group = "virtual env" },
      },
    })
  end
}
