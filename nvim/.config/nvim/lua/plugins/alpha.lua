return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local theta = require("alpha.themes.theta")
        local dashboard = require("alpha.themes.dashboard")
        -- available: devicons, mini, default is mini
        -- if provider not loaded and enabled is true, it will try to use another provider
        theta.file_icons.provider = "devicons"

        -- theta.section_mru.val = {
        --     {
        --         type = "text",
        --         val = "Recent files",
        --         opts = {
        --             hl = "SpecialComment",
        --             shrink_margin = false,
        --             position = "center",
        --         },
        --     },
        --     { type = "padding", val = 1 },
        --     {
        --         type = "group",
        --         val = function()
        --             return { mru(1, vim.fn.getcwd()) }
        --         end,
        --         opts = { shrink_margin = false },
        --     },
        -- }

        theta.buttons.val = {
            { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            dashboard.button("e", "  New file", "<cmd>ene<CR>"),
            dashboard.button("SPC f f", "󰈞  Find file"),
            dashboard.button("SPC f g", "󰊄  Live grep"),
            dashboard.button("c", "  Configuration", "<cmd>cd stdpath('config')<CR>"),
            dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
            dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
        }

        alpha.setup(
          theta.config
        )
    end,
};
