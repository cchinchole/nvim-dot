vim.pack.add({'https://github.com/akinsho/toggleterm.nvim.git'})

require('toggleterm').setup({
    size = 20,
    open_mapping = [[<C-t>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = false,
    shell = vim.o.shell
})
