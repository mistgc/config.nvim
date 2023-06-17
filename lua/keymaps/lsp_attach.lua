local function attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", bufopts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", bufopts)
  vim.keymap.set("n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", bufopts)
  vim.keymap.set("n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", bufopts)
  vim.keymap.set("n", "<leader>cn", "<cmd>Lspsaga rename<CR>", bufopts)
  vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", bufopts)
  vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  vim.keymap.set("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  vim.keymap.set("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", bufopts)
  vim.keymap.set("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", bufopts)
  vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", bufopts)
end

return attach
