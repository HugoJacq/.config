local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual
-- ----------------------------------------------------------------------------

return {
  -- italic font implementing visual selection
  s(
    { trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
    fmta("\\textit{<>}", {
      d(1, get_visual),
    })
  ),
  -- underlined implementing visual selection
  s(
    { trig = "tuu", dscr = "Expands 'tuu' into LaTeX's underline{} command." },
    fmta("\\underline{<>}", {
      d(1, get_visual),
    })
  ),
  -- underlined implementing visual selection
  s(
    { trig = "tbb", dscr = "Expands 'tbb' into LaTeX's textbf{} command." },
    fmta("\\textbf{<>}", {
      d(1, get_visual),
    })
  ),

  -- type writer font
  s(
    { trig = "ttt", dscr = "Expands 'ttt' into LaTeX's textit{} command." },
    fmta("\\texttt{<>}", {
      d(1, get_visual),
    })
  ),
  -- cite
  s(
    { trig = "\\c", dscr = "cite shortcut" },
    fmta("\\cite{<>}", {
      i(1),
    })
  ),
  -- citep
  s(
    { trig = "\\p", dscr = "citep shortcut" },
    fmta("\\citep{<>}", {
      i(1),
    })
  ),
  -- ref
  s(
    { trig = "ref", dscr = "citep shortcut" },
    fmta("\\ref{<>}", {
      i(1),
    })
  ),
  -- newline
  s({
    trig = "nwl",
    snippetType = "autosnippet",
  }, { t("\\newline") }),
  -- url
  s(
    { trig = "url", dscr = "url shortcut" },
    fmta("\\url{<>}", {
      i(1),
    })
  ),
}
