return {

    {
        "maxmx03/solarized.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            require("solarized").setup({
                -- 補足: カスタマイズオプション（透明背景など）をここに記述できます
                -- transparent = true,
            })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            --colorscheme = "solarized", -- ここにテーマ名を指定
            colorscheme = "tokyonight-night", -- ここにテーマ名を指定
        },
    },
}
