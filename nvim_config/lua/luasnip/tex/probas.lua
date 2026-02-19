-- Linear algebra snippets (mostly matrices for now)



local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


-- use vimtex to determine if we are in a math context
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function notmath()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 0
end

return{

    s({trig="prob", snippetType="autosnippet", dscr="Expands into the custom prob function"}, t([[\\prob ]]), {condition=math}),

    s({trig="given", snippetType="autosnippet", dscr="Creates a bar for 'given' - in an lr environment /!\\"},
        t(
            [[\;\middle|\; ]]
        ),
        {condition = math}
    ),

    s({trig="ncr", snippetType="autosnippet", dscr="Insert nCr in 'vector' form"},
        fmta(
            [[\binom{<>}{<>} ]],
            {i(1,"n"),i(2,"r")}
        ),
        {condition = math}
    ),
}
