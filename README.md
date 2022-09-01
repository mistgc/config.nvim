# NeoVim for Colemak

## Introduction
The repository is about configuration of **NeoVim (v0.5.0+)** for **Colemak** user. And here is common keymaps:

|Qwerty|Colemak|
|--|--|
|h (left)|h|
|j (down)|n|
|k (up)|e|
|l (right)|i|
|i (insert)|l|
|e (end of the word)|j|
|n (next search result)|k|
|N (previous search result)|K|

## Plugin Manager

[packer.nvim](https://github.com/wbthomason/packer.nvim): A use-package inspired plugin manager for NeoVim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config.

## Features

- LSP
- Dashboard
- File Search
- Easy Comment
- Directory Tree
- Theme ([doom-one.nvim](https://github.com/NTBBloodbath/doom-one.nvim))
- Debugger Adapt Protocol (not configured yet...)

## Usage

```bash
# Clone the repository.
git clone --depth 1 https://github.com/zaiic/nvim.git

# Install the plugin manager (packer.nvim) for Unix/Linux.
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install the plugin manager (packer.nvim) for Windows.
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

Then enter NeoVim and execute the following command:
```bash
:PackerSync
:PackerCompile
```
