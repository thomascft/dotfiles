local lspconfig = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")

local servers = { "sumneko_lua", "rust_analyzer", "eslint", "pyright"}

lsp_installer.setup {
    ensure_installed = servers, -- ensure these servers are always installed
    automatic_installation = true,
	ui = {
	    icons = {
		server_installed = "✓",
		server_pending = "➜",
		server_uninstalled = "✗"
        }
    }
}
for _, lsp in pairs(servers) do
    lspconfig [lsp].setup {
    on_attach = on_attach,
  }
end

