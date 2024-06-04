local function attach(bufnr)
  local gs = package.loaded.gitsigns
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "<leader>hs", gs.stage_hunk, bufopts)
  vim.keymap.set("n", "<leader>hr", gs.reset_hunk, bufopts)
  vim.keymap.set("v", "<leader>hs", function()
    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, bufopts)
  vim.keymap.set("v", "<leader>hr", function()
    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, bufopts)
  vim.keymap.set("n", "<leader>hS", gs.stage_buffer, bufopts)
  vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, bufopts)
  vim.keymap.set("n", "<leader>hR", gs.reset_buffer, bufopts)
  vim.keymap.set("n", "<leader>hp", gs.preview_hunk, bufopts)
  vim.keymap.set("n", "<leader>hb", function()
    gs.blame_line({ full = true })
  end, bufopts)
  vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, bufopts)
  vim.keymap.set("n", "<leader>hd", gs.diffthis, bufopts)
  vim.keymap.set("n", "<leader>hD", function()
    gs.diffthis("~")
  end, bufopts)
  vim.keymap.set("n", "<leader>td", gs.toggle_deleted, bufopts)

  -- Text object
  vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", bufopts)
end

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = attach,
  },
}
