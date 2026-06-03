-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.mouse = "a"
vim.opt.laststatus = 0
vim.opt.guicursor = "n-v-i-c:block"
vim.opt.termguicolors = true

vim.cmd.colorscheme("raven")

-- Associate *.tex with tex filetype
vim.filetype.add({ extension = { tex = "tex" } })

-- Keymaps
vim.keymap.set("", "<F2>", ":setlocal spell spelllang=en_us<CR>", { desc = "Enable spell check" })
vim.keymap.set("", "<F3>", ":set nospell<CR>", { desc = "Disable spell check" })

-- Plugins
require("lazy").setup("plugins")
