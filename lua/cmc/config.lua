local M = {}

function M.setup()
	vim.api.nvim_create_user_command("CMCHello", function()
		require("cmc").hello()
	end, {})

	vim.keymap.set("n", "<leader>ch", require("cmc").hello, { noremap = true, silent = false })
end

return M
