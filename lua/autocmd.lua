local autocmd = require('utils').autocmd

autocmd('BufReadPost', {
  pattern = { '*' },
  callback = function()
    local line_index = vim.fn.line('\'"')
    local max_line = vim.fn.line('$')

    if line_index > 1 and line_index <= max_line then
      vim.api.nvim_exec('normal! g\'"', false)
    end
  end,
})

autocmd('FileType', {
  pattern = { 'rust', 'python', 'c', 'lua', 'cpp', 'markdown' },
  callback = function()
    local max_file_size = 512 * 1024 -- 512 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size < max_file_size then
      vim.treesitter.start() -- highlighting
      -- NOTE: do NOT set indentexpr here. The nvim-treesitter indent module is
      -- not maintained/reliable, and a non-empty indentexpr overrides the
      -- built-in 'cindent' (enabled by default for C/C++ in nvim 0.12).
    end
  end,
})
