vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.whichwrap = h,l
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = ""
-- " Vim
-- vim.g.indentLine_color_term = 239

-- " GVim
-- vim.g.indentLine_color_gui = '#fff480'
-- vim.g.indentLine_color_gui = '#d6baff'

-- " none X terminal
-- vim.g.indentLine_color_tty_light = 7
-- vim.g.indentLine_color_dark = 1
                    
                            
                                
                                
-- " Background (Vim, GVim)
-- vim.g.indentLine_bgcolor_term = 202
-- vim.g.indentLine_bgcolor_gui = '#FF5F00'
