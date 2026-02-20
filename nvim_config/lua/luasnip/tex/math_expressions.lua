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
    
    --------------------------------------...
    
    s({trig="...", snippetType="autosnippet", dscr="... -> \\cdots"}, t("\\cdots "), 
        {condition = math}
    ),

    --------------------------------------ROOTS

    s({trig="srt", snippetType="autosnippet", dscr="Expand into squareroot", wordTrig=false},
        fmta(
            [[\sqrt{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="nrt", snippetType="autosnippet", dscr="Expand into nth-root", wordTrig=false},
        fmta(
            [[\sqrt[<>]{<>}]],
            {i(1, "3"), i(2)}
        ),
        {condition = math}
    ),

    -- ==================================Typical expressions which benefit from i nodes
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

    s({trig="ccup", snippetType="autosnippet", dscr="Big union notation"},
        fmta(
            [[\bigcup_{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="ccap", snippetType="autosnippet", dscr="Big intersection notation"},
        fmta(
            [[\bigcap_{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

    ------------------------------------SECTIONING

    s({trig="sE", snippetType="autosnippet", dscr="section"},
        fmta(
            [[\section{<>}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="ssE", snippetType="autosnippet", dscr="subsection"},
        fmta(
            [[\subsection{<>}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="sssE", snippetType="autosnippet", dscr="subsubsection"},
        fmta(
            [[\susbsubsection{<>}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="sP", snippetType="autosnippet", dscr="paragraph"},
        fmta(
            [[\paragraph{<>}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="ssP", snippetType="autosnippet", dscr="subparagraph"},
        fmta(
            [[\subparagraph{<>}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    ------------------------- LEFT RIGHT PAIRS (w/ or w/o left right mods)

    s({trig="lrp", snippetType="autosnippet", dscr="left right parentheses pair"},
        fmta(
            [[\left( <> \right) ]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="lrs", snippetType="autosnippet", dscr="left right curly brackets pair"},
        fmta(
            [[\left\{ <> \right\} ]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="lro", snippetType="autosnippet", dscr="left right other pair"},
        fmta(
            [[\left<> <> \right<> ]],
            {i(1, "|"), i(2), i(3,"|")}
        ),
        {condition = math}
    ),

    s({trig="lra", snippetType="autosnippet", dscr="left right angled brackets pair"},
        fmta(
            [[\left\langle <> \right\langle ]],
            {i(1)}
        ),
        {condition = math}
    ),
    
    s({trig="eval", snippetType="autosnippet", dscr="Evaluation bar. Write before expression to be evaluated"},
        fmta(
            [[\left. <> \right|_{<>}]],
            {i(1), i(2)}
        ),
        {condition = math}
    ),

    s({trig="set", snippetType="autosnippet", dscr="Creates a pair of curly brackets with left right modifiers"},
        fmta(
            [[\{ <> \} ]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="abs", snippetType="autosnippet", dscr="Creates the left| and right | for absolute value."},
        fmta(
            [[\left| <> \right| ]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="ceil", snippetType="autosnippet", dscr="Creates a pair of left, right ceiling brackets"},
        fmta(
            [[\left\lceil <> \right\rceil ]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="floor", snippetType="autosnippet", dscr="Creates a pair of left, right ffloor brackets"},
        fmta(
            [[\left\lfloor <> \right\rfloor ]],
            {i(1)}
        ),
        {condition = math}
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

    iny = "\\infty ",
    del = "\\partial",
    dee = "\\diff",

    time = "\\times ",
    dot = "\\cdot ",
    circ = "\\circ ",

    vdd = "\\vdots",
    ddd = "\\ddots", -- ... lives in the above block

    to = "\\to ",
    mto = "\\mapsto ",
    impl = "\\Rightarrow ",
    iff = "\\iff ",

    inn = "\\in ",
    nin = "\\notin ",
    cup = "\\cup ", -- The capital versions exist in the above block, with sum and prod
    cap = "\\cap ",
    subb = "\\subset ",
    subeq = "\\subseteq ",

    trianglel = "\\triangleleft ",

    langle = "\\langle ",
    rangle = "\\rangle ",

    neq = "\\neq ",
    leq = "\\leq ",
    geq = "\\geq ",

    land = "\\land ",
    lor = "\\lor ",
    lnot = "\\lnot ",

    quad = "\\quad",
    qquad = "\\qquad",

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
