return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
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
            vim.keymap.set('n', '<leader>F', function()
                local bufnr = vim.api.nvim_get_current_buf()
                local clients = vim.lsp.get_clients({ bufnr = bufnr })
                if #clients == 0 then
                    vim.notify('No LSP clients attached to this buffer', vim.log.levels.WARN)
                    return
                end
                require('telescope.builtin').lsp_document_symbols({
                    symbols = { 'function', 'method', 'class', 'interface', 'module' }, -- Optional: filter symbol types
                })
            end, { desc = 'Find Document Symbols' })
        end
    }
}
