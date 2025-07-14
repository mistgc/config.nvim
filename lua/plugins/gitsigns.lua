local utils = require("utils")

local function attach(bufnr)
  local gs = package.loaded.gitsigns
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "<leader>hs", gs.stage_hunk, utils.table_extend(bufopts, { desc = "Git: Stage hunk." }))
  vim.keymap.set("n", "<leader>hr", gs.reset_hunk, utils.table_exend(bufopts, { desc = "Git: Reset hunk" }))
  vim.keymap.set("v", "<leader>hs", function()
    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, utils.table_exend(bufopts, { desc = "Git: Stage hunk" }))
  vim.keymap.set("v", "<leader>hr", function()
    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, utils.table_extend(bufopts, { desc = "Git: Reset hunk" }))
  vim.keymap.set("n", "<leader>hS", gs.stage_buffer, utils.table_extend(bufopts, { desc = "Git: Stage buffer" }))
  vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, utils.table_extend(bufopts, { desc = "Git: Undo stage hunk" }))
  vim.keymap.set("n", "<leader>hR", gs.reset_buffer, utils.table_extend(bufopts, { desc = "Git: Reset buffer" }))
  vim.keymap.set("n", "<leader>hp", gs.preview_hunk, utils.table_extend(bufopts, { desc = "Git: Preview hunk" }))
  vim.keymap.set("n", "<leader>hb", function()
    gs.blame_line({ full = true })
  end, utils.table_extend(bufopts, { desc = "Git: Toggle line blame" }))
  vim.keymap.set(
    "n",
    "<leader>tb",
    gs.toggle_current_line_blame,
    utils.table_extend(bufopts, { desc = "Git: Toggle current line blame" })
  )
  vim.keymap.set("n", "<leader>hd", gs.diffthis, utils.table_extend(bufopts, { desc = "Git: Diff this" }))
  vim.keymap.set("n", "<leader>hD", function()
    gs.diffthis("~")
  end, utils.table_extend(bufopts, { desc = "Git: Diff this with high-lighting" }))
  vim.keymap.set("n", "<leader>td", gs.toggle_deleted, utils.table_extend(bufopts, { desc = "Git: Toggle deleted" }))

  -- Text object
  vim.keymap.set(
    { "o", "x" },
    "lh",
    ":<C-U>Gitsigns select_hunk<CR>",
    utils.table_extend(bufopts, { desc = "Git: Select hunk" })
  )
end

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = attach,
  },
}
