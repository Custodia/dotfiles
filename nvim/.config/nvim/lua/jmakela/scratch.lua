vim.api.nvim_create_user_command("Scratch", "enew | setlocal bt=nofile bh=wipe nobl noswapfile nu", { desc = "Creates a new scratch buffer in the current window"})
vim.api.nvim_create_user_command("ScratchSplit", "new | setlocal bt=nofile bh=wipe nobl noswapfile nu", { desc = "Splits the window and creates a new scratch buffer"})
