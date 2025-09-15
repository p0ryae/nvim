require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "<localleader>s", 'c~~<c-r>"~~')
map("v", "<localleader>b", 'c**<c-r>"**')
map("v", "<localleader>i", 'c_<c-r>"_')
map("v", "<localleader>`", 'c`<c-r>"`')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
