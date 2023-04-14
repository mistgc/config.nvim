local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Vim for Colemak
map('', 'n', 'j', {})
map('', 'e', 'k', {})
map('', 'i', 'l', {})
map('', 'j', 'e', {})
map('', 'k', 'n', {})
map('', 'l', 'i', {})
map('', 'K', 'N', {})
map('', 'N', '5j', {})
map('', 'E', '5k', {})
map('', 'L', 'I', {})

map('', 'H', '0', {})
map('', 'I', '$', {})

-- Shortcut for quiting and saving
map('', 'Q', ':q<cr>', {})
map('', 'S', ':w<cr>', {})
