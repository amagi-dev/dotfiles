return {
  "folke/persistence.nvim",
  event = "VimEnter", -- 遅延読み込みの設定に合わせて調整してください
  opts = {},
  config = function(_, opts)
    require("persistence").setup(opts)

    -- VimEnter時に条件に合う場合のみセッションをロード
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("restore_session_git_only", { clear = true }),
      callback = function()
        -- 1. 引数がなし、またはディレクトリ指定の場合
        -- 2. カレントディレクトリに .git が存在する場合（親ディレクトリを遡って探す場合は vim.fs.find が便利です）
        local is_empty_or_dir = vim.fn.argc() == 0 or (vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1)

        -- .git フォルダ（またはファイル）を親方向へ検索
        local git_root = vim.fs.find(".git", { path = vim.fn.getcwd(), upward = true, type = "any" })[1]
        local has_git = git_root ~= nil

        if is_empty_or_dir and has_git then
          vim.schedule(function()
            require("persistence").load()
          end)
        end
      end,
    })
  end,
}
