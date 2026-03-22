local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- lua
        null_ls.builtins.formatting.stylua,
        -- rest
        null_ls.builtins.completion.spell,
    },
})

vim.keymap.set("n", "<leader>fmt", function()
    vim.lsp.buf.format({ async = true })
end)
