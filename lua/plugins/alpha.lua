return {
  "goolord/alpha-nvim", -- A fast and fully customizable greeter for neovim
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require('alpha')
    local theme = require('alpha.themes.theta')
    local dashboard = require('alpha.themes.dashboard')
    local fortune = require('alpha.fortune')
    dashboard.section.footer.val = fortune()
    local config = theme.config
    -- Change buttons here
    local buttons = {
      type = "group",
      val = {
        { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("n", "  New file", "<cmd>ene<CR>"),
        dashboard.button("r", "  Load Last Session", "<cmd>lua require('persistence').load({ last = true })<CR>"),
        dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
        -- dashboard.button("SPC F", "  Live grep"),
        dashboard.button("c", "  Configuration", "<cmd>e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("u", "  Update plugins", "<cmd>Lazy check<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
      },
      position = "center",
    }

    local end_text = {
      type = "text",
      val = "Quotes",
      opts = {
        position = "center",
        hl = "SpecialComment",
      },
    }
    
    local header = {
      [[                                                                   ]],
      [[      ████ ██████           █████      ██                    ]],
      [[     ███████████             █████                            ]],
      [[     █████████ ███████████████████ ███   ███████████  ]],
      [[    █████████  ███    █████████████ █████ ██████████████  ]],
      [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
      [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
      [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
    }

    local function header_vals()
      local lines = {}
      for i, chars in pairs(header) do
        local line = {
          type = "text",
          val = chars,
          opts = {
            hl = "StartLogo" .. i,
            shrink_margin = false,
            position = "center",
          },
        }
        table.insert(lines, line)
      end
      local output = {
        type = "group",
        val = lines,
        opts = { position = "center", },
      }
      return output
    end

    config.layout[2] = header_vals()
    config.layout[6] = buttons
    table.insert(config.layout, { type = "padding", val = 2 } )
    table.insert(config.layout, end_text)
    table.insert(config.layout, dashboard.section.footer)
    config.opts = { margin = 5 }
    alpha.setup(config)
  end
}
