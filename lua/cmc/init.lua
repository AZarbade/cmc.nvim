local M = {}

local out_name = "main"
local filename = vim.fn.expand("%:t")

M.compile_c = function()
	local command = string.format("gcc %s -o %s", filename, out_name)
	local output = vim.fn.system(command)

	if vim.v.shell_error == 0 then
		print("Compilation successful!")
	else
		print("Compilation failed. Error message:")
		print(output)
	end
end

M.compile_c_debug = function()
	local command = string.format("gcc %s -o %s -g", filename, out_name)
	local output = vim.fn.system(command)

	if vim.v.shell_error == 0 then
		print("Compilation successful!")
	else
		print("Compilation failed. Error message:")
		print(output)
	end
end

return M
