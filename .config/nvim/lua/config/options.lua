-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- 折り返しを無効化（wrap = false）
vim.g.editorconfig = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.g.maplocalleader = " "
vim.g.mapleader = " "
vim.g.autoformat = false
vim.g.auto_session_enabled = true
-- 相対行番号を表示（現在行を基準に上下を相対表示）
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes" -- サインカラム（診断記号など用）を常に表示
vim.opt.cursorline = true --カーソル行をハイライト
vim.opt.updatetime = 300 -- ハイライトの更新間隔（ミリ秒）
vim.opt.timeoutlen = 100 -- 0.5秒待つ設定（デフォルトは1000ですが、プラグインで上書きされている場合があります）

vim.opt.clipboard = ""


vim.api.nvim_set_option_value("wrap", false, {}) -- 折り返しを無効化（wrap = false）

vim.opt.spelllang = { "en", "cjk" }

-- 自動保存 インサートモードを終了したときに自動で保存する
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})


vim.filetype.add({
  extension = {
    hlsl = "hlsl",
    fx = "hlsl",
    shader = "hlsl",
  },
})
