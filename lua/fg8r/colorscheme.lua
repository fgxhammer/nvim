local colorscheme = "gruvbox"

if colorscheme == "catppuccin" then
  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
  require("catppuccin").setup({
    transparent_background = true,
    term_colors = false,
    compile = {
      enabled = false,
      path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "bold" },
      loops = {},
      functions = { "bold" },
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = { "bold" },
      operators = {},
    },
    integrations = {
      -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
    },
    color_overrides = {},
    highlight_overrides = {},
  })
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
