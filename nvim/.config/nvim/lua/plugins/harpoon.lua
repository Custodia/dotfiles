return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        local harpoon = require("harpoon")
        
        harpoon:setup()
        
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add buffer to harpoon list" })
        vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "List harpooned buffers" })
        vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, {  desc = "1st harpooned buffer" })
        vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, {  desc = "2nd harpooned buffer" })
        vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, {  desc = "3rd harpooned buffer" })
        vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, {  desc = "4th harpooned buffer" })
        
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, {  desc = "Move to the previous harpooned buffer" })
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, {  desc = "Move to the next harpooned buffer" })
    end
}
