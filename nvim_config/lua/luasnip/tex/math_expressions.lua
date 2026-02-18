-- General math expressions like frac, exp, sum, prod etc.



local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- use vimtex to determine if we are in a math context
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function notmath()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 0
end


local snippets = {
    -- ================================Generic modifiers (^ and _)
    s({trig=';;', snippetType="autosnippet", dscr="Expand into ^{}", wordTrig=false},
        fmta(
            [[^{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig=",,", snippetType="autosnippet", dscr="Expand into _{}", wordTrig=false},
        fmta(
            [[_{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

    -- ==================================Typical expressions
    s({trig="ff", snippetType="autosnippet", dscr="Expand into \\frac{}{}"},
        fmta(
            [[\frac{<>}{<>}]],
            {i(1), i(2)}
        ),
        {condition = math}
    ),

    s({trig="sum", snippetType="autosnippet", dscr="Big sum notation"},
        fmta(
            [[\sum_{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="prod", snippetType="autosnippet", dscr="Big product notation"},
        fmta(
            [[\prod_{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="sE", snippetType="autosnippet", dscr="section"},
        fmta(
            [[\section{<>}]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="ssE", snippetType="autosnippet", dscr="subsection"},
        fmta(
            [[\subsection{<>}]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="sssE", snippetType="autosnippet", dscr="subsubsection"},
        fmta(
            [[\susbsubsection{<>}]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="sP", snippetType="autosnippet", dscr="paragraph"},
        fmta(
            [[\paragraph{<>}]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="ssP", snippetType="autosnippet", dscr="subparagraph"},
        fmta(
            [[\subparagraph{<>}]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

}


local other_abbrevs= {
    sin = "\\sin",
    cos = "\\cos",
    tan = "\\tan",
    asin = "\\arcsin",
    acos = "\\arccos",
    atan = "\\arctan",
    hsin = "\\sinh",
    hcos = "\\cosh",
    htan = "\\tanh",

    iny = "\\infty",
    del = "\\del",
    dot = "\\cdot",
    time = "\\times",

    neq = "\\neq",
    geq = "\\geq",
    leq = "\\leq",
}
for trig, expansion in pairs(other_abbrevs) do

    table.insert(snippets,
        s({trig=trig, snippetType="autosnippet"},
            {t(expansion)},
            {condition=math}
        )
    )
end
-- table.insert(snippets,
-- s({trig="sin", snippetType="autosnippet"},
-- {t("\\sin")},
-- {condition=math})
-- )


return snippets
