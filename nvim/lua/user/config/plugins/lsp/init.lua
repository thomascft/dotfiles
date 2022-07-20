local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
lsp_installer.setup {
    ensure_installed = {"rust_analyzer", "sumneko_lua"},
    automatic_installation = true,
	ui = {
	    icons = {
		server_installed = "✓",
		server_pending = "➜",
		server_uninstalled = "✗"
        }
    }
}



for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {
      capabilities = capabilities,
  }
end

