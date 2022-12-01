local mason = require ("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require ("lspconfig")

vim.lsp.set_log_level("debug")
mason.setup()

mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.sumneko_lua.setup {
	capabilities = capabilities,
}
lspconfig.rust_analyzer.setup {
	capabilities = capabilities,
}

require((...) .. ".null_ls")
