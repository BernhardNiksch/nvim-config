return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                mode = "n",
                desc = "Telescope find files",
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").git_files()
                end,
                mode = "n",
                desc = "Telescope find files",
            },
            {
                "<leader>fs",
                function()
                    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
                end,
                mode = "n",
            },
            {
                "<leader>fs",
                function()
                    require("telescope.builtin").grep_string()
                end,
                mode = "v",
            },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "python",
                "javascript",
                "typescript",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.config").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            enable = true,
            multiwindow = false,
            max_lines = 0,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = "outer",
            mode = "cursor",
            separator = nil,
            zindex = 20,
            on_attach = nil,
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", ":Neotree toggle left<CR>", mode = "n" },
        },
        opts = {
            close_if_last_window = false,
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignore = false,
                },
            },
        },
        config = function(_, opts)
            require("neo-tree").setup(opts)

            vim.api.nvim_create_autocmd("VimEnter", {
                group = vim.api.nvim_create_augroup("OpenNeoTreeOnStart", { clear = true }),
                callback = function()
                    vim.schedule(function()
                        vim.cmd("Neotree show left filesystem reveal")
                    end)
                end,
            })
        end,
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>a",
                function()
                    require("harpoon.mark").add_file()
                end,
                mode = "n",
            },
            {
                "<leader>fh",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                mode = "n",
            },
            {
                "<C-h>",
                function()
                    require("harpoon.ui").nav_file(1)
                end,
                mode = "n",
            },
            {
                "<C-j>",
                function()
                    require("harpoon.ui").nav_file(2)
                end,
                mode = "n",
            },
            {
                "<C-k>",
                function()
                    require("harpoon.ui").nav_file(3)
                end,
                mode = "n",
            },
            {
                "<C-l>",
                function()
                    require("harpoon.ui").nav_file(4)
                end,
                mode = "n",
            },
        },
    },
}
