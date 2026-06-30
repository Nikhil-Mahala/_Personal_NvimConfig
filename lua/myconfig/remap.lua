vim.g.mapleader = " "
vim.keymap.set("n", "<leader>sf", vim.cmd.Ex)

vim.opt.timeout = true
vim.opt.timeoutlen = 100

vim.opt.guicursor = "a:block-blinkwait500-blinkon500-blinkoff500"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "0"
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.opt.shell = '/usr/bin/bash'
vim.opt.shellcmdflag = "-c"
vim.opt.shellredir = ">%s 2>&1"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
