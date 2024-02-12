local M = {}

function M._load(options)
    print("IM BEING CALLED")
    local h = require('banana.util').highlight
    local p = require('banana.palette')
    local c = options.highlight

    --local groups = options.grnoups or {}
    -- local maybe = {
    --   base= groups.background
    -- }
    --
       --h('SplitBackground', { fg = p.banana, bg = p.blue, })
    --  h('Normal', { fg = p.banana, bg = p.none, })
    -- h('EndOfBuffer', { fg = p.banana, bg = p.none, })
    -- h('VertSplit', { fg = p.yellow, bg = p.bg, })
    -- h('StatusLine', { fg = p.grey, bg = p.bg, })
    -- h('StatusLineNC', { link = 'StatusLine' })
    --
    --
    -- h('keyword', { fg = p.magenta })
    -- h('identifier', { fg = p.banana })
    --  h('operator', { fg = p.lpink })
    --  h('constant', { fg = p.lpink })
    -- h('variable', { fg = p.yellow })
    -- --  h('attribute', { fg = p.banana })
    --  h('boolean', { fg = p.grey })
    --  h('conditional', { fg = p.lgreen })
    h('comment', { fg = p.green })
    --  h('character', { fg = p.golden })
    --  h('IdentifierFg', { fg = p.blue })
    --  h('arguments', { fg = p.pink })
    --  h('table_constructor', { fg = p.grey })
    h('function', { fg = p.dblue})
    h('Delimiter', { fg = p.cyan })
    h('SpecialDelimeter', { fg = p.grey })
    h('string', { fg = p.blue, italic = true })
    h('comma', { fg = p.grey })
    h('dot', { fg = p.dblue })
    h('delimiter', { fg = p.pink })
    h('special', { fg = p.purple })
    --
    -- h('@property', { fg = p.yellow, italic = true })
    -- h('@variable', { fg = p.banana, italic = true })
    -- h('@field', { fg = p.yellow, italic = true, nocombine=true })
    --
    -- h('@lsp.type.enum', { link = '@type' })
    -- h('@lsp.type.keyword', { link = '@keyword' })
    -- h('@lsp.type.interface', { link = '@interface' })
    -- h('@lsp.type.namespace', { link = '@namespace' })
    -- h('@lsp.type.parameter', { link = '@parameter' })
    -- h('@lsp.type.property', { link = '@property' })
    -- h('@lsp.type.variable', { link = '@variable' }) -- use treesitter styles for regular variables
    -- h('@lsp.typemod.function.defaultLibrary', { link = 'Special' })
    -- h('@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })
    --
    -- vim.cmd([[highlight LineNrAbove  guifg=p.golden ctermbg=none guibg=none]])
    -- vim.cmd([[highlight LineNrBelow  guifg=p.golden ctermbg=none guibg=none]])
    -- vim.cmd([[highlight CursorLineNr guifg=p.yellow ctermbg=none guibg=none]])

    vim.cmd([[highlight SignColumn guibg=none]])

end

return M
