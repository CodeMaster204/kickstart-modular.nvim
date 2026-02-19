local modules = {
    require("luasnip.tex.letters"), -- Greek letters
    require("luasnip.tex.environments"), -- Environment starters/delimiters
    require("luasnip.tex.math_expressions"), -- Math expressions
    require("luasnip.tex.postfix"), -- Environment starters/delimiters
    require("luasnip.tex.analysis"), -- Typical analysis symbols
    require("luasnip.tex.linalg"), -- Linear algebra snippets
}

local all_snippets = {}

for _, module in ipairs(modules) do
    vim.list_extend(all_snippets, module)
end

return all_snippets
