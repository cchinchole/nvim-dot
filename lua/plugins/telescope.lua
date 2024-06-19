return {
    {
        "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup()
        local tele = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', tele.find_files, {})
    end
    }
}
