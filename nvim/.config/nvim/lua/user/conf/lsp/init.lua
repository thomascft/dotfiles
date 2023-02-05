local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
mason.setup()

local servers = {"sumneko_lua", "rust_analyzer"}

mason_lspconfig.setup({
	ensure_installed = servers,
})

for _,server in ipairs(servers) do
	lspconfig[server].setup {
    	capabilities = capabilities
  	}
end

-- Floating Diagnostics instead of virtual text

vim.o.updatetime = 250;
vim.diagnostic.config({virtual_text = false})
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
  end,
})

