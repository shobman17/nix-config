
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<Leader>nh', ':nohlsearch<CR>')                                                                            
-- tab and windowpane related maps
vim.keymap.set('n', '<c-Left>', ':wincmd h<CR>')                                                                            
vim.keymap.set('n', '<c-Right>', ':wincmd l<CR>')
vim.keymap.set('n', '<c-Up>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-Down>', ':wincmd j<CR>')
vim.keymap.set('n', '<s-Left>', ':tabprevious<CR>')                                                                            
vim.keymap.set('n', '<s-Right>', ':tabnext<CR>')
vim.keymap.set('n', '<c-t>', ':tabnew %<CR>')
