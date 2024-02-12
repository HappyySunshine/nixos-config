local config = require('banana.config')
local M = {}

function M.colorscheme(options)
	--if options then
	--	config.extend(options)
	--end
--
--	if vim.g.colors_name then
--		vim.cmd('hi clear')
--	end

--	vim.opt.termguicolors = true
--	vim.g.colors_name = 'rose-pine'

	require('banana.theme')._load(config)
end

M.setup = config.setup

return M
