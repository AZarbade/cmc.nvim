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

	-- autocommand for compile on save
	if opts.compile_on_save then
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*.c",
			callback = function()
				require("cmc").compile()
			end,
		})
	end
end

return M
