local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Follow the leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

keymap("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>s", ":w<CR>", opts)
keymap("n", "<leader><leader>q", ":bd<CR>", opts)

-- Windows
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

-- Resize
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)

-- Buffer nav
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>jj", "<C-^>", opts)

-- Crazy Esc
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- No hls
keymap("n", "<leader>nh", ":nohls<CR>", opts)

-- Insert newline stay in nromal mode
keymap("n", "<leader>o", "o<Esc>0\"_D", opts)
keymap("n", "<leader>O", "O<Esc>0\"_D", opts)

-- Stay in indent mode
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Move text up down
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Smart pasting
keymap("v", "p", '"_dp', opts)

-- Quick source with uncaching modules
function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^fg8r') then
      package.loaded[name] = nil
    end
  end
  -- Set $MYVIMRC
  dofile(vim.env.MYVIMRC)
end

keymap('n', '<Leader><leader>s', '<Cmd>lua ReloadConfig()<CR>', opts)
vim.cmd('command! ReloadConfig lua ReloadConfig()')
