return {
    {
        "github/copilot.vim",
        init = function()

            -- Tabキーによる確定を無効化
            vim.g.copilot_no_tab_map = true
        end,
    },
}
