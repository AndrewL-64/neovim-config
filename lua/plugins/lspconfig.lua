return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
  -- Automatically install LSPs to stdpath for neovim
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- Useful status updates for LSP
  'j-hui/fidget.nvim',
  },
  config = function()
     
     -- Setup mason so it can manage external tooling
     require('mason').setup()
     
     local servers = { 'clangd', 'rust_analyzer', 'pyright', 'lua_ls'}
     
     -- Ensure the servers above are installed
     require('mason-lspconfig').setup {
       ensure_installed = servers,
     }
     for _, lsp in ipairs(servers) do
       require('lspconfig')[lsp].setup {
         on_attach = on_attach,
         capabilities = capabilities,
       }
     end
     -- Make runtime files discoverable to the server
     local runtime_path = vim.split(package.path, ';')
     table.insert(runtime_path, 'lua/?.lua')
     table.insert(runtime_path, 'lua/?/init.lua')
     
     require('lspconfig').lua_ls.setup {
       on_attach = on_attach,
       capabilities = capabilities,
       settings = {
         Lua = {
           runtime = {
             -- Tell the language server which version of Lua you're using (most likely LuaJIT)
             version = 'LuaJIT',
             -- Setup your lua path
             path = runtime_path,
           },
           diagnostics = {
             globals = { 'vim' },
           },
           workspace = {
             library = vim.api.nvim_get_runtime_file('', true),
             checkThirdParty = false,
           },
           -- Do not send telemetry data containing a randomized but unique identifier
           telemetry = { enable = false },
         },
       },
     }
  end
}
