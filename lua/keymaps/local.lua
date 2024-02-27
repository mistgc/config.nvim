local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Vim for Qwerty
map("", "H", "0", {})
map("", "L", "$", {})
map("", "J", "5j", {})
map("", "K", "5k", {})

-- Shortcut for quiting and saving
map("", "Q", ":q<cr>", {})
map("", "S", ":w<cr>", {})

-- Copy and Past from the system clipboard
map("v", "Y", '"+y', {})
map("n", "P", '"+p', {})

-- Some functional configuration
map("n", "<backspace>", "<cmd>noh<cr>", {}) -- cancel highlight that from search
map("n", "<space>", "viw", {}) -- select a word
map("n", "-", "@q", {}) -- play the macro 'q'
map("n", "<c-a>", "gg<s-v>G", {}) -- select all
map("n", "f", "<c-w>w", {}) -- change window
map("n", "<leader>s", "<cmd>vsplit<cr><c-w>w", {})

-- -- NvimTree
-- Open NvimTree
map("n", "<c-e>", "<cmd>NvimTreeToggle<CR>", {})

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

-- Terminal
map("n", "<C-t>", "<cmd>FloatermToggle<CR>", {})
map("t", "<Esc>", "<C-\\><C-n>", {})

-- Terminal
map("n", "<C-t>", "<cmd>FloatermToggle<CR>", {})
