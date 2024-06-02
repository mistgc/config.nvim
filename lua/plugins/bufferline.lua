return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icons = false,
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
    },
  },
}
