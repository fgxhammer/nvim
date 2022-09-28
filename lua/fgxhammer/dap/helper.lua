local dap = require("dap")

local M = {}

M.attach = function()
	print("attaching...")
	dap.run({
		type = "node2",
		request = "attach",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
	})
end

M.attachToRemote = function()
	print("attaching")
	dap.run({
		type = "node2",
		request = "attach",
		address = "127.0.0.1",
		port = 9229,
		localRoot = vim.fn.getcwd(),
		remoteRoot = "/home/vcap/app",
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
	})
end

return M
