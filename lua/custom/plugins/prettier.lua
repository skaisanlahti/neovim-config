local utils = require("custom.utilities")

local function setup()
	if vim.fn.executable("prettier") == 0 then
		print("Prettier is not installed")
		return
	end

	vim.api.nvim_create_user_command("Prettier", function()
		vim.cmd("%!prettier --stdin-filepath " .. vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)))
	end, {})

	local group = vim.api.nvim_create_augroup("CustomPrettier", { clear = true })

	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			if utils.is_prettier_filetype() then
				vim.cmd("Prettier")
			end
		end,
		group = group
	})
end

return {
	setup = setup
}
