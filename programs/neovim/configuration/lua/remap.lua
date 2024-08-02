local function swap(left, right)
	vim.keymap.set('', left, right)
	vim.keymap.set('', right, left)
end
local function swap_letter(left, right)
	swap(left, right)
	swap(left:upper(), right:upper())
end

vim.g.mapleader = ' '

-- colemak
--- general
swap(';', ':')

--- navigation
swap_letter('n', 'j')
swap_letter('e', 'k')
swap_letter('i', 'h')
swap_letter('o', 'l')


vim.keymap.set('', '<C-n>', '<C-e>')
vim.keymap.set('', '<C-e>', '<C-y>')
vim.keymap.set('', '<C-i>', 'zh')
vim.keymap.set('', '<C-o>', 'zl')

vim.keymap.set('v', 'N', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'E', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'N', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'j', 'nzzzv')
vim.keymap.set('n', 'J', 'Nzzzv')


-- diagnostics
vim.keymap.set('', '[a', vim.diagnostic.goto_prev)
vim.keymap.set('', ']a', vim.diagnostic.goto_next)

-- text
vim.keymap.set('', '<leader>ty', '"+y')
vim.keymap.set('', '<leader>tY', '"+Y')

vim.keymap.set('', '<leader>td', '"_d')
vim.keymap.set('', '<leader>tD', '"_D')

vim.keymap.set('x', '<leader>tp', '"_dP')

vim.keymap.set('n', '<leader>ts', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- file
vim.keymap.set('n', '<leader>fw', '<cmd>w<cr>', { silent = true })
vim.keymap.set('n', '<leader>fa', '<cmd>wa<cr>', { silent = true })
vim.keymap.set('n', '<leader>fx', '<cmd>x<cr>', { silent = true })
vim.keymap.set('n', '<leader>fz', '<cmd>xa<cr>', { silent = true })
vim.keymap.set('n', '<leader>fq', '<cmd>q<cr>', { silent = true })

vim.keymap.set('n', '<leader>gv', '<cmd>vsplit<cr>gd', { silent = true })
