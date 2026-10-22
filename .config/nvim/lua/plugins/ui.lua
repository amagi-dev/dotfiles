return {

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = " " },
                },
            })
        end,
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                options = {
                    separator_style = "slant",
                },
            })
        end,


    },

    {
        "folke/snacks.nvim",
        opts = function(_, opts)
            opts.image = opts.image or {}
            opts.image.enabled = true
            opts.image.opts = opts.image.opts or {}
            opts.image.opts.filter = "nearest"
            return opts
        end,
    },


    {
        "gbprod/yanky.nvim",
        opts = {
            ring = {
                storage = "memory",


                -- 読み取り専用や特殊な画面（画像プレビューや各種ピッカーなど）でYankyを動作させない
                ignored_filetypes = {
                    "gitcommit",
                    "gitrebase",
                    "snacks_picker_input",
                    "snacks_picker",
                    "image",
                    "help",
                    "nofile",
                    "terminal"
                },
            },
        },
    }
}
