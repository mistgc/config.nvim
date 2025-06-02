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

function M.get_gui_name()
  if vim.g.neovide then
    return "neovide"
  elseif vim.g.goneovim then
    return "goneovim"
  elseif vim.g.vscode then
    return "vscode"
  else
    return "terminal"
  end
end

function M.is_vscode()
  if vim.g.vscode then
    return true
  else
    return false
  end
end

return M
