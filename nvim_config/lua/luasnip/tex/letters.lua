-- letters.lua
-- Greek letters and mathcal snippets

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node



-- use vimtex to determine if we are in a math context
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end


local function latex_letter(trig, expansion)
    return s(
        { trig = ";" .. trig, snippetType = "autosnippet", desc = expansion, wordTrig = false },
        { t("\\" .. expansion) },
        {condition = math}
    )
end

local function bb_letter(letter)
    return s(
        { trig = ";u" .. letter, snippetType = "autosnippet", desc = "mathbb: " .. letter, wordTrig = false },
        { t("\\mathbb{" .. string.upper(letter) .. "}") },
        {condition = math}
    )
end

return {

    -- Normal Greek letters
    latex_letter("a","alpha"),
    latex_letter("b","beta"),
    latex_letter("c","chi"),
    latex_letter("d","delta"),
    latex_letter("e","epsilon"),
    latex_letter("f","phi"),
    latex_letter("g","gamma"),
    latex_letter("h","eta"),
    latex_letter("i","iota"),
    latex_letter("k","kappa"),
    latex_letter("l","lambda"),
    latex_letter("m","mu"),
    latex_letter("n","nu"),
    latex_letter("o","omega"),
    latex_letter("p","pi"),
    latex_letter("q","psi"),
    latex_letter("r","rho"),
    latex_letter("s","sigma"),
    latex_letter("t","tau"),
    latex_letter("w","theta"),
    latex_letter("x","xi"),
    latex_letter("y","upsilon"),
    latex_letter("z","zeta"),

    -- Capital Greek letters
    latex_letter("jd","Delta"),
    latex_letter("jf","Phi"),
    latex_letter("jg","Gamma"),
    latex_letter("jl","Lambda"),
    latex_letter("jo","Omega"),
    latex_letter("jp","Pi"),
    latex_letter("jq","Psi"),
    latex_letter("js","Sigma"),
    latex_letter("jw","Theta"),
    latex_letter("jx","Xi"),
    latex_letter("jy","Upsilon"),

    -- Variant forms
    latex_letter("ve", "varepsilon"),
    latex_letter("vr", "varrho"),
    latex_letter("vk", "varkappa"),
    latex_letter("vs", "varsigma"),
    latex_letter("vp", "varpi"),
    latex_letter("vf", "varphi"),
    latex_letter("vw", "vartheta"),

    -- Blacboard letters
    bb_letter("a"), bb_letter("b"), bb_letter("c"), bb_letter("d"),
    bb_letter("e"), bb_letter("f"), bb_letter("g"), bb_letter("h"),
    bb_letter("i"), bb_letter("j"), bb_letter("k"), bb_letter("l"),
    bb_letter("m"), bb_letter("n"), bb_letter("o"), bb_letter("p"),
    bb_letter("q"), bb_letter("r"), bb_letter("s"), bb_letter("t"),
    bb_letter("u"), bb_letter("v"), bb_letter("w"), bb_letter("x"),
    bb_letter("y"), bb_letter("z"),
}

