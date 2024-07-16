return {
  "stevearc/oil.nvim",
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
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
