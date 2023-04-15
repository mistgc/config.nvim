local function autocmd(event, opts)
  return vim.api.nvim_create_autocmd(event, opts)
end

autocmd("BufReadPost", {
  pattern = { "*" },
  callback =
  function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
    vim.api.nvim_exec("normal! g'\"", false)
    end
  end
})
