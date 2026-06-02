local nvlsp = require "nvchad.configs.lspconfig"

-- override NvChad's on_init to avoid deprecated `client.supports_method`
-- (Neovim 0.11+ requires the colon form `client:supports_method`).
-- NvChad's own on_init (nvchad/configs/lspconfig.lua) still uses the dot
-- form, which warns when an LSP attaches (e.g. opening js/ts files).
-- Remove this override once NvChad fixes it upstream.
nvlsp.on_init = function(client, _)
  if client:supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

-- load defaults i.e lua_lsp (uses the overridden on_init above)
nvlsp.defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" } -- removed "gopls" to disable Go LSP

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.clangd.setup({
		cmd = { "clangd" },  -- Uses system clangd (18.1.3)
		filetypes = { "c", "cpp", "objc", "objcpp" },
		root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git"),
})
