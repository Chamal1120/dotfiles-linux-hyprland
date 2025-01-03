return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		-- Disable for some filetypes
		enabled = function()
			return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,
		completion = {
			menu = {
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind" } },
				},
			},
      ghost_text = { enabled = false },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
      -- Disable cmdline completions
      cmdline = {},
		},
	},
	opts_extend = { "sources.default" },
}
