return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        -- tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",

        config = function(_, opts)
            require("luasnip").setup(opts)
            -- VSCode形式（既存）
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })
            -- Lua形式（追加）
            require("luasnip.loaders.from_lua").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
            })
        end,
    },
}
