-- Basic environment delimiters and other sub environments (matrices, fracs)



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






return {
    s({trig="fig", snippetType="snippet", dscr="A basic figure environment"},
        fmta(
            [[
            \begin{figure}
            \centering
            \includegraphics[width=0.9\linewidth]{<>}
            \caption{
                \textbf{<>}
                <>
            }
            \label{fig:<>}
            \end{figure}

            ]],
            { i(1,"filename"),
            i(2, "captionBold"),
            i(3, "captionText"),
            i(4,"figureLabel"),}
        )
    ),

    s({trig="neww", snippetType="autosnippet", dscr="Begin and end an arbitrary environment"},
        fmta(
            [[
            \begin{<>}
                <>
            \end{<>}
            
            ]],
            {i(1),i(2),rep(1),}
        ),
        {condition= line_begin}
    ),

    s({trig="ee", snippetType="autosnippet", dscr="Start an equation environment"},
        fmta(
            [[
            \begin{equation}
                <>
            \end{equation}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="aa", snippetType="autosnippet", dscr="Start an align environment"},
        fmta(
            [[
            \begin{align}
                <>
            \end{align}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="saa", snippetType="autosnippet", dscr="Start an align* environment"},
        fmta(
            [[
            \begin{align*}
                <>
            \end{align*}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),

    s({trig="nn", snippetType="autosnippet", dscr="Start an equation environment"},
        fmta(
            [[
            \[
                <>
            \]

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),
    
    s({trig="mm", snippetType="autosnippet", dscr="Start inline math mode"},
        fmta(
            [[\(<>\) ]],
            {i(1)}
        ),
        {condition = notmath}
    ),

    s({trig="pff", snippetType="autosnippet", dscr="Start a proof environment with the box at the end"},
        fmta(
            [[
            \begin{proof}
                <>
            \end{proof}

            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),




    -- Font styles other than mathcal in letters.lua
    s({trig="iit", snippetType="autosnippet", dscr="Italic text"},
        fmta(
            [[\textit{<>} ]],
            {i(1)}
        )
    ),

    s({trig="bbf", snippetType="autosnippet", dscr="Bold face text"},
        fmta(
            [[\textbf{<>} ]],
            {i(1)}
        )
    ),

    
    s({trig="rm", snippetType="autosnippet", dscr="Roman face text"},
        fmta(
            [[\textrm{<>} ]],
            {i(1)}
        ),
        {condition = math}
    ),

    s({trig="op", snippetType="autosnippet", dscr="Operator name"},
        fmta(
            [[\operatorname{<>} ]],
            {i(1)}
        ),
        {condition = math}
    ),

    -- s({trig="mbb", snippetType="autosnippet", dscr="Boldface font but shouldn't need to be used"},
    --     fmta(
    --         [[\mathbb{<>}]],
    --         {i(1)}
    --     ),
    --     {condition = math}
    -- ),

    s({trig="cal", snippetType="autosnippet", dscr="Calligraphic font"},
        fmta(
            [[\mathcal{<>} ]],
            {i(1)}
        ),
        {condition = math}
    ),

}

