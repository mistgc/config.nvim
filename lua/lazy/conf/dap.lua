require("dapui").setup()
require("nvim-dap-virtual-text").setup()
local utils = require("utils.plugin")

local dap, dapui, telescope, widgets = require("dap"), require("dapui"), require("telescope"), require("dap.ui.widgets")

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
    args = { "--port", "${port}" },
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      local exepath = utils.os_capture('sh -c "$SHELL -ic cmxp"')
      if utils.file_exists(exepath) then
        return exepath
      else
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- use nvim-dap events to open and close the dapui windows automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<F5>", function()
  dap.continue()
end)
vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end)
vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end)
vim.keymap.set("n", "<F12>", function()
  dap.step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
  dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
  dap.set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>fp", function()
  telescope.extensions.dap.list_breakpoints()
end)
vim.keymap.set("n", "<Leader>dr", function()
  dap.repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
  dap.run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  widgets.hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  widgets.preview()
end)
vim.keymap.set("n", "<Leader>df", function()
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  widgets.centered_float(widgets.scopes)
end)
