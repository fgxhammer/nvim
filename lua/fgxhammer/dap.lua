-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Javascript
local home = os.getenv("HOME")
local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dap_ui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_vt_status_ok, dap_vt = pcall(require, "nvim-dap-virtual-text")
if not dap_vt_status_ok then
	return
end

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { home .. "/dev/ghrepos/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Debug Nodejs (Attach)",
		type = "node2",
		request = "attach",
		port = 9229,
	},
	{
		-- For this to work you need to make sure the node process
		-- is started with the `--inspect` flag.
		name = "Debug Nodejs (Attach pick process)",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
	{
		name = "Debug Nodejs (Launch)",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.loop.cwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}

dap_vt.setup({})

dap_ui.setup({})

-- Open / close dapui
-- dap.listeners.after.event_initialized["dapui_config"] = function()
-- 	dap_ui.open()
-- end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dap_ui.close()
end
