return {
    {
        'stevearc/overseer.nvim',
        ---@module 'overseer'
        ---@type overseer.SetupOpts
        opts = {
            strategy = {
                "terminal",
                open_on_start = true, -- タスク開始時に自動でターミナル/出力ウィンドウを開く
            },
        },
        config = function(_, opts)
            local overseer = require("overseer")
            overseer.setup(opts)

            overseer.register_template({
                name = "Templates",
                generator = function(_,cb)
                    local filename = vim.api.nvim_buf_get_name(0)
                    cb({

                        {
                            name = "CMake-Linux: Generate & Build & Run",
                            builder = function()
                                return {
                                    cmd = "cmake -S . -B build/linux -G Ninja -DCMAKE_BUILD_TYPE=Debug && cmake --build build/linux -j --verbose && ./build/linux/app",
                                    components = { "default" },
                                }
                            end,
                            condition = {
                                filetype = { "cpp","c" },
                            },
                        },

                        {
                            name = "CMake-Linux: Generate & Build",
                            builder = function()
                                return {
                                    cmd = "cmake -S . -B build/linux -G Ninja -DCMAKE_BUILD_TYPE=Debug && cmake --build build/linux -j --verbose",
                                    components = { "default" },
                                }
                            end,
                            condition = {
                                filetype = { "cpp","c"},
                            },
                        },

                        {
                            name = "CMake-WEB: Generate & Build & Run",
                            builder = function()
                                return {
                                    cmd = "emcmake cmake . -DPLATFORM=Web -B build/web -G Ninja -DCMAKE_BUILD_TYPE=Debug && cmake --build build/web -j --verbose && emrun build/web/app.html",
                                    components = { "default" },
                                }
                            end,
                            condition = {
                                filetype = { "cpp","c" },
                            },
                        },


                        {
                            name = "CMake-WEB: Generate & Build",
                            builder = function()
                                return {
                                    cmd = "emcmake cmake . -DPLATFORM=Web -B build/web -G Ninja -DCMAKE_BUILD_TYPE=Debug && cmake --build build/web -j --verbose",
                                    components = { "default" },
                                }
                            end,
                            condition = {
                                filetype = { "cpp","c" },
                            },
                        },

                        {
                            name = "LÖVE (Love2D)",
                            builder = function()
                                return {
                                    cmd = { "love" },
                                    args = { "." },
                                }
                            end,
                            condition = { filetype = { "lua" } },
                        },

                        {
                            name = "Lua CLI",
                            builder = function()
                                return {
                                    cmd = { "lua" },
                                    args = { filename },
                                }
                            end,
                            condition = { filetype = { "lua" } },
                        },
                        {
                            name = "Lua JIT",
                            builder = function()
                                return {
                                    cmd = { "luajit" },
                                    args = { filename },
                                }
                            end,
                            condition = { filetype = { "lua" } },
                        },

                        {
                            name = "Pico8",
                            builder = function()
                                return {
                                    cmd = { "pico8" },
                                    args = { "-run", filename },
                                }
                            end,
                            condition = { filetype = { "p8" } },
                        },
                    })
                end,
            })
        end,
    }
}

