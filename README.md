# 🚀 cmc.nvim: Compile My C

<!-- panvimdoc-ignore-start -->

![license](https://img.shields.io/github/license/AZarbade/cmc.nvim?style=flat-square)

<!-- panvimdoc-ignore-end -->

Welcome to cmc.nvim, a Neovim plugin that makes compiling C handy.

## 🌟 Features

- 🔧 Compile C files right from Neovim - no terminal juggling required!
- 🎛️ Customize compiler flags on the fly
- 🔥 Hot reload with compile-on-save
- More coming soon...

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{ 'AZarbade/cmc.nvim' }
```

## ⚙️ Configuration

```lua
require('cmc').setup({
  output_name = "a.out",            -- Be a rebel, don't use "main"

  -- Sets the default name for compiled executables.
  -- Default: main.out

  ask_output_name = false,          -- Ain't nobody got time for that

  -- If true, prompts for output name before each compilation
  -- If false, uses output_name (defined above)
  -- Default: false

  default_flags = "-Wall -Wextra",  -- Show ALL the warnings!

  -- Compiler flags used in every compilation
  -- Default: ""

  compile_on_save = true,           -- Ride the lightning!

  -- If true, compiles C files automatically on save
  -- Default: false
})
```

## 🎮 Usage

- `:CompileC [args]` - Compile with optional arguments
- `<leader>cc` - Prompt for compiler flags and compile
- `compile_on_save = true` - Save your C file and watch the magic happen! ✨

## Known Issues

- [x] Compile progress is not shown.
  - It shows a simple 'compiling...' msg.
- [x] If compile fails it is silent.
  - It shows an error message, but not the error output itself.
- [ ] Have not tested big projects w/ long compile times.

## 🎭 Contributing

Feel free to create an issue/PR if you want to see anything else implemented.
If you have some question or need help with configuration, start a [discussion](https://github.com/AZarbade/cmc.nvim/discussions).

## 📜 License

[MIT License](https://github.com/AZarbade/cmc.nvim/blob/main/LICENSE)

## Todo

- [x] Custom compilation flags: Let users specify additional compilation flags, either globally or per-project.
- [x] Auto-compilation on save: Option to automatically compile the file when it's saved.
- [ ] Template generation: Provide commands to generate boilerplate code or common C structures.
- [ ] Async compilation: Perform compilation asynchronously to avoid blocking the editor.
- [ ] Include path management: Allow users to specify additional include paths for header files.
- [ ] Multiple compiler support: Allow users to choose between different compilers (gcc, clang, etc.) and set compiler-specific flags.
  - [ ] GCC
  - [ ] Clang
  - [ ] TinyCC
- [ ] Makefile integration: If a Makefile is present, use it for compilation instead of direct gcc commands.
- [ ] Debugging integration: Integrate with debugging tools like gdb or lldb.
- [ ] Static analysis: Integrate static analysis tools (like cppcheck or valgrind) and display results.
- [ ] Header/source switching: Quick commands to switch between .c and .h files.
