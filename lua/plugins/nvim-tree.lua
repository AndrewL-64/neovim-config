return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  version = "nightly",
  config = function ()
    require("nvim-tree").setup ({
      vim.keymap.set("n", "<Leader>t", "<Cmd>NvimTreeToggle<CR>")
    })
  end
}
