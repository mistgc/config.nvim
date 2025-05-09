return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open parent directory." },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
