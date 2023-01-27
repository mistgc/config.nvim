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

-- About buffers
map('n', ',,', '<cmd>sp term://${SHELL}<cr><c-w>x<c-w>w', {})
map('n', '<leader>[]', '<cmd>tabedit<cr>', {})
map('n', '{', '<cmd>bp<cr>', {})
map('n', '}', '<cmd>bn<cr>', {})
map('n', 'tx', '<cmd>bd<cr><cmd>bp<cr>', {})

-- Quickly edit the configuration
map('n', '<leader>fs', '<cmd>tabedit ~/.config/nvim/<cr>', {})

-- Copy and Past from the system clipboard
map('v', 'Y', '"+y', {})
map('n', 'P', '"+p', {})

-- Some functional configuration
map('n', '<backspace>', '<cmd>noh<cr>', {}) -- cancel highlight that from search
map('n', '<space>', 'viw', {}) -- select a word
map('n', '-', '@q', {}) -- play the macro 'q'
map('n', '<c-a>', 'gg<s-v>G', {}) -- select all
map('n', 'f', '<c-w>w', {}) -- change window
map('n', '<leader>s', '<cmd>vsplit<cr><c-w>w', {})

-- -- NvimTree
-- Open NvimTree
map("n", "<c-e>", "<cmd>NvimTreeToggle<CR>", {});

-- -- Telescope
-- Find file
map("n", "<c-f>", "<cmd>Telescope find_files theme=dropdown<CR>", {})
-- Find word
map("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<CR>", {})
-- Find special sample
map("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", {})
-- check help doc
map("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", {})
-- check recent files
map("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<CR>", {})
-- find marks
map("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", {})

-- -- Terminal
map("n", "<C-t>", "<cmd>FloatermToggle<CR>", {})
map("t", "<Esc>", "<C-\\><C-n>", {})
