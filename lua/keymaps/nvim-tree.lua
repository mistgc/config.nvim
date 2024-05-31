local function attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- Forbid some default keymaps for Nvim-Tree
  vim.keymap.set("n", "e", "", { buffer = bufnr })
  vim.keymap.del("n", "e", { buffer = bufnr })

  vim.keymap.set("n", "F", "", { buffer = bufnr })
  vim.keymap.del("n", "F", { buffer = bufnr })

  vim.keymap.set("n", "f", "", { buffer = bufnr })
  vim.keymap.del("n", "f", { buffer = bufnr })

  vim.keymap.set("n", "<c-e>", "", { buffer = bufnr })
  vim.keymap.del("n", "<c-e>", { buffer = bufnr })

  -- Because the <C-i> means <Tab> defaultly, We have to forbid the <Tab>
  -- to make the key mapping <C-i> execute correctly.
  vim.keymap.set("n", "<Tab>", "", { buffer = bufnr })
  vim.keymap.del("n", "<Tab>", { buffer = bufnr })
end

return attach
