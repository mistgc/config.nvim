local function attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "e", "", { buffer = bufnr })
  vim.keymap.del("n", "e", { buffer = bufnr })
  vim.keymap.set("n", "F", "", { buffer = bufnr })
  vim.keymap.del("n", "F", { buffer = bufnr })
  vim.keymap.set("n", "f", "", { buffer = bufnr })
  vim.keymap.del("n", "f", { buffer = bufnr })
end

return attach
