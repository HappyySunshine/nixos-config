vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap("n", "<C-s>", ":wa!<CR>", { noremap = true })


   -- the Primagean setup
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>d", [["_dP]])





-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- vim.keymap.set("n", "<leader><leader>", function()
--	vim.cmd("so")
-- end)

vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })

-- Create a horizontal splitader>/', ':vsplit<CR>', { noremap = true })

-- Create a vertical split with <leader>-
vim.api.nvim_set_keymap("n", "<leader>-", ":split<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>/", ":vsplit<CR>", { noremap = true })

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>" , { silent = true })

vim.keymap.set( "n", "<S-h>", vim.cmd.CommentToggle , { silent = true })
vim.keymap.set( "v", "<S-h>", ":'<,'>CommentToggle<CR>" , { silent = true })
vim.cmd(":tnoremap <Esc> <C-\\><C-n>")
