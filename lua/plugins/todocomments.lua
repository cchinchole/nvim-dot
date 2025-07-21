return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('todo-comments').setup()

        vim.keymap.set('n', '<leader>tl', ':TodoQuickFix<CR>', { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>nt", function()
            require("todo-comments").jump_next()
        end, { desc = "Next todo comment" })

        vim.keymap.set("n", "<leader>NT", function()
            require("todo-comments").jump_prev()
        end, { desc = "Previous todo comment" })
    end
}
