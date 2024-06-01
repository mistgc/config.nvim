local keys = {
  { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Find files." },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Find file througn live filter." },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n", desc = "Find buffers" },
  { "<leader>fm", "<cmd>Telescope marks<cr>", mode = "n", desc = "Find marks" },
}

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "sharkdp/fd",
  },
  keys = keys,
}
