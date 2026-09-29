return {

    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts, {


            preset = "modern", -- または "modern", "helix"

            win = {

                relative = "editor", -- 画面（エディタ全体）を基準にする
                col = 0.5,           -- 横方向の中央 (50%)
                row = 0.5,           -- 縦方向の中央 (50%)
                border = "rounded",  -- 枠線を表示（"single", "double", "rounded", "shadow" など）
                title = true,        -- タイトル表示

                -- 必要に応じて全体のサイズも大きく設定
                width = { min = 40, max = 0.8 },  -- 画面幅の最大80%
                height = { min = 10, max = 0.8 }, -- 画面高さの最大80%

                padding = { 1, 2 },               -- 内側の余白を増やしてゆったり表示


            },

            layout = {
                width = { min = 20 }, -- 各カラム（列）の幅を広げてゆとりを持たせる
                spacing = 5,          -- カラム間の余白を広くする
            },

            -- 長い説明文を自動で折り返して複数行にする
            expand = 1,
        })
    end,

        keys = {

        },
}
