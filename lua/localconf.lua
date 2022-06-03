-- local colors = require("galaxyline.themes.colors").doom-one
vim.o.relativenumber = true
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.o.scrolloff = 3
vim.o.expandtab = true
vim.o.wildmenu = true
vim.o.ignorecase = true
vim.o.swapfile = false

-- Markdown-Preview.nvim
vim.g.mkdp_filetypes = { 'markdown' }
vim.cmd('autocmd vimenter *.md exec ":MarkdownPreview"')

