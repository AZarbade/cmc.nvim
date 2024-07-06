local M = {}

local config = {
	output_name = "main",
	ask_output_name = false,
	default_flags = "",
}

local function compile(args)
	local filename = vim.fn.expand("%:t")
	if filename == "" then
		vim.api.nvim_err_writeln("No file open")
		return
	end
	if not filename:match("%.c$") then
		vim.api.nvim_err_writeln("Not a C file")
		return
	end

	local out_name = config.output_name
	if config.ask_output_name then
		local input = vim.fn.input("Enter output name: ")
		out_name = input ~= "" and input or config.output_name
	end

	local user_args = args or ""
	local command = string.format("gcc %s %s %s -o %s", user_args, config.default_flags, filename, out_name)

	vim.api.nvim_echo({ { "Compiling...", "Normal" } }, false, {})
	local output = vim.fn.system(command)

	if vim.v.shell_error == 0 then
		vim.api.nvim_echo({ { "Compilation successful! Output: " .. out_name, "Normal" } }, true, {})
	else
		local error = string.format("ERROR: Compilation failed. Error: %s", output)
		vim.api.nvim_echo({ { error, "ErrorMsg" } }, false, {})
	end
end

M.compile = function(args)
	compile(args)
end

M.setup = function(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})
end

return M
