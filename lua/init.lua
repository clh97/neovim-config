local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
	{ 'neovim/nvim-lspconfig' },
	{ 'tpope/vim-sensible' },
	{ 'morhetz/gruvbox' },
	{ 'scrooloose/nerdtree' },
	--{ 'junegunn/fzf', run = 'fzf#install()' },
	--{ 'junegunn/fzf.vim' },
	{ 'github/copilot.vim' },
	-- { 'terryma/vim-multiple-cursors' },
	-- { 'sheerun/vim-polyglot' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'tpope/vim-commentary' },
	{ 'tpope/vim-surround' },
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	{ 'nvim-treesitter/playground' },
	{ 'nvim-lua/plenary.nvim' },
	{ "pmizio/typescript-tools.nvim", dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }, opts = {} },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'nvim-telescope/telescope.nvim' },
	{ 'sindrets/diffview.nvim' },
	-- { 'rmagatti/auto-session' },
	{ 'lewis6991/gitsigns.nvim' },
	{ "ray-x/go.nvim",
		dependencies = { "ray-x/guihua.lua", "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("go").setup({ lsp_codelens = false, lsp_keymaps = false, lsp_inlay_hints = { enable = false }})
		end,
		event = {"CmdlineEnter"},
					ft = {"go", 'gomod'},
		build = ':lua require("go.install").update_all_sync()'
	}
})

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimports()
		end,
	group = format_sync_grp,
})

-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- require('auto-session').setup({
--	 log_level = 'info',
--	 auto_session_enable_last_session = true,
--	 auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
--	 auto_session_enabled = true,
--	 auto_save_enabled = true,
--	 auto_restore_enabled = true,
--	 auto_session_suppress_dirs = nil
-- })

require('gitsigns').setup()

vim.opt.scrolloff = 10

-- NERDTree settings
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeChDirMode = 2

-- FZF settings
-- vim.g.fzf_command_prefix = 'Fz'
-- vim.g.fzf_history_dir = '~/.local/share/fzf-history'
-- vim.env.FZF_DEFAULT_COMMAND = 'find . -type f'

local builtin = require('telescope.builtin')
local utils = require("telescope.utils")

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>N', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit ~/.config/nvim/lua/init.lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':source ~/.config/nvim/lua/init.lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rl', ':luafile ~/.config/nvim/lua/init.lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Right>', '<C-w>l', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>gh', ':vsp | terminal lazygit<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>f', ':FZF %:p:h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nf', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':Windows<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>;', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tq', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':tabn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><S-Tab>', ':tabp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gv', ':DiffviewOpen<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':DiffviewClose<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gi', '<cmd>tab split | lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<2-LeftMouse>', '<cmd>tab split | lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })

-- Telescope key mappings
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Appearance and behavior
vim.cmd('colorscheme gruvbox')
vim.o.background = 'dark'
vim.cmd('syntax enable')
vim.o.hidden = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.inccommand = 'split'

-- Setup nvim-cmp
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	})
})

-- Setup lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['tsserver'].setup {
	capabilities = capabilities
}

require('lspconfig').gopls.setup {
	cmd = {"gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	on_attach = function(client, bufnr)
		-- Key mappings for LSP functions
		local opts = { noremap=true, silent=true }
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>tab split | lua vim.lsp.buf.implementation()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<2-LeftMouse>', '<cmd>tab split | lua vim.lsp.buf.implementation()<CR>', opts)
	end,
}
