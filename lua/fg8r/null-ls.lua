local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.eslint
}

null_ls.setup({
  sources = sources
})
