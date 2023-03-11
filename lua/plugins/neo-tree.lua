return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  version = "v2.x",
  config = function ()
    vim.keymap.set("n", "<Leader>t", "<Cmd>Neotree toggle<CR>")
    require("neo-tree").setup ({
    })
  end
}
