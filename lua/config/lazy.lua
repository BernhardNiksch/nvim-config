require("config.options")
require("config.keymaps")
require("config.autocmds")

local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer"
vim.opt.runtimepath:remove(packer_path .. "/start/*")
vim.opt.packpath:remove(packer_path)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = {
        colorscheme = { "catppuccin" },
    },
    checker = {
        enabled = true,
        notify = false,
    },
})
