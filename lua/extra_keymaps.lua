-- =====================================================
-- Telescope
-- =====================================================
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

-- =====================================================
-- Comform
-- =====================================================
vim.keymap.set('', '<leader>cf', function()
  require('conform').format({ async = true, lsp_fallback = true })
end, { desc = 'Format buffer.' })

-- =====================================================
-- Trouble
-- =====================================================
vim.keymap.set('', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
vim.keymap.set(
  '',
  '<leader>xX',
  '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  { desc = 'Buffer Diagnostics (Trouble)' }
)
vim.keymap.set('', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
vim.keymap.set(
  '',
  '<leader>cl',
  '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
  { desc = 'LSP Definitions / references / ... (Trouble)' }
)
vim.keymap.set('', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
vim.keymap.set('', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })

-- =====================================================
-- Which-key
-- =====================================================
vim.keymap.set('', '<leader>?', function()
  require('which-key').show({ global = false })
end, { desc = 'Buffer local keymaps (whick-key)' })
