return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            local mocha = require("catppuccin.palettes").get_palette("mocha")

            require("catppuccin").setup({
                flavour = "mocha",
                integrations = {
                    gitsigns = false,
                    harpoon = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    },
                    neotree = true,
                    treesitter_context = true,
                },
                custom_highlights = {
                    LineNrAbove = { fg = mocha.surface2 },
                    LineNr = { fg = mocha.red },
                    LineNrBelow = { fg = mocha.surface2 },
                    TreesitterContext = { fg = mocha.lavender },
                    TreesitterContextLineNumber = { fg = mocha.lavender },
                },
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
