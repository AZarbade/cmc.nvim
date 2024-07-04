local M = {}

M.compile_c_file = function()
	local filename = vim.fn.expand("%:t")
	local command = string.format("gcc %s -o main -g", filename)

	local output = vim.fn.system(command)

	if vim.v.shell_error == 0 then
		print("Compilation successful!")
	else
		print("Compilation failed. Error message:")
		print(output)
	end
end

return M
