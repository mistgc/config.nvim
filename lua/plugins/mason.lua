return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  opts = {
    ui = {
      keymaps = {
        install_package = "l",
      },
    },
  },
}
