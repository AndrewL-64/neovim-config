return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout= true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
  },

  -- Neovim surround brackets
  {
    'kylechui/nvim-surround', version='*',
  },

  -- Motion plugin for ease of use
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat'
    },
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
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',
  -- 'navarasu/onedark.nvim', -- Theme inspired by Atom
  'sainnhe/gruvbox-material',
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

}
