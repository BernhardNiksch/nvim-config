-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }

    use("nvim-lua/plenary.nvim")
    use("ThePrimeagen/vim-be-good")
    use("mbbill/undotree")

    -- LSP
    use("mason-org/mason.nvim")
    use("mason-org/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("nvimtools/none-ls.nvim")

    -- Completions and Snippets
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use({
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets" },
    })
    use("saadparwaiz1/cmp_luasnip")

    -- Navigation
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-ui-select.nvim" })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    })
    use("nvim-treesitter/nvim-treesitter-context")
    use("ThePrimeagen/harpoon")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- Context
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })
    use("lukas-reineke/indent-blankline.nvim")
end)

