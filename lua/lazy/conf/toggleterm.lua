local sys_name = vim.loop.os_uname().sysname
local os_is_win = false
local sh_exec = ""

if string.find(sys_name:lower(), string.lower("windows"), 1, true) ~= nil then
    os_is_win = true
end

if os_is_win then
    sh_exec = "pwsh"
else
    sh_exec = "zsh"
end

require("toggleterm").setup{
    shell = sh_exec,
    shade_terminals = false
}
