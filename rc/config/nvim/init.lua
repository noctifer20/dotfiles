vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('plugins')
require('evil_lualine')
require('typescript')
require('treesitter')
require('telescope_cfg')
require('bufferline_cfg')
require('cmp_cfg')
require('lspsaga_cfg')
require('nvim_tree_cfg')
require('onedark').load()

vim.cmd 'set runtimepath^=~/.vim runtimepath+=~/.vim/after'
vim.cmd 'let &packpath = &runtimepath'
vim.cmd 'source ~/.vimrc'

vim.cmd 'set termguicolors'

