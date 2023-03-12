return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    vim.o.timeout= true
    vim.o.timeoutlen = 300
    wk.setup {
      key_labels = {
        ["<space>"] = "SPC",
        ["<tab>"] = "TAB",
        ["<cr>"] = "RET",
      }
    }
    wk.register({
      {
        mode = { "n", "v"},
        ["<leader>f"] = { name = "+find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>w"] = { name = "+workspace" },
      },
      {
        mode = { "n" },
        ["y"] = { name = "+Add Surround" },
        ["ys"] = { name = "Normal" },
        ["yss"] = { name = "Current Line" },
        ["yS"] = { name = "Normal w/ Newlines" },
        ["ySS"] = { name = "Current Line w/ Newlines" },
        ["ds"] = { name = "Surround" },
        ["cs"] = { name = "Surround" },
      },
      {
        mode = { "v" },
        ["gS"] = { name = "Surround Line (Visual)" },
      },
    })
  end
}
