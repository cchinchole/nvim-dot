vim.pack.add({
    {src ='https://github.com/stevearc/oil.nvim.git'},
    {src ='https://github.com/benomahony/oil-git.nvim.git'},
    {src ='https://github.com/echasnovski/mini.icons.git'}
})

require('oil').setup({
    default_file_explorer = true,
    columns = {
        'permissions',
        'size',
        'mtime',
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    view_options = {
        show_hidden = true
    }
})
