require("neo-tree").setup({
    -- Configuration options go here
    filesystem = {
        follow_current_file = {
            enabled = true,
        },
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignore = false,
        }
    }
    })

vim.keymap.set("n", "<leader>e", ":Neotree toggle left<CR>")

