require('wilder').setup({modes = {':', '/', '?'}})
require("scrollbar").setup()
require("scrollbar.handlers.search").setup({
	override_lens = function() end,
})
require('gitsigns').setup()
require('hlslens').setup()

require("ibl").setup()

require('tabnine').setup({
	disable_auto_comment=true,
	accept_keymap="<C-CR>",
	dismiss_keymap = "<C-e>",
	debounce_ms = 800,
	suggestion_color = {gui = "#808080", cterm = 244},
	exclude_filetypes = {"TelescopePrompt", "NvimTree"},
	log_file_path = nil, -- absolute path to Tabnine log file
})



-- Set up lspconfig.
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Set up LSP language servers
require('mason').setup()
require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "pyright", "jdtls" },
}

-- Set up Mason for installing language servers
local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 
	  "clangd",						-- C, C++
	  "pyright", 					-- Python
	  "jdtls", 						-- Java
	  "arduino_language_server",	-- Arduino
	  "bashls",						-- Bash
	  "cmake",						-- CMake
	  "dockerls",					-- Dockerfile
	  "jsonls",						-- JSON
	  "lua_ls",						-- Lua
	  "sqlls",						-- SQL
	  "taplo",						-- TOML
	  "lemminx",					-- XML
	  "yamlls",						-- YAML
  },
  handlers = {default_setup},
})

-- require('lspconfig').pyright.setup{}
-- require('lspconfig').jdtls.setup{}


-- Set up snippets
require("luasnip.loaders.from_vscode").lazy_load()


local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Set up nvim-cmp.
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			-- elseif luasnip.expandable() then
			-- 	luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
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

	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'buffer' },
		{ name = 'path' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

require("Comment").setup()
require("nvim-autopairs").setup()

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
require("better_escape").setup({
	mapping = {"jj"},
	timeout = vim.o.timeoutlen,
	clear_empty_lines = false,
	keys = "<Esc>",
})
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
	},
	extensions = {

	}
})


local function nvim_tree_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', '<Leader>t', api.tree.change_root_to_node, opts('CD'))
end


require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 40,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	on_attach = nvim_tree_on_attach,
	update_focused_file = {
		enable = true,
	}
})



local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
