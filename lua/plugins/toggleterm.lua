local sys_name = vim.loop.os_uname().sysname
local sh_exec = os.getenv("SHELL")

if sh_exec == nil then
  local log_warn = require("utils").log_warn
  log_warn('Because the SHELL is nil, "toggleterm.nvim" use default shell.', "ToggleTerm: ")
end

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
  opts = {
    shade_terminals = false,
    shell = sh_exec,
  },
  keys = {
    { "<C-t>", "<cmd>ToggleTerm<cr>", mode = { "n" }, desc = "Toggle terminal." },
    { "<ESC>", "<C-\\><C-n>", mode = { "t" }, desc = "Escape the terminal mode." },
  },
}
