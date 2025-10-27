require 'blink.cmp'.setup({
		keymap = { preset = 'enter'},
		completion = {
			accept = { auto_brackets = { enabled = true }, },
			list = {
				selection = { preselect = false, auto_insert = false }
			}
		},
		sources = {
    	default = { 'lsp', 'path', 'snippets', 'buffer' },
  	},
})
