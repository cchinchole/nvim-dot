return {
    {
        "nvim-telescope/telescope.nvim",

        tag = "0.1.5",

        dependencies = {
            "nvim-lua/plenary.nvim",
            'LukasPietzschmann/telescope-tabs',
        },

        config = function()
            require('telescope').setup()
            require('telescope').load_extension 'telescope-tabs'
            require('telescope-tabs').setup {}
            local tele = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', tele.find_files, {})
        end
    }
}
