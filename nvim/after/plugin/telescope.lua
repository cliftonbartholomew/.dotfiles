local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search file names' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Grep file contents' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Search buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search help docs' })

-- while in telescope <C-q> will add search to quickfix list
