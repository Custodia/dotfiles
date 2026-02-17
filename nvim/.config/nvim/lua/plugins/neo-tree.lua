return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
        local neo_tree = require("neo-tree")

        neo_tree.setup({
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
                follow_current_file = {
                    enabled = true,
                },
            },
        })

        vim.keymap.set("n", "<leader>pt", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree in default view" })
        vim.keymap.set("n", "<leader>pT", "<cmd>Neotree toggle source=buffers<cr>", { desc = "Toggle Neotree in default view"})
    end
}
