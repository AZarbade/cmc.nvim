local M = {}

-- Configuration with default values
local config = {
	output_name = "main.out", -- works
	ask_output_name = false, -- works
	default_flags = "", -- works
	compile_on_save = false, -- works
	use_makefile = false,
}

-- Main compilation function
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
		local input = vim.fn.input("Enter output file name: ")
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
		vim.api.nvim_err_writeln(error)
	end
end

-- Public function to trigger compilation
function M.compile(args)
	compile(args)
end

-- Setup function to initialize the plugin
function M.setup(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})

	-- Set up autocommand for compile on save if enabled
	if config.compile_on_save then
		vim.cmd([[
            augroup CCompileOnSave
                autocmd!
                autocmd BufWritePost *.c lua require'cmc'.compile()
            augroup END
        ]])
	end

	-- Apply default mappings if not disabled
	if opts.default_mappings ~= false then
		M.apply_default_mappings()
	end

	-- Apply user mappings if provided
	if opts.mappings then
		M.apply_user_mappings(opts.mappings)
	end
end

-- Define default mappings
M.default_mappings = {
	compile = "<leader>cc",
}

function M.apply_default_mappings()
	for action, key in pairs(M.default_mappings) do
		vim.api.nvim_set_keymap(
			"n",
			key,
			string.format("<cmd>lua require'cmc'.%s()<CR>", action),
			{ noremap = true, silent = true }
		)
	end
end

function M.apply_user_mappings(user_mappings)
	for action, key in pairs(user_mappings) do
		if M.default_mappings[action] then
			vim.api.nvim_set_keymap(
				"n",
				key,
				string.format("<cmd>lua require'cmc'.%s()<CR>", action),
				{ noremap = true, silent = true }
			)
		end
	end
end

return M
