return {

    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                clang_format = {
                    prepend_args = {
                        "--style={BasedOnStyle: LLVM, NamespaceIndentation: All}",
                    },
                },
            },
        },

    },

    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                markdown = {}, -- Markdown の linter を空にする
            },
        },
    },


    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },

        opts = {
            indent = { enable = true },
            inlay_hints = {
                enabled = false,
            },
            servers = {

                marksman = {
                    diagnostics = {
                        enable = false,
                    },
                },

                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                        "--query-driver=/usr/bin/clang++",
                    },
                },
                lua_ls = {
                    on_attach = function(client)
                        client.server_capabilities.colorProvider = false
                    end,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "love", "vim" },
                            },
                            workspace = {
                                library = {
                                    "${3rd}/love2d/library",
                                },
                            },
                            format = {
                                enable = true,
                                defaultConfig = {
                                    indent_style = "space",
                                    indent_size = "4",
                                },
                            },
                        },
                    },
                },
                glsl_analyzer = {
                    filetypes = { "hlsl","glsl", "vert", "frag", "geom", "comp", "tesc", "tese" },
                    settings = {
                        glsl_analyzer = {},
                    },
                },
            },
        },
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls" },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.indent = opts.indent or {}
            opts.indent.disable = opts.indent.disable or {}
            -- -- C++ と C の treesitter インデントを無効化（cindent を優先させる）
            -- vim.list_extend(opts.indent.disable, { "cpp", "c" })

            opts.ensure_installed = {
                "bash", "html", "javascript", "json", "lua", "markdown",
                "markdown_inline", "python", "query", "regex", "tsx",
                "typescript", "vim", "yaml", "cpp","glsl", "hlsl",
            }
        end,
    }
}
