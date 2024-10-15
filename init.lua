local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('plugins')

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Set tabstop to 4 spaces
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a tab
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Make line numbers default
vim.wo.number = true

-- Color line for vertical line length
vim.o.colorcolumn = '132'

-- Disable mouse mode
vim.o.mouse = ''
-- vim.cmd.aunmenu{'PopUp.How-to\\ disable\\ mouse'}
-- vim.cmd.aunmenu{'PopUp.-1-'}

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Relative line number
vim.o.relativenumber = true

-- Font and font size
vim.o.guifont = "Hack Nerd Font:h12"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 8

-- Turn show mode off since we are using lualine
vim.o.showmode = false

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Stop adding newline to end of files (Windows)
vim.o.fixeol = false
vim.o.fixendofline = false

-- Set line feed to LF
vim.o.fileformats = 'unix,dos'

-- Clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Set colorscheme
vim.o.termguicolors = true
-- vim.cmd [[colorscheme catppuccin-mocha]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Conceal markup in .norg files
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, { pattern = {"*.norg"}, command = "set conceallevel=3" })

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', '<C-c>', '<Esc>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'Y', 'yg$', { silent = true })

-- Turn off ex mode
vim.keymap.set('n', 'Q', '<Nop>', {silent = true})

-- Move visual block lines with J and Keymaps
vim.keymap.set('v', 'J', ':m \'> +1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'< -2<CR>gv=gv')

-- Keep cursor at same position when using J
vim.keymap.set('n', 'J', 'mzJ`z')
-- Center cursor when using <C-u> and <C-d>
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Enable LazyGit
vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = "LazyGit", silent = true })

-- Enable Comment.nvim
require('Comment').setup()

-- -- Configure surround settings such that they don't conflict with leap.nvim
-- -- Taken from https://github.com/ggandor/leap.nvim/discussions/38
-- vim.g["surround_no_mappings"] = 1
--
-- -- Just the defaults copied here.
-- vim.keymap.set("n", "ds", "<Plug>Dsurround")
-- vim.keymap.set("n", "cs", "<Plug>Csurround")
-- vim.keymap.set("n", "cS", "<Plug>CSurround")
-- vim.keymap.set("n", "ys", "<Plug>Ysurround")
-- vim.keymap.set("n", "yS", "<Plug>YSurround")
-- vim.keymap.set("n", "yss", "<Plug>Yssurround")
-- vim.keymap.set("n", "ySs", "<Plug>YSsurround")
-- vim.keymap.set("n", "ySS", "<Plug>YSsurround")
--
-- -- The conflicting ones. Note that `<Plug>(leap-cross-window)`
-- -- _does_ work in Visual mode, if jumping to the same buffer,
-- -- so in theory, `gs` could be useful for Leap too...
-- vim.keymap.set("x", "gs", "<Plug>VSurround")
-- vim.keymap.set("x", "gS", "<Plug>VgSurround")

-- Enable 'leap.nvim'
-- require('leap').add_default_mappings()

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>t', '<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[T]elescope file browser'})

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'vimdoc', 'dockerfile', 'javascript', 'html', 'css' },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic'})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
