local opts = vim.opt


opts.number = true
opts.relativenumber = true
opts.wrap = false
opts.tabstop = 2
opts.swapfile = false
opts.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.schedule(function()
  opts.clipboard = 'unnamedplus'
end)

opts.winborder = "rounded"
opts.cursorcolumn = false
opts.ignorecase = true
opts.shiftwidth = 2
opts.smartindent = true
opts.undofile = true
opts.signcolumn = "no"

-- Keymaps
local map = vim.keymap.set
vim.g.mapleader = " "


map('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear searches on pressing Esc
map("n", "<leader>o", ':update<CR> :source<CR>', { desc = "Update Config" })

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('i', '<C-e>', function() vim.lsp.completion.get() end)
map('n', '<leader>lf', vim.lsp.buf.format)

map('n', '-', "<CMD>:Oil<CR>", { desc = "Open Oil"})
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fb', '<CMD>Telescope buffers<CR>')

-- Git 
map('n', '<leader>gf', '<CMD>Telescope git_files<CR>')
map('n', '<leader>gs', '<CMD>Telescope git_status<CR>')


	-- Moving Windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Packages
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/Saghen/blink.cmp'},
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/refractalize/oil-git-status.nvim' },
	{ src = 'https://github.com/norcalli/nvim-colorizer.lua.git' },
	{ src = 'https://github.com/RaafatTurki/corn.nvim'},
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	--	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

vim.cmd("colorscheme vague")


-- Plugins
require 'plugins.corn'
require 'plugins.colorizer'
require 'plugins.blink'
require "mason".setup()
require("oil").setup({
  win_options = {
    signcolumn = "yes:2",
  },
})

require("oil-git-status").setup()



-- LSP
vim.lsp.enable({
	"lua_ls",
	"vscode-css",
	"jsonls",
	"bashls",
})
