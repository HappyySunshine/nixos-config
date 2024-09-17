vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap("n", "<C-s>", ":wa!<CR>", { noremap = true })

        -- my setup 
vim.keymap.set("v", "<Tab>", "> | gv")
vim.keymap.set("v", "<S-Tab>", "< | gv")
-- the Primagean setup
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- greatest remap ever
vim.keymap.set("x", "<leader>dd", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true })

-- Create a horizontal splitader>/', ':vsplit<CR>', { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>-", ":split<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>/", ":vsplit<CR>", { noremap = true })

-- PLUGINS 
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>" , { silent = true })
vim.keymap.set( "n", "<S-h>", vim.cmd.CommentToggle , { silent = true })
vim.keymap.set( "v", "<S-h>", ":'<,'>CommentToggle<CR>" , { silent = true })
vim.cmd(":tnoremap <Esc> <C-\\><C-n>")

-- TABS
vim.keymap.set("n", "th", "<cmd>tabprevious<CR>" , { silent = true })
vim.keymap.set("n", "tl", "<cmd>tabnext<CR>" , { silent = true })
-- vim.keymap.set("n", "tn", "<cmd>tabnew | b# | tabprevious | q! | tabnext<CR>" , { silent = true })
vim.keymap.set("n", "tn", "<cmd>tabnew<CR>" , { silent = true })
vim.keymap.set("n", "to", "<cmd>tabonly!<CR>" , { silent = true })
vim.keymap.set("n", "tq", "<cmd>tabc<CR>" , { silent = true })

-- QUICKFIX
vim.keymap.set("n", "qj", "<cmd>cnext<CR>" , { silent = true })
vim.keymap.set("n", "qk", "<cmd>cprev<CR>" , { silent = true })
vim.keymap.set("n", "qq", "<cmd>ccl<CR>" , { silent = true })

-- BUFFERS
vim.keymap.set("n", "not", "<cmd>:term<CR>" , { silent = true })
vim.keymap.set("n", "nbw", "<cmd>%bwipeout!<CR>" , { silent = true })
vim.keymap.set("n", "nbq", "<cmd>bdelete!<CR>" , { silent = true })
vim.keymap.set("n", "nbd", "<cmd>bdelete!<CR>" , { silent = true })




