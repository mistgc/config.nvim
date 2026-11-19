vim.pack.add({
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin',
  },
  'https://github.com/neovim/nvim-lspconfig',
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
  'https://github.com/folke/which-key.nvim',
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/mistgc/sshdev.nvim',
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('1.*'),
  },
})

local diffview_actions = require('diffview.actions')
require('diffview').setup({
  keymaps = {
    file_panel = {
      ['j'] = false,
      ['k'] = false,
      ['l'] = false,
      ['i'] = false,
      { 'n', 'n', diffview_actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
      { 'n', 'e', diffview_actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
      { 'n', 'i', diffview_actions.select_entry, { desc = 'Open the diff for the selected entry' } },
      { 'n', 'l', diffview_actions.listing_style, { desc = "Toggle between 'list' and 'tree' views" } },
    },
    file_history_panel = {
      ['j'] = false,
      ['k'] = false,
      ['l'] = false,
      { 'n', 'n', diffview_actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
      { 'n', 'e', diffview_actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
      { 'n', 'i', diffview_actions.select_entry, { desc = 'Open the diff for the selected entry' } },
    },
  },
})

vim.cmd.colorscheme('catppuccin-mocha')

require('fidget').setup()
require('sshdev').setup({
    download_mirror = 'https://gh-proxy.org/https://github.com/neovim/neovim/releases/download'
})

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

require("nvim-tree").setup({
  on_attach = function(bufnr)
      local api = require("nvim-tree.api")
      local function opts(desc)
          return { desc = "nvim-tree" .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      -- Forbid some default keymaps for Nvim-Tree
      vim.keymap.set("n", "e", "", { buffer = bufnr })
      vim.keymap.del("n", "e", { buffer = bufnr })

      vim.keymap.set("n", "E", "", { buffer = bufnr })
      vim.keymap.del("n", "E", { buffer = bufnr })

      vim.keymap.set("n", "F", "", { buffer = bufnr })
      vim.keymap.del("n", "F", { buffer = bufnr })

      vim.keymap.set("n", "f", "", { buffer = bufnr })
      vim.keymap.del("n", "f", { buffer = bufnr })

      vim.keymap.set("n", "<c-e>", "", { buffer = bufnr })
      vim.keymap.del("n", "<c-e>", { buffer = bufnr })

      -- Because the <C-i> means <Tab> defaultly, We have to forbid the <Tab>
      -- to make the key mapping <C-i> execute correctly.
      vim.keymap.set("n", "<Tab>", "", { buffer = bufnr })
      vim.keymap.del("n", "<Tab>", { buffer = bufnr })
  end,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    width = 25,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label = false,
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
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

if require('utils').is_vscode() == false then
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
end

require('conform').setup({
  formatters_by_ft = {
    python = { 'black' },
  },
})

require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

require('nvim-treesitter').install({ 'cpp', 'rust', 'python', 'toml', 'json', 'yaml' })

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

require('which-key').setup({
  preset = 'modern',
  delay = 500,
})
