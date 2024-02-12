local yellow ='#faff00'
local orange='#ff6700'
local lgreen= '#99ff86'
local green ='#5be741'
local golden = '#bfc90d'
local grey = '#554fff'
local red = '#ff0000'
vim.cmd('highlight normal guibg=#000000 guifg='.. yellow)
vim.cmd('highlight EndOfBuffer guibg=#000000 guifg='.. yellow)


vim.cmd('highlight Constant guifg='.. green)
vim.cmd('highlight Identifier guifg=' .. lgreen)
vim.cmd('highlight Statement guifg='.. yellow)
vim.cmd('highlight PreProc guifg=' .. grey)
vim.cmd('highlight Type guifg='.. yellow)
vim.cmd('highlight Special guifg='.. grey)
vim.cmd('highlight Underlined guifg='.. golden)
vim.cmd('highlight Error guifg='.. red)
vim.cmd('highlight Todo guifg='.. orange)
vim.cmd('highlight Todo guibg=#000000 ')


