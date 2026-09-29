-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


------------------------------------------------------------------
--- Build tasks
------------------------------------------------------------------
local overseer = require("overseer")
vim.keymap.set("n", "<Leader>pr", function()

    local tasks = overseer.list_tasks({ recent_first = true })

    -- No task
    if #tasks == 0 then
        overseer.open({enter = false,size = 45})

        --vim.cmd("OverseerRun")
        overseer.run_task({ }, function() end)


    else
        -- Last task
        local last_task = tasks[1]

        overseer.run_action(last_task, "restart")
        overseer.open({enter = false,size = 45})
    end

end, { desc = "Run: Run or Restart Task" })


vim.keymap.set("n", "<Leader>pR", "<cmd>OverseerRun<cr>", { desc = "Run: Select New Task" }) -- Run a new task
vim.keymap.set("n", "<Leader>pc", "<cmd>OverseerToggle<cr>", { desc = "Run: view Log" }) -- Toggle the overseer log window


------------------------------------------------------------------
--- Rename
------------------------------------------------------------------

-- vim.keymap.set("n", "<leader>rn", ":IncRename " ,{desc = "Rename: Incremental Rename" })

------------------------------------------------------------------
--- Tab movement
------------------------------------------------------------------
vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

------------------------------------------------------------------
---
------------------------------------------------------------------

------------------------------------------------------------------

------------------------------------------------------------------
--- Buffer
------------------------------------------------------------------
-- vim.keymap.set("n", "<Leader>hb", "<cmd>split<cr>", { desc = "Buffer: Horizontal split" })
-- vim.keymap.set("n", "<Leader>vb", "<cmd>vsplit<cr>", { desc = "Buffer: Vertical split" })



------------------------------------------------------------------
--- Copilot
------------------------------------------------------------------
vim.keymap.set("i", "<return>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, desc = "Copilot Accept",})
------------------------------------------------------------------
--- Backspace
------------------------------------------------------------------
vim.keymap.set('i', '<C-d>', '<BS>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-S-d>', '<C-d>', { noremap = true, silent = true })
