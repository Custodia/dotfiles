return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },      -- eslint_d installed globally via npm
            typescript = { "eslint_d" },      -- eslint_d installed globally via npm
            javascriptreact = { "eslint_d" }, -- eslint_d installed globally via npm
            typescriptreact = { "eslint_d" }, -- eslint_d installed globally via npm
        }

        local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_autogroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>gl", function()
            lint.try_lint()
        end, { desc = "Trigger linting for the current file" })
    end
}
