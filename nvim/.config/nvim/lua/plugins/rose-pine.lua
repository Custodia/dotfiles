return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme rose-pine")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        -- Don't set backgrounds of floating windows like
        -- Telescope searches to be transparent
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}

