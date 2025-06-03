return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  priority = 1000,
  lazy = false,
  config = true,
  opts = {
    contrast = "hard",
  },
  init = function()
    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
  end,
}
