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

-- Copy and Past from the system clipboard
map('v', 'Y', '"+y', {})
map('n', 'P', '"+p', {})

-- Some functional configuration
map('n', '<backspace>', '<cmd>noh<cr>', {}) -- cancel highlight that from search
map('n', '<space>', 'viw', {})              -- select a word
map('n', '-', '@q', {})                     -- play the macro 'q'
map('n', '<c-a>', 'gg<s-v>G', {})           -- select all
map('n', 'f', '<c-w>w', {})                 -- change window
map('n', '<leader>s', '<cmd>vsplit<cr><c-w>w', {})
