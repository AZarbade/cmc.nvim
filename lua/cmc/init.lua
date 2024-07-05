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
		print("No file open")
		return
	end

	if not filename:match("%.c$") then
		print("Not a C file")
		return
	end

	local out_name = get_output_name()
	local debug_flag = debug and " -g" or ""
	local command = string.format("gcc %s -o %s%s", filename, out_name, debug_flag)
	local output = vim.fn.system(command)

	if vim.v.shell_error == 0 then
		print("Compilation successful! Output: " .. out_name)
	else
		print("Compilation failed. Error message:")
		print(output)
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
