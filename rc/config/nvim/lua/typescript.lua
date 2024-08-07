local status, nvim_lsp = pcall(require, "lspconfig")
if(not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attack = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BugWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.formatting_seq_sync() end
		})
	end
end

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" }
}

