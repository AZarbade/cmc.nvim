local M = {}

function M.setup()
	vim.api.nvim_create_user_command("CompileC", function()
		require("cmc").compile_c_file()
	end, {})

	vim.keymap.set("n", "<F5>", require("cmc").compile_c_file, { noremap = true, silent = false })
end

return M
