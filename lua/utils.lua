local M = {}

function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, 'lazy.core.config')
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

function M.fmt_md_table()
  -- Get the visual selection range
  local start_line = vim.fn.line('v')
  local end_line = vim.fn.line('.')
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- Get the selected lines
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Parse table rows
  local rows = {}
  local col_widths = {}
  for _, line in ipairs(lines) do
    local cells = {}
    -- Split by | and trim whitespace
    for cell in line:gmatch('[^|]+') do
      cell = cell:match('^%s*(.-)%s*$') or ''
      table.insert(cells, cell)
    end
    table.insert(rows, cells)
    -- Track max width per column
    for i, cell in ipairs(cells) do
      col_widths[i] = math.max(col_widths[i] or 0, vim.fn.strdisplaywidth(cell))
    end
  end

  -- Format each row
  local formatted_lines = {}
  for _, cells in ipairs(rows) do
    local formatted_cells = {}
    for i, cell in ipairs(cells) do
      local width = col_widths[i] or 1
      -- Right-align separator rows, left-align others
      if cell:match('^%-+$') then
        table.insert(formatted_cells, string.rep('-', width))
      else
        table.insert(formatted_cells, cell .. string.rep(' ', width - vim.fn.strdisplaywidth(cell)))
      end
    end
    table.insert(formatted_lines, '| ' .. table.concat(formatted_cells, ' | ') .. ' |')
  end

  -- Replace the selection with formatted output
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, formatted_lines)
end

function M.os_capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

function M.file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M.get_shell_name()
  local sh_name = os.getenv('SHELL')
  if sh_name ~= nil then
    return sh_name
  end

  local ok, _, code = os.execute('fish --version > /dev/null 2>&1')
  if ok and code == 0 then
    sh_name = 'fish'
    return sh_name
  end

  ok, _, code = os.execute('zsh --version > /dev/null 2>&1')
  if ok and code == 0 then
    sh_name = 'zsh'
    return sh_name
  end

  ok, _, code = os.execute('bash --version > /dev/null 2>&1')
  if ok and code == 0 then
    sh_name = 'bash'
    return sh_name
  end

  M.log_warn('Because the SHELL is nil, the "toggleterm.nvim" will use the defualt shell.', 'ToggleTerm: ')

  return nil
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
    return 'neovide'
  elseif vim.g.goneovim then
    return 'goneovim'
  elseif vim.g.vscode then
    return 'vscode'
  else
    return 'terminal'
  end
end

function M.is_vscode()
  if vim.g.vscode then
    return true
  else
    return false
  end
end

function M.toggle_spellcheck()
  if vim.opt.spell then
    vim.opt.spell = false
  else
    vim.opt.spell = true
  end
end

---Extend table A
---@param ta table: Table A
---@param tb table: Table B
---@return table
function M.table_extend(ta, tb)
  local tc = {}

  for k, v in pairs(ta) do
    tc[k] = v
  end
  for k, v in pairs(tb) do
    tc[k] = v
  end

  return tc
end

function M.autocmd(event, opts)
  return vim.api.nvim_create_autocmd(event, opts)
end

return M
