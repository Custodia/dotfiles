return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local telescope_builtin = require('telescope.builtin')
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Show LSP hover information"
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

                opts.desc = "LSP go to definition"
                vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, opts)

                opts.desc = "LSP go to declaration"
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

                opts.desc = "LSP go to implementation(s)"
                vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, opts)

                opts.desc = "LSP list references"
                vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, opts)

                opts.desc = "LSP list code actions"
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

                opts.desc = "LSP smart rename"
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            end
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Configure LSPs setup via mason
        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "solargraph", "html", "cssls" },

            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                },
                                completion = {
                                    callSnippet = "Both"
                                }
                            }
                        }
                    })
                end,

                ["solargraph"] = function()
                    lspconfig["solargraph"].setup({
                        capabilities = capabilities,
                        init_options = {
                            linting = false,
                            formatting = false,
                        },
                    })
                end,
            },
        })
    end
}
