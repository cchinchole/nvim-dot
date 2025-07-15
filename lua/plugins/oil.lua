return
{
  'benomahony/oil-git.nvim',
  dependencies = {'stevearc/oil.nvim', 'echasnovski/mini.icons'},
  lazy = false,
  config = function()
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
      },
  })
  require('oil-git').setup({})
  vim.keymap.set('n', '<leader>e', require('oil').toggle_float, { desc = 'Toggle oil from the parent directory' })
  end
}
