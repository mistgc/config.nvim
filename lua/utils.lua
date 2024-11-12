local M = {}

function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

function M.os_capture(cmd, raw)
  local f = assert(io.popen(cmd, "r"))
  local s = assert(f:read("*a"))
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, "^%s+", "")
  s = string.gsub(s, "%s+$", "")
  s = string.gsub(s, "[\n\r]+", " ")
  return s
end

function M.file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M.log_info(msg, title)
  vim.notify(msg, vim.log.levels.INFO, { title = title })
end

function M.log_warn(msg, title)
  vim.notify(msg, vim.log.levels.WARN, { title = title })
end

function M.log_error(msg, title)
  vim.notify(msg, vim.log.levels.ERROR, { title = title })
end

function M.log_debug(msg, title)
  vim.notify(msg, vim.log.levels.DEBUG, { title = title })
end

function M.lsp_on_attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", bufopts)
  vim.keymap.set("n", "go", "<cmd>Telescope diagnostics<cr>", bufopts)
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", bufopts)
  vim.keymap.set("n", "<leader>cn", "<cmd>Lspsaga rename<cr>", bufopts)
  vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<cr>", bufopts)
  vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  vim.keymap.set("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  vim.keymap.set("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", bufopts)
  vim.keymap.set("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", bufopts)

  return true
end

return M
