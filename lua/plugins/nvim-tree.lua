local function attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "e", "", opts(""))
  vim.keymap.del("n", "e", opts(""))

  -- Because the <C-i> means <tab> by default, we have to forbid the <tab>
  -- to make the key mapping <C-i> execute correctly.
  vim.keymap.set("n", "<tab>", "", opts(""))
  vim.keymap.del("n", "<tab>", opts(""))
end

local function config()
  local nvim_tree = require("nvim-tree")
  nvim_tree.setup {
    on_attach = attach,
    disable_netrw = true,
    filesystem_watchers = {
        enable = true,
    },
    renderer = {
      root_folder_label = false,
      highlight_git = false,
      highlight_opened_files = "none",
      indent_markers = {
          enable = false,
      },
    },
  }
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = config,
  keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", mode = "n", desc = "Toggle NvimTree file explorer." }
  }
}
