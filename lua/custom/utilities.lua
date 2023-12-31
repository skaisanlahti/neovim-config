local Utilities = {}

Utilities.prettier_filetypes = {
	"javascript", "javascriptreact",
	"typescript", "typescriptreact",
	"css", "scss",
	"html",
	"json", "markdown", "yaml"
}

function Utilities.is_prettier_filetype()
	local filetype = vim.bo.filetype
	return vim.tbl_contains(Utilities.prettier_filetypes, filetype)
end

return Utilities
