# Make sure CTRL + L works in netrw buffer, eg. file view
vim.keymap.set({ "n", "v", "x" }, "<C-l>", '<C-w>l', { silent = true, buffer = true })
