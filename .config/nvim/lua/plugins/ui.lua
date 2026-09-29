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



}
