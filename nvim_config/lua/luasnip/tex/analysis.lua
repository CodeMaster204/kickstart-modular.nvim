-- Analysis snippets (or analysis symbols typically)



local ls = require("luasnip")
local s = ls.snippet
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
    s({trig="ee", snippetType="autosnippet", dscr="Expand into \\e^{}"},
        fmta(
            [[e^{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

    -----------------------------INTEGRALS
    s({trig="intt", snippetType="autosnippet", dscr="Expand into integral from a to b"},
        fmta(
            [[\int_{<>}^{<>} <> \diff <>]],
            {i(1,"a"), i(2,"b"), i(3,"f(x)"), i(4,"x")}
        ),
        {condition = math}
    ),

    s({trig="inte", snippetType="autosnippet", dscr="Expand into integral from -infinity to infinity"},
        fmta(
            [[\int_{-\infty}^{\infty} <> \diff <>]],
            {i(1, "f(x)"), i(2,"x")}
        ),
        {condition = math}
    ),

    s({trig="inti", snippetType="autosnippet", dscr="Expand into infefinite integral"},
        fmta(
            [[\int <> \diff <>]],
            {i(1, "f(x)"), i(2,"x")}
        ),
        {condition = math}
    ),

    s({trig="ints", snippetType="autosnippet", dscr="Expand into integral over something written in subscript"},
        fmta(
            [[\int_{<>} <> \diff <>]],
            {i(1,""), i(2, "f(x)"), i(3,"x")}
        ),
        {condition = math}
    ),

    s({trig="intu", snippetType="autosnippet", dscr="Expand into integral with no subscripts or differentials"},
        fmta(
            [[\int]],
            {}
        ),
        {condition = math}
    ),

    s({trig="oint", snippetType="autosnippet", dscr="Expand into circle integral over something written in subscript"},
        fmta(
            [[\oint_{<>} <> \diff <>]],
            {i(1,""), i(2, "f(x)"), i(3,"x")}
        ),
        {condition = math}
    ),

    ---------------------------DERIVATIVES

    s({trig="dds", snippetType="autosnippet", dscr="Expand into a first order single variable derivative in Leibniz notation"},
        fmta(
            [[\frac{\diff <>}{\diff <>}]],
            {i(1,"f"), i(2, "x")}
        ),
        {condition = math}
    ),

    s({trig="ddn", snippetType="autosnippet", dscr="Expand into an nth order single variable derivative in Leibniz notation"},
        fmta(
            [[\frac{\diff^{<>} <>}{\diff <>^{<>}}]],
            {i(1, "n"), i(2,"f"), i(3, "x"), rep(1)}
        ),
        {condition = math}
    ),

}
