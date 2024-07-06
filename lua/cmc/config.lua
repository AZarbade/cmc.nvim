local M = {}

function M.setup(opts)
	require("cmc").setup(opts)
	vim.api.nvim_create_user_command("CompileC", function(cmd)
		require("cmc").compile(cmd.args)
	end, { nargs = "*" })

	vim.keymap.set("n", "<leader>cc", function()
		vim.ui.input({ prompt = "Compiler flags: " }, function(input)
			require("cmc").compile(input or "")
		end)
	end, { noremap = true, silent = false })
end

return M
