local opts = { noremap = true, silent = true }
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

keymap("n", "<leader>E", ":NvimTreeFindFileToggle<cr>", opts)
keymap("n", "<leader>q", ":q<cr>", opts)
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader><leader>q", ":bd<cr>", opts)

-- Navigation
keymap("n", "<leader>hh", "<C-w>h", opts)
keymap("n", "<leader>jj", "<C-w>j", opts)
keymap("n", "<leader>kk", "<C-w>k", opts)
keymap("n", "<leader>ll", "<C-w>l", opts)

-- Tabs
keymap("n", "<leader>to", "<cmd>tabedit %<cr>", opts)
keymap("n", "<leader>tc", "<cmd>tabclose<cr>", opts)
keymap("n", "<leader>tn", "<cmd>tabnext<cr>", opts)
keymap("n", "<leader>tp", "<cmd>tabprevious<cr>", opts)

-- Qf list
keymap("n", "<leader>co", "<cmd>copen<cr>", opts)
keymap("n", "<leader>cc", "<cmd>cclose<cr>", opts)
keymap("n", "<leader>cn", "<cmd>cnext<cr>", opts)
keymap("n", "<leader>cp", "<cmd>cprev<cr>", opts)
keymap("n", "<leader>ch", "<cmd>chistory<cr>", opts)

-- Resize
keymap("n", "<C-j>", ":resize +2<cr>", opts)
keymap("n", "<C-k>", ":resize -2<cr>", opts)
keymap("n", "<C-l>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-h>", ":vertical resize +2<cr>", opts)

-- Buffer nav
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Crazy Esc
keymap("i", "jk", "<esc>", opts)
keymap("i", "jj", "<esc>", opts)

-- No hls
keymap("n", "<leader>nh", ":nohls<cr>", opts)

-- Insert newline stay in nromal mode
keymap("n", "<leader>o", 'o<esc>0"_D', opts)
keymap("n", "<leader>O", 'O<esc>0"_D', opts)

-- Stay in indent mode
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Move text up down
keymap("x", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- Quick source with uncaching modules
function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match("^fgxhammer") then
			package.loaded[name] = nil
		end
	end
	-- Set $MYVIMRC
	dofile(vim.env.MYVIMRC)
end
keymap("n", "<Leader><leader>,", "<cmd>lua ReloadConfig()<cr>", opts)
-- vim.cmd('command! ReloadConfig lua ReloadConfig()')

-- #### Plugin sepcific ####

-- Diffview
keymap("n", "<leader>do", "<cmd>DiffviewOpen<cr>", opts)
keymap("n", "<leader>dc", "<cmd>DiffviewClose<cr>", opts)
keymap("n", "<leader>df", "<cmd>DiffviewFileHistory %<cr>", opts)

-- Telescope
keymap("n", "<leader>e", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>f*", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F1>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F2>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F3>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<F4>", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<leader>da", "<cmd>lua require'fgxhammer.dap.helper'.attach()<cr>", opts)
