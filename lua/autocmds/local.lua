local function autocmd(event, opts)
  return vim.api.nvim_create_autocmd(event, opts)
end

autocmd("BufReadPost", {
  pattern = { "*" },
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.api.nvim_exec("normal! g'\"", false)
    end
  end,
})

autocmd("ModeChanged", {
  pattern = { "*" },
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
