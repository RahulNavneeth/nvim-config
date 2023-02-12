local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>rr', builtin.oldfiles, {})
vim.keymap.set('n', '<space>fw', builtin.grep_string, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
        file_ignore_patterns = {"node_modules"},
    },
     pickers = {
        find_files = {
          hidden = true,
        }
      },
})
