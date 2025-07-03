return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        config = function()
            require'nvim-treesitter'.install { 'c', 'lua', 'vim', 'php', 'cpp', 'rust', 'bash', 'python', 'vimdoc', 'query', 'c3' }
        end
    },
}
