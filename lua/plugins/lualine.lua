return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
  },
  opts = {
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
    },
  },
}
