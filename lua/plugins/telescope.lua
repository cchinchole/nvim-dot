return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local actions = require('telescope.actions')
            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-h>"] = actions.move_selection_previous, -- For left, but generally left and right are not used for scrolling in Telescope.
                            ["<C-l>"] = actions.move_selection_next,
                        },
                        n = {
                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                            ["h"] = actions.move_selection_previous, -- For left, but generally left and right are not used for scrolling in Telescope.
                            ["l"] = actions.move_selection_next,
                        },
                    },
                }
            })
            local tele = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', tele.find_files, {})
            vim.api.nvim_set_keymap('n', '<leader>R',
                [[<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols = 'function' })<CR>]],
                { noremap = true, silent = true })
        end
    }
}
