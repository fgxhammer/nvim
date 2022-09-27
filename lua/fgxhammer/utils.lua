-- Utils for neovim

local M = {}

M.fgpcall = function (call, module)
  pcall(call, module)
end

