return {
    "airblade/vim-rooter",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        -- Parent directories are directories that
        -- have a .git folder in them
        vim.g.rooter_patterns = {'.git'}
        -- If the buffer has no parent don't change root directory
        vim.g.rooter_change_directory_for_non_project_files = ''
        -- Only change root directory for current window
        vim.g.rooter_cd_cmd = 'lcd'
        -- Resolve sym links
        vim.g.rooter_resolve_links = 1
    end,
}
