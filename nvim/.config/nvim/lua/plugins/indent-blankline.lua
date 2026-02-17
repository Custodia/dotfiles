return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        scope = {
            include = {
                node_type = {
                    elixir = {"do_block"}
                }
            },
            exclude = {
                node_type = {
                    elixir = {"call"}
                }
            },
        },
    },
}
