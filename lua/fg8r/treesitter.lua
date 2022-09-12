local configs = require("nvim-treesitter.configs")
configs.setup {
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  autopairs = { enable = true },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
  },
  context_commmentstring = {
    enable = true,
    enable_autocmd = false
  }
}
