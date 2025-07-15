return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        dependencies = {},
        config = function()
            require 'nvim-treesitter'.install { 'c', 'lua', 'vim', 'php', 'cpp', 'rust', 'bash', 'python', 'vimdoc', 'query', 'c3' }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        config = function()
            vim.keymap.set({ "n", "x", "o" }, "sp", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
            end)
            require("nvim-treesitter-textobjects").setup {}
            vim.keymap.set("n", "<C-.>", function()
                require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
            end)
            vim.keymap.set("n", "<C-,>", function()
                require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.inner"
            end)
            vim.keymap.set({ "n", "x", "o" }, "nf", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "NF", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "np", function()
                require("nvim-treesitter-textobjects.move").goto_next("@parameter.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "NP", function()
                require("nvim-treesitter-textobjects.move").goto_previous("@parameter.inner", "textobjects")
            end)
        end
    }
}
