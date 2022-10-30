io.popen("guard start")
local name = vim.api.nvim_buf_get_name(0) .. ".html"
io.popen("chromium " .. name)
