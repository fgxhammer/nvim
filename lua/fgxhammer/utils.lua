-- Utils for neovim

local M = {}

M.errpcall = function(call, module)
	pcall(call, module)
end
