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
      mode = { "n", "v"},
      ["<leader>s"] = { name = "+search" },
      ["<leader>g"] = { name = "+git" },
    })
  end
}
