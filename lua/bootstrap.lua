local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins_dir_path = vim.fs.normalize(vim.fn.stdpath("config") .. "/lua/plugins/")
local plugin_iter = vim.fs.dir(plugins_dir_path)
local plugins = {}

local function normalize_module_name(filename)
  for i = 1, #filename do
    if string.sub(filename, i, i) == "." then
      return filename:sub(1, i - 1)
    end
  end
  return filename
end

for item in plugin_iter do
  local plugin = require("plugins." .. normalize_module_name(item))
  table.insert(plugins, plugin)
end

require("lazy").setup(plugins)
