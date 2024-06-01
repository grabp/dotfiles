local swenv = require("swenv")
local wk = require("which-key")

swenv.setup({
	get_venvs = function(venvs_path)
		return require("swenv.api").get_venvs(venvs_path)
	end,
	venvs_path = vim.fn.expand("~/.pyenv/versions"),
	-- Something to do after setting an environment, for example call vim.cmd.LspRestart
	post_set_venv = vim.cmd.LspRestart,
})

wk.register({
	["<leader>py"] = {
		name = "Python",
		e = {
			function()
				require("swenv.api").pick_venv()
			end,
			"Environment",
		},
	},
})
