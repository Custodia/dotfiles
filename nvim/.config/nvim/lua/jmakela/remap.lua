vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)

-- Remap window movement keys --
vim.keymap.set("n", "<leader>w", "<C-w>")

vim.keymap.set("n", "<leader>ws", vim.cmd.split, { desc = 'Split window horizontally' })
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit, { desc = 'Split window vertically' })
vim.keymap.set("n", "<leader>wd", vim.cmd.quit, { desc = 'Close the current window' })
vim.keymap.set("n", "<leader>wo", vim.cmd.only, { desc = 'Close all other windows' })

-- Shartcuts to clipboard --
vim.keymap.set({ "n", "v", "x" }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<leader>Y', '"+Y', { desc = 'Yank to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<leader>d', '"+d', { desc = 'Delete to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<leader>D', '"+D', { desc = 'Delete to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<leader>p', '"+p', { desc = 'Paste from clipboard' })

-- File operations --
vim.keymap.set("n", "<leader>fD", ":call delete(expand('%')) | bprevious | bdelete #<CR>", { desc = 'Remove current file and close the buffer' })

-- Buffer operations --
-- Reverts buffer to latest save or previous change if there are no changes
vim.keymap.set("n", "<leader>br", ":earlier 1f<CR>", { desc = "Revert buffer" })

vim.keymap.set("n", "<leader>bs", ":Scratch<CR>", { desc = "Create a new scratch buffer" })
vim.keymap.set("n", "<leader>bS", ":ScratchSplit<CR>", { desc = "Split the window and create a new scratch buffer" })

vim.keymap.set("c", "<C-v>", '<C-r>"', { desc = 'Allow pasting in command mode with CTRL + V' })
