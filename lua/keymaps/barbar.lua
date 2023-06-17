local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Move to previous/next
map("n", "<A-,>", "<cmd>BufferPrevious<CR>", {})
map("n", "<A-.>", "<cmd>BufferNext<CR>", {})
-- Re-order to previous/next
map("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", {})
map("n", "<A->>", "<cmd>BufferMoveNext<CR>", {})
-- Goto buffer in position...
map("n", "<A-1>", "<cmd>BufferGoto 1<CR>", {})
map("n", "<A-2>", "<cmd>BufferGoto 2<CR>", {})
map("n", "<A-3>", "<cmd>BufferGoto 3<CR>", {})
map("n", "<A-4>", "<cmd>BufferGoto 4<CR>", {})
map("n", "<A-5>", "<cmd>BufferGoto 5<CR>", {})
map("n", "<A-6>", "<cmd>BufferGoto 6<CR>", {})
map("n", "<A-7>", "<cmd>BufferGoto 7<CR>", {})
map("n", "<A-8>", "<cmd>BufferGoto 8<CR>", {})
map("n", "<A-9>", "<cmd>BufferGoto 9<CR>", {})
map("n", "<A-0>", "<cmd>BufferLast<CR>", {})
-- Pin/unpin buffer
map("n", "<A-p>", "<cmd>BufferPin<CR>", {})
-- Close buffer
map("n", "<A-c>", "<cmd>BufferClose<CR>", {})
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- map('n', '<C-p>', '<cmd>BufferPick<CR>', {})
