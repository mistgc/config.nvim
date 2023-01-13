local action_layout = require('telescope.actions.layout')
require('telescope').setup {
    defaults = {
        preview = {
            hide_on_startup = true,
        },
        mappings = {
            n = {
                ['<M-p>'] = action_layout.toggle_preview
            },
            i = {
                ['<M-p>'] = action_layout.toggle_preview
            }
        }
    },
    picker = {
        find_files = {
            theme = 'dropdown',
        }
    }
}
