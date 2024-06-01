local function autocmd(event, opts)
  return vim.api.nvim_create_autocmd(event, opts)
end

autocmd("BufReadPost", {
  pattern = { "*" },
  callback = function()
    local line_index = vim.fn.line("'\"")
    local max_line = vim.fn.line("$")

    if line_index > 1 and line_index <= max_line then
      vim.api.nvim_exec("normal! g'\"", false)
    end
  end,
})
