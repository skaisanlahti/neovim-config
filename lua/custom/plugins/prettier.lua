local M = {}

M.is_prettier_filetype = function()
	local filetype = vim.bo.filetype
	return vim.tbl_contains(M.prettier_filetypes, filetype)
end

M.setup = function(filetypes)
	M.prettier_filetypes = filetypes

	vim.api.nvim_create_user_command("Prettier", function()
		if not vim.fn.executable("prettier") == 1 then
			print("Prettier is not installed. Unable to format.")
			return
		end

		local buffer = vim.api.nvim_buf_get_name(0)
		local filename = vim.fn.fnameescape(buffer)
		vim.cmd("silent! %!prettier --stdin-filepath " .. filename)
	end, {})
end

return M
