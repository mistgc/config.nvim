local function config()
  local toggleterm = require("toggleterm")
  local sys_name = tostring(vim.loop.os_uname().sysname)
  local sh_exec = nil

  if sys_name:lower():find("windows", 1) ~= nil then
    sh_exec = "pwsh"
  else
    sh_exec = os.getenv("SHELL")
    if sh_exec == nil then
      local log_warn = require("utils").log_warn
      log_warn('Because the SHELL is nil, the "toggleterm.nvim" will use the defualt shell.', "ToggleTerm: ")
    end
  end

  toggleterm.setup({
    shell = sh_exec,
    shade_terminals = false,
  })
end

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = config,
  keys = {
    { "<C-t>", "<cmd>ToggleTerm<cr>", mode = { "n" }, desc = "Toggle terminal." },
    { "<ESC>", "<C-\\><C-n>", mode = { "t" }, desc = "Escape the terminal mode." },
  },
}
