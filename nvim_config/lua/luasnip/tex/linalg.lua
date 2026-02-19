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

local function matrixBody(_, snip)
    local rows = tonumber(snip.captures and snip.captures[1]) -- Number of rows
    local cols = tonumber(snip.captures and snip.captures[2]) -- Number of columns
    local nodes = {} -- Nodes table, essentially the dynamically generated fmta
    local index = 1 -- Index for the current insert node
    if not rows or not cols then
        return sn(nil, {t("")})
    end

    for r = 1, rows do
        for c = 1, cols do
            table.insert(nodes, i(index))
            index = index + 1
            if c < cols then
                table.insert(nodes, t(" & "))
            end
        end

        if r < rows then
            table.insert(nodes, 
            t({"\\\\", ""}))
        end
    end
    
    return sn(nil, nodes)
end

function whichMatrix(_, snip)
    if snip.captures[3] == "p" then
        return sn(nil, {t("pmatrix")})
    elseif snip.captures[3] == "b" then
        return sn(nil, {t("bmatrix")})
    else
        return sn(nil, {t("vmatrix")})
    end
end

return{
    s(
        {trig = "(%d+)x(%d+)([pbv])at", regTrig=true, snippetType="autosnippet"},
        {
            -- Begin part of the snippet
            t("\\begin{"),
            d(1, whichMatrix),
            t({"}", ""}),

            -- Body of the matrix

            d(2, matrixBody),

            -- End part of the snippet
            
            t({"","\\end{"}),
            d(3, whichMatrix),
            t({"}", ""}),
            
        }
    ),

    ----------------------------------- OTHER

    s({trig="nn", snippetType="autosnippet", dscr="Double barred norm for vectors - with left/right"},
        fmta(
            [[\left\lVert<>\right\rVert ]],
            {i(1)}
        ),
        {condition = math}
    ),
}
