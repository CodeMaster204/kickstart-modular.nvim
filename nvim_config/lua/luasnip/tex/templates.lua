-- Templates for latex



local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
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


local commands = [[
\newcommand{\diff}{\ensuremath{\operatorname{d}\!}}
]]
local packages = [[
\usepackage{amsmath, amssymb}
\usepackage{esint}
]]

local function commands_node()
    return t(vim.split(commands, "\n"))
end
local function packages_node()
    return t(vim.split(packages, "\n"))
end


return {
    s(
        {trig = "latemplate", dscr = "Choose LaTeX template"},
        
        c(1, {
            -- Note taking template
            fmta([[
\documentclass{article}
<>
<>
\title{<>}
\date{\today}
\begin{document}
\maketitle


<>


\end{document}
                ]],
                {
                    packages_node(), commands_node(), 
                    i(1,"Title"),
                    i(2)
                }
            ),

            -- Assignment template
            fmta([[
\documentclass{article}
<>
<>
\title{<>}
\author{<>}
\date{<>}

\begin{document}

\maketitle


<>


\end{document}
                ]],
                {
                    packages_node(), commands_node(), 
                    i(1,"Title"),
                    i(2,"Author"),
                    i(3,"Date"),
                    i(4)
                }
            ),

            -- Minimal template
            fmta([[
    \documentclass{article}
    \begin{document}

    <>

    \end{document}
                    ]],
                {i(1)}
            )
        }),
        {condition=line_begin}
    )
}
-- return {
--     s(
--         {trig = "latemplate", dscr = "Choose LaTeX template"},
--
--         c(1, {
--             -- Note taking template
--             sn(nil,
--                 fmta([[
-- \documentclass{article}
-- <>
-- <>
-- \title{<>}
-- \date{\today}
-- \begin{document}
-- \maketitle
--
--
-- <>
--
--
-- \end{document}
--                     ]],
--                     {
--                         packages_node(), commands_node(), 
--                         i(1,"Title"),
--                         i(0)
--                     }
--                )
--             ),
--
--             -- Assignment template
--             sn(nil,
--                 fmta([[
-- \documentclass{article}
-- <>
-- <>
-- \title{<>}
-- \author{<>}
-- \date{<>}
--
-- \begin{document}
--
-- \maketitle
--
--
-- <>
--
--
-- \end{document}
--                     ]],
--                     {
--                         packages_node(), commands_node(), 
--                         i(1,"Title"),
--                         i(2,"Author"),
--                         i(3,"Date"),
--                         i(0)
--                     }
--                 )
--             ),
--
--             -- Minimal template
--             sn(nil,
--                 fmta([[
--     \documentclass{article}
--     \begin{document}
--
--     <>
--
--     \end{document}
--                     ]],
--                     {i(0)}
--                 )
--             )
--         }),
--         {condition=line_begin}
--     )
-- }
