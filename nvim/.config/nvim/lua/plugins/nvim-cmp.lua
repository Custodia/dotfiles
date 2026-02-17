return {
    "hrsh7th/nvim-cmp", -- Automcompletions
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- Completion source for words in the current buffer
        "hrsh7th/cmp-path",   -- Completion source for file paths
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp"
        }, -- Snippeting tool
        "saadparwaiz1/cmp_luasnip", -- Connects luasnip as a completion source for nvim-cmp
        "rafamadriz/friendly-snippets" -- Snippets collection for a set of different programming languages
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect" -- see :help completeopt
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- TODO: Change this to something that works
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP autocompletions
                { name = "luasnip" },  -- snippets
                { name = "buffer" },   -- text within current buffer
                { name = "path" },     -- file system paths
            })
        })
    end
}
