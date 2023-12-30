-- prettier.lua
--
-- Enable prettier for related file types
local function format_with_prettier()
	if vim.fn.executable('prettier') == 0 then
		print('Prettier is not installed')
		return
	end
	vim.cmd('Prettier')
end

local file_types = {
	'javascript', 'typescript', 'css', 'scss', 'html', 'json'
}

return {
	'custom/prettier',
	config = function()
		for _, ft in ipairs(file_types) do
			local group = vim.api.nvim_create_augroup('PrettierFormat_' .. ft, { clear = true })
			vim.api.nvim_create_autocmd({ 'BufWritePre', 'InsertLeave' }, {
				group = group,
				pattern = '*.' .. ft,
				callback = format_with_prettier
			})
		end
	end
}
