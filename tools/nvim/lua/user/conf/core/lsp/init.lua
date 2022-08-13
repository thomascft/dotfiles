local mason = require ("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require ("lspconfig")

vim.lsp.set_log_level("debug")
mason.setup()

mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.sumneko_lua.setup {
	capabilities = capabilities,
}
lspconfig.rust_analyzer.setup {
	capabilities = capabilities,
}

require((...) .. ".null_ls")
