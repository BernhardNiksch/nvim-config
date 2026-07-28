return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = {
            ensure_installed = {},
            automatic_enable = false,
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("lua_ls")

            vim.lsp.config("ruff", {
                capabilities = capabilities,
            })
            -- vim.lsp.enable("ruff")

            vim.lsp.config("basedpyright", {
                capabilities = capabilities,
                enabled = true,
                settings = {
                    disableOrganizeImports = true,
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "off",
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })
            vim.lsp.enable("basedpyright")

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local keymap_opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
                    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, keymap_opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
                    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, keymap_opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymap_opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, keymap_opts)
                end,
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.completion.spell,
                },
            })

            vim.keymap.set("n", "<leader>fmt", function()
                vim.lsp.buf.format({ async = true })
            end)
        end,
    },
}
