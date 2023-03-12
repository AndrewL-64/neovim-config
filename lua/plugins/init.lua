
return {
  {  -- Surround plugin
    "kylechui/nvim-surround",
    version = "*",
    config = function ()
      require("nvim-surround").setup()
    end
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  -- Git related plugins
  'lewis6991/gitsigns.nvim',
  'kdheepak/lazygit.nvim', -- Configures LazyGit TUI inside Neovim
  -- 'navarasu/onedark.nvim', -- Theme inspired by Atom
  'sainnhe/gruvbox-material',
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
}
