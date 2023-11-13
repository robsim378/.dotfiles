require('wilder').setup({modes = {':', '/', '?'}})
require("scrollbar").setup()
require("scrollbar.handlers.search").setup({
	override_lens = function() end,
})
require('gitsigns').setup()
require('hlslens').setup()

require("ibl").setup()

require("Comment").setup()
require("nvim-autopairs").setup()

require("nvim-treesitter").setup({
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
})



local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
