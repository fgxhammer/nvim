local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("fg8r.lsp.lsp-installer")
require("fg8r.lsp.null-ls")
require("fg8r.lsp.handlers").setup()
