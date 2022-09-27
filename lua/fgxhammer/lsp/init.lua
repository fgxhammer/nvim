local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("fgxhammer.lsp.lsp-installer")
require("fgxhammer.lsp.null-ls")
require("fgxhammer.lsp.handlers").setup()
