require("jmakela.remap")
require("jmakela.lazy")
require("jmakela.scratch")

-- Fix issue with Inspect function
-- see: https://github.com/neovim/neovim/issues/31675
vim.hl = vim.highlight

-- Without this vim-tmux-navigator
-- is very slow when switching from
-- nvim into another tmux pane.
vim.opt.shell = '/bin/bash'

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs & indentation
vim.opt.tabstop = 4       -- 4 spaces for tabs by default
vim.opt.shiftwidth = 4    -- 4 spaces for indent width
vim.opt.expandtab = true  -- expand tabs to spaces by default
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- Search settings
vim.opt.smartcase = true   -- all lower case is case insensitive, otherwise case sensitive

-- Go-specific settings (tabs)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false
        vim.opt_local.softtabstop = 4
    end,
})
