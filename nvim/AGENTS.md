# Neovim Configuration - Agent Guidelines

## Build/Test Commands
This is a Neovim configuration, not a traditional codebase. Testing is done through Neovim itself.
- **Single test**: `<leader>rt` in Neovim (runs neotest for current file/test)
- **Restart LSP**: `<leader>zig`
- **Formatters**: Uses conform.nvim with stylua (Lua), black --fast (Python), prettierd/prettier (JS/JSON)
- **Format on save**: Enabled automatically
- **Lint**: Uses LSP diagnostics (pyright for Python, lua_ls for Lua)

## Code Style Guidelines

### Structure
- Main config in `lua/joaoflf/` directory
- Plugin configs in `lua/joaoflf/lazy/` following lazy.nvim conventions
- Each plugin gets its own file in the lazy directory
- Modular file structure - separate configs for different plugins

### Lua Conventions
- **Indentation**: 4 spaces (tabs converted to spaces), 80 char line length
- **Python**: 120 char line length allowed
- Quote strings with double quotes
- Function calls without parentheses when single string/table argument
- Local variables preferred over global
- Use `require()` for module imports at function start
- Naming: snake_case for Lua functions/vars
- Comments: Minimal, use `--` for single-line
- Keymaps: Use `vim.keymap.set()`, leader key is `<space>`

### Plugin Configuration
- Return table from plugin files with plugin spec
- Use `config = function()` for setup code
- Dependencies listed in `dependencies` array
- Keymaps defined within plugin config when plugin-specific