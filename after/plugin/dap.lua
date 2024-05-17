vim.keymap.set("n", "<leader>db", vim.cmd.DapToggleBreakpoint)
vim.keymap.set("n", "<leader>dr", vim.cmd.DapContinue)

local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  port = "14000",
  executable = {
    -- CHANGE THIS to your path!
    command = '/Users/upanshuparekh/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "14000"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
