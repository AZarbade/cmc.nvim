local M = {}

function M.setup()
	vim.api.nvim_create_user_command("CompileC", function()
		require("cmc")
	end, {})

	vim.keymap.set("n", "<F5>", require("cmc").compile_c, { noremap = true, silent = false })
end

return M
