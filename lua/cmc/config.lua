local M = {}

function M.setup(opts)
	require("cmc").setup(opts)

	vim.api.nvim_create_user_command("CompileC", function()
		require("cmc").compile_c()
	end, {})

	vim.api.nvim_create_user_command("CompileCDebug", function()
		require("cmc").compile_c_debug()
	end, {})

	vim.keymap.set("n", "<leader>cc", require("cmc").compile_c, { noremap = true, silent = false })
	vim.keymap.set("n", "<leader>cd", require("cmc").compile_c_debug, { noremap = true, silent = false })
end

return M
