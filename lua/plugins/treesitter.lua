local function config()
  local treesitte_conf = require("nvim-treesitter.configs")
  local opts = {
    ensure_installed = { "lua", "c", "cpp", "rust", "python", "cmake", "json", "make", "csv" },
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
  }

  treesitte_conf.setup(opts)
end

return {
  "nvim-treesitter/nvim-treesitter",
  config = config,
  build = ":TSUpdate",
}
