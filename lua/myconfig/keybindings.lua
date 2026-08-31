-- normal mode
--
vim.keymap.set('n', '<A-l>', '<C-w>>', { desc = 'Increase window width' })
vim.keymap.set('n', '<A-h>', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<A-k>', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<A-j>', '<C-w>-', { desc = 'Decrease window height' })


local function navigate_and_return(direction) 
    local cmd = direction == 'h' and '<C-w>h' or
                direction == 'l' and '<C-w>l' or 
                direction == 'j' and '<C-w>j' or 
                direction == 'k' and '<C-w>k'

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>' .. cmd, true, true, true), 'n', false)
end

vim.keymap.set('n', '<leader>l', function() navigate_and_return('l') end, { desc = 'Move to right window' })
vim.keymap.set('n', '<leader>h', function() navigate_and_return('h') end, { desc = 'Move to left window' })
vim.keymap.set('n', '<leader>k', function() navigate_and_return('k') end, { desc = 'Move to upper window' })
vim.keymap.set('n', '<leader>j', function() navigate_and_return('j') end, { desc = 'Move to lower window' })

vim.keymap.set('n', '<leader>mi', '<C-w>I')
vim.keymap.set('n', '<leader>mr', '<C-w>R')
vim.keymap.set('n', '<leader>mx', '<C-w>x')


vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float, { desc = "Show diagnostic error" })
vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', '<leader>pe', vim.diagnostic.goto_next, { desc = "Next diagnostic" })

vim.keymap.set('n', '<A-c>', 'ggVG"+y', { noremap = true, silent = true })

-- insert mode
--
vim.keymap.set('i', '<leader>e', '<Esc>')

vim.keymap.set('i', '<A-k>', '<C-o>k')
vim.keymap.set('i', '<A-j>', '<C-o>j')
vim.keymap.set('i', '<A-l>', '<C-o>a')
vim.keymap.set('i', '<A-h>', '<C-o>h')

vim.keymap.set('i', '<A-a>', '<C-o>A')
vim.keymap.set('i', '<A-s>', '<C-o>_')
vim.keymap.set('i', '<A-w>', '<C-o>w')
vim.keymap.set('i', '<A-e>', '<C-o>e')
vim.keymap.set('i', '<A-b>', '<C-o>b')

vim.keymap.set('i', '<A-n>', '<C-o>%')

vim.keymap.set('i', '<A-c>', '<C-o>yy');
vim.keymap.set('i', '<A-p>', '<Esc>:t.<CR>a')
vim.keymap.set('i', '<A-P>', '<Esc>:t-1<CR>a') -- *

vim.keymap.set('i', '<A-d>', '<Esc>:normal! dd<CR>a')

-- terminal mode
--
vim.keymap.set('t', '<leader>e', '<C-\\><C-n>')

-- visual-line mode
vim.keymap.set("v", "<A-u>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-d>", ":m '>+1<CR>gv=gv")
