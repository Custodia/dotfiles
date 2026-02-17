return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            pickers = {
                current_buffer_fuzzy_find = {
                    sorting_strategy = 'ascending',
                    -- Preserve ordering by line number when searching
                    tiebreak = function(current_entry, existing_entry)
                        return current_entry.lnum < existing_entry.lnum
                    end
                },
                grep_string = {
                    find_command = { "rg", "--hidden", "--glob", "!.git" }
                }
            },
            extensions = {
                fzf = {
                    fuzzy = false,                   -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                     -- the default case_mode is "smart_case"
                }
            },
        })

        telescope.load_extension('fzf')

        local additional_rg_args = { "-i", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" }

        -- Make sure hidden files are shown but filtes under .git are not
        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})
        end, {})
        vim.keymap.set('n', '<leader>ss', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>bf', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                additional_args = additional_rg_args,
            })
        end)
        vim.keymap.set('n', '<leader>pl', function()
            builtin.live_grep({
                additional_args = additional_rg_args,
            })
        end)
    end
}
