local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
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

-- Shortcut for quiting and saving
map('', 'Q', ':q<cr>', {})
map('', 'S', ':w<cr>', {})

-- About buffers
map('n', ',,', ':vsp<cr>', {})
map('n', '<leader>[]', ':tabedit<cr>', {})
map('n', '{', 'gT', {})
map('n', '}', 'gt', {})
map('n', 'H', '<c-w>h', {})
map('n', 'I', '<c-w>l', {})

-- Quickly edit the configuration
map('n', '<leader>fs', ':tabedit ~/.config/nvim/lua/plugins.lua<cr>', {})

-- Copy and Past from the system clipboard
map('v', 'Y', '"+y', {})
map('n', 'P', '"+p', {})

-- Some functional configuration
map('n', '<backspace>', ':noh<cr>', {})		-- cancel highlight that from search
map('n', '<space>', 'viw', {})				-- select a word
map('n', '-', '@q', {})						-- play the macro 'q'

-- -- Telescope
-- Find file
map("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>", {})
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
