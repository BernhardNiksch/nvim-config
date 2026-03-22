require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    --ensure_installed = { "lua_ls", "ruff", "basedpyright" },
    ensure_installed = {},
    automatic_enable = false,
    automatic_installation = false,
    automatic_setup = false,
    handlers = nil,
})

local lspconfig = vim.lsp.config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
})
vim.lsp.enable("lua_ls")

vim.lsp.config("ruff", {
    capabilities = capabilities,
})
--vim.lsp.enable("ruff")

vim.lsp.config("basedpyright", {
    capabilities = capabilities,
    enabled = true,
    settings = {
        disableOrganizeImports = true,
        basedpyright = {
            analysis = {
                -- ignore = { "*" },
                typeCheckingMode = "off",
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
    },
    --settings = {
    --	pyright = {
    --        autoImportCompletion = true,
    --    },
    --	python = {
    --		analysis = {
    --			autoSearchPaths = true,
    --			diagnosticMode = "openFilesOnly",
    --			useLibraryCodeForTypes = true,
    --			typeCheckingMode = "off",
    --		},
    --	},
    --},
})
vim.lsp.enable("basedpyright")

--vim.lsp.config("pylsp", {
--    capabilities = capabilities,
--    settings = {
--        pylsp = {
--            plugins = {
--                jedi_completion = {
--                    enabled = true,
--                    include_params = true,
--                    extra_paths = vim.api.nvim_get_runtime_file("", true),
--                },
--                preload = {
--                    enabled = true,
--                    modules = {
--                        "django",
--                        "django.db",
--                        "django.contrib",
--                        "django.contrib.admin",
--                        "django.contrib.auth",
--                        "django.contrib.contenttypes",
--                        "django.contrib.sessions",
--                        "django.template",
--                        "django.urls",
--                    },
--                },
--                rope_completion = {
--                    enabled = true,
--                    auto_import_modules = { "django" },
--                    auto_import_names = {
--                        "django.db.models.*",
--                        "django.http.HttpResponse",
--                        "django.shortcuts.render",
--                        "django.urls.path",
--                        "django.urls.include",
--                        "django.urls.re_path",
--                    },
--                },
--                -- pyflakes = { enabled = false },
--                -- pycodestyle = { enabled = false },
--                -- pylint = { enabled = false },
--            },
--        },
--    },
--})
--vim.lsp.enable("pylsp")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})
