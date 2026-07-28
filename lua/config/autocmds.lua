-- Source - https://stackoverflow.com/a
-- Posted by lcheylus, modified by community. See post 'Timeline' for change history
-- Retrieved 2025-11-07, License - CC BY-SA 4.0

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 250 })
    end,
})
