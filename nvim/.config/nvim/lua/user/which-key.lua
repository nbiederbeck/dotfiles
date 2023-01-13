local wk = require("which-key")

maps = {
	f = {
		name = "file",
		f = { "<CMD>Files<CR>", "Find Files" },
		b = { "<CMD>Buffers<CR>", "Find Buffers" },
	},
}

wk.register(maps, { prefix = "<leader>" })
