local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Project Find files GLOBAL
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- git file search IN GIT (avoid .gitignored items)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end) -- Project Search

