# Neovim Configuration

A minimal Neovim configuration using the native `vim.pack.add()` plugin system (no plugin manager).

## Features

- **Colemak Keymap Layout** — Navigation keys remapped for Colemak keyboard users
- **Native Plugin Management** — Uses Neovim's built-in `vim.pack.add()` with version locking
- **Self-Extracting Installer** — Build portable installers via GitHub Actions
- **LSP Support** — Configured for Lua, C/C++, Python, and Rust
- **Modern UI** — Gruvbox theme, bufferline, lualine, and which-key

## Plugins

| Plugin | Purpose |
|--------|---------|
| blink.cmp | Completion with Rust fuzzy matching |
| telescope.nvim | Fuzzy finder |
| oil.nvim | File explorer |
| conform.nvim | Formatting |
| gitsigns.nvim | Git integration |
| trouble.nvim | Diagnostics list |
| nvim-treesitter | Syntax highlighting |
| mason.nvim | LSP server management |
| which-key.nvim | Keymap discovery |

## Keymaps (Colemak Layout)

Navigation keys are remapped:
- `n` → down (j)
- `e` → up (k)
- `i` → right (l)
- `j` → end of word (e)
- `k` → next search (n)
- `l` → insert mode (i)

### Useful Keymaps

| Keymap | Action |
|--------|--------|
| `-` | Open oil.nvim file explorer |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>cf` | Format buffer |
| `<leader>xx` | Toggle Trouble diagnostics |
| `gh` | LSP hover |
| `gd` | LSP goto definition |

## Requirements

- Neovim 0.10+ (for `vim.pack.add()` and `vim.lsp.enable()`)
- Rust (for blink.cmp fuzzy matching compilation)
- tree-sitter-cli (for parser compilation)

## Installation

### Manual

Clone this repository to your Neovim config directory:

```bash
git clone https://github.com/mistgc/config.nvim ~/.config/nvim
```

Run Neovim to install plugins and treesitter parsers:

```bash
nvim --headless -c 'quit'
nvim --headless -c 'lua require("nvim-treesitter").install({ "cpp", "rust", "python" }):wait()' -c 'quit'
```

### Self-Extracting Installer

Download the pre-built installer from [Releases](https://github.com/mistgc/config.nvim/releases) and run:

```bash
sudo ./packed-nvim.run
```

This installs:
- Neovim binary to `/opt/nvim`
- Config to `~/.config/nvim`
- Pre-compiled plugins and parsers to `~/.local/share/nvim`

To uninstall:

```bash
sudo ./packed-nvim.run --uninstall
```

## Building the Installer Locally

```bash
OUTPUT_FILE_PATH=./packed-nvim.run ./scripts/pack-nvim.sh
```

## Development

### Formatting

Format Lua files with StyLua:

```bash
stylua .
```

### Pre-commit Hooks

```bash
pre-commit run --all-files
```

## File Structure

```
├── init.lua              # Entry point
├── lua/
│   ├── options.lua       # Vim options
│   ├── keymaps.lua       # Colemak keymaps
│   ├── plugins.lua       # Plugin loading and setup
│   ├── extra_keymaps.lua # Plugin-specific keymaps
│   ├── lsp.lua           # LSP configuration
│   ├── autocmd.lua       # Autocommands
│   └── utils.lua         # Helper functions
├── scripts/
│   └ pack-nvim.sh        # Installer builder script
├── nvim-pack-lock.json   # Plugin version locks
└── .github/workflows/
│   └── release.yml       # GitHub Actions release workflow
```

## License

MIT
