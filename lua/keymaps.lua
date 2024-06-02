local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Vim for Colemak
map("", "n", "j")
map("", "e", "k")
map("", "i", "l")
map("", "j", "e")
map("", "k", "n")
map("", "l", "i")
map("", "K", "N")
map("", "N", "5j")
map("", "E", "5k")
map("", "L", "I")
map("", "H", "0")
map("", "I", "$")

-- Copy and Pash from the System Clipboard
map("v", "Y", '"+y')
map("n", "P", '"+p')

-- Misc Functional Key Mappings
map("n", "<space>", "viw")
map("n", "<backspace>", "<cmd>noh<cr>")
map("n", "<C-a>", "gg<s-v>G")
map("n", "-", "@q")

-- Cursor Motion between Windows
map("n", "<c-h>", "<c-w>h")
map("n", "<c-n>", "<c-w>j")
map("n", "<c-e>", "<c-w>k")
map("n", "<C-i>", "<c-w>l")
