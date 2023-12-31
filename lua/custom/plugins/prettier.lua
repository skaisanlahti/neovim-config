local prettier_filetypes = {
	"javascript", "javascriptreact",
	"typescript", "typescriptreact",
	"css", "scss",
	"html",
	"json", "markdown", "yaml"
}

local function is_prettier_filetype()
	local filetype = vim.bo.filetype
	return vim.tbl_contains(prettier_filetypes, filetype)
end

local function setup()
	local is_installed = false

	if vim.fn.executable("prettier") == 1 then
		is_installed = true
	else
		print("Prettier is not installed. Use Mason to install.")
	end

	vim.api.nvim_create_user_command("Prettier", function()
		if not is_installed then return end
		local buffer = vim.api.nvim_buf_get_name(0)
		local filename = vim.fn.fnameescape(buffer)
		vim.cmd("silent! %!prettier --stdin-filepath " .. filename)
	end, {})
end

return {
	setup = setup,
	filetypes = prettier_filetypes,
	is_prettier_filetype = is_prettier_filetype
}
