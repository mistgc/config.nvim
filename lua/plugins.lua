vim.pack.add { 
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

  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('1.*'),
  },
}

require('gruvbox').setup{ contrast = 'hard' }
vim.cmd.colorscheme('gruvbox')

require("bufferline").setup {
  options = {
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icons = false,
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
  }
}

require('mason').setup {
  ui = {
    keymaps = {
      install_package = 'l',
	}
  }
}

require('mason-lspconfig').setup()

require('oil').setup{
  columns = {
    'icon',
    'permissions',
    'size',
    'mtime',
  }
}

require('mini.icons').setup()

require('lualine').setup {
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
}

require('blink.cmp').setup {
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
  keymap = { preset = 'super-tab'},
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
    }
  }
}
