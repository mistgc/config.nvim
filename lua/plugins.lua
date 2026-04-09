vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/ellisonleao/gruvbox.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/folke/trouble.nvim',

  {
    src = 'https://github.com/neovim-treesitter/nvim-treesitter',
    version = 'main',
  },
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('1.*'),
  },
})

require('fidget').setup()

require('gruvbox').setup({ contrast = 'hard' })
vim.cmd.colorscheme('gruvbox')

require('bufferline').setup({
  options = {
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icons = false,
    separator_style = 'thin',
    diagnostics = 'nvim_lsp',
    always_show_bufferline = false,
  },
})

require('mason').setup({
  ui = {
    keymaps = {
      install_package = 'l',
    },
  },
})

require('mason-lspconfig').setup()

require('oil').setup({
  columns = {
    'icon',
    'permissions',
    'size',
    'mtime',
  },
})

require('mini.icons').setup()

require('lualine').setup({
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      },
    },
  },
})

require('blink.cmp').setup({
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
  keymap = { preset = 'super-tab' },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },
  sources = {
    default = {
      'lsp',
      'path',
      'snippets',
      'buffer',
    },
  },
})

require('conform').setup({
  formatters_by_ft = {
    python = { 'black' },
  },
})

require('nvim-treesitter.config').setup({
  ensure_installed = { 'lua' },
  install_dir = vim.fn.stdpath('data') .. '/site',
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 500 * 1024 -- 500 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})

require('gitsigns').setup({
  on_attach = function(bufnr)
    local utils = require('utils')
    local gs = package.loaded.gitsigns
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, utils.table_extend(bufopts, { desc = 'Git: Stage hunk.' }))
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, utils.table_extend(bufopts, { desc = 'Git: Reset hunk' }))
    vim.keymap.set('v', '<leader>hs', function()
      gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, utils.table_extend(bufopts, { desc = 'Git: Stage hunk' }))
    vim.keymap.set('v', '<leader>hr', function()
      gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, utils.table_extend(bufopts, { desc = 'Git: Reset hunk' }))
    vim.keymap.set('n', '<leader>hS', gs.stage_buffer, utils.table_extend(bufopts, { desc = 'Git: Stage buffer' }))
    vim.keymap.set(
      'n',
      '<leader>hu',
      gs.undo_stage_hunk,
      utils.table_extend(bufopts, { desc = 'Git: Undo stage hunk' })
    )
    vim.keymap.set('n', '<leader>hR', gs.reset_buffer, utils.table_extend(bufopts, { desc = 'Git: Reset buffer' }))
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, utils.table_extend(bufopts, { desc = 'Git: Preview hunk' }))
    vim.keymap.set('n', '<leader>hb', function()
      gs.blame_line({ full = true })
    end, utils.table_extend(bufopts, { desc = 'Git: Toggle line blame' }))
    vim.keymap.set(
      'n',
      '<leader>tb',
      gs.toggle_current_line_blame,
      utils.table_extend(bufopts, { desc = 'Git: Toggle current line blame' })
    )
    vim.keymap.set('n', '<leader>hd', gs.diffthis, utils.table_extend(bufopts, { desc = 'Git: Diff this' }))
    vim.keymap.set('n', '<leader>hD', function()
      gs.diffthis('~')
    end, utils.table_extend(bufopts, { desc = 'Git: Diff this with high-lighting' }))
    vim.keymap.set('n', '<leader>td', gs.toggle_deleted, utils.table_extend(bufopts, { desc = 'Git: Toggle deleted' }))

    -- Text object
    vim.keymap.set(
      { 'o', 'x' },
      'lh',
      ':<C-U>Gitsigns select_hunk<CR>',
      utils.table_extend(bufopts, { desc = 'Git: Select hunk' })
    )
  end,
})

require('trouble').setup()
