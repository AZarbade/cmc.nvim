local M = {}

local config = {
	output_name = "main",
	ask_output_name = false,
}

local function get_output_name()
	if config.ask_output_name then
		local input = vim.fn.input("Enter output name: ")
		return input ~= "" and input or config.output_name
	end
	return config.output_name
end

local function compile(debug)
	local filename = vim.fn.expand("%:t")
	if filename == "" then
		vim.api.nvim_err_writeln("No file open")
		return
	end

	if not filename:match("%.c$") then
		vim.api.nvim_err_writeln("Not a C file")
		return
	end

	local out_name = get_output_name()
	local debug_flag = debug and " -g" or ""
	local command = string.format("gcc %s -o %s%s", filename, out_name, debug_flag)

	vim.o.errorformat = [[%f:%l:%c: %t%*[^:]: %m]]
	local output = vim.fn.system(command)

	if vim.v.shell_error == 0 then
		vim.api.nvim_echo({ { "Compilation successful! Output: " .. out_name, "Normal" } }, true, {})
	else
		vim.api.nvim_err_writeln("Compilation failed. See quickfix list for details.")
	end
end

M.compile_c = function()
	compile(false)
end

M.compile_c_debug = function()
	compile(true)
end

M.setup = function(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})
end

return M
