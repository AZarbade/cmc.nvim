local M = {}

function M.setup(opts)
	require("cmc").setup(opts)

	vim.api.nvim_create_user_command("CompileC", function()
		vim.fn.setqflist({}, "r") -- Clear the quickfix list
		require("cmc").compile_c()
	end, {})

	vim.api.nvim_create_user_command("CompileCDebug", function()
		vim.fn.setqflist({}, "r") -- Clear the quickfix list
		require("cmc").compile_c_debug()
	end, {})

	vim.keymap.set("n", "<leader>cc", function()
		vim.fn.setqflist({}, "r") -- Clear the quickfix list
		require("cmc").compile_c()
	end, { noremap = true, silent = false })

	vim.keymap.set("n", "<leader>cd", function()
		vim.fn.setqflist({}, "r") -- Clear the quickfix list
		require("cmc").compile_c_debug()
	end, { noremap = true, silent = false })
end

return M
