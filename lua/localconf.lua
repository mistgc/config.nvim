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
-- Allow corsor to cross line boundaries.
vim.o.whichwrap = vim.o.whichwrap..',<,>,h,l'

-- Lua
vim.cmd.colorscheme('tokyonight-moon')

-- Markdown-Preview.nvim
-- vim.g.mkdp_filetypes = { 'markdown' }
-- vim.cmd('autocmd vimenter *.md exec ":MarkdownPreview"')

-- vim.cmd([[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]])
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"", false)
        end
    end
})
