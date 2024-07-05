# cmc.nvim

<!-- panvimdoc-ignore-start -->

![license](https://img.shields.io/github/license/AZarbade/cmc.nvim?style=flat-square)

<!-- panvimdoc-ignore-end -->

Compile My C (cmc). A simple plugin to compile C files.

## Contributing

Feel free to create an issue/PR if you want to see anything else implemented.
If you have some question or need help with configuration, start a [discussion](https://github.com/AZarbade/cmc.nvim/discussions).

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    'AZarbade/cmc.nvim',
    config = function()
        require("cmc.config").setup()
    end,
}

```

## Usage and customization

Currently in-development.

## Todo

- [ ] Async compilation: Perform compilation asynchronously to avoid blocking the editor.
- [ ] Template generation: Provide commands to generate boilerplate code or common C structures.
- [ ] Custom compilation flags: Let users specify additional compilation flags, either globally or per-project.
- [ ] Auto-compilation on save: Option to automatically compile the file when it's saved.
- [ ] Include path management: Allow users to specify additional include paths for header files.
- [ ] Multiple compiler support: Allow users to choose between different compilers (gcc, clang, etc.) and set compiler-specific flags.
- [ ] Makefile integration: If a Makefile is present, use it for compilation instead of direct gcc commands.
- [ ] Debugging integration: Integrate with debugging tools like gdb or lldb.
- [ ] Static analysis: Integrate static analysis tools (like cppcheck or valgrind) and display results.
- [ ] Header/source switching: Quick commands to switch between .c and .h files.
