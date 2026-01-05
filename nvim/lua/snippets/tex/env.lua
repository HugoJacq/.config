-- start these snippets only on new line character !
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

  -- label
  s({
    trig = "lab",
    dscr = "label",
  }, fmta([[\label{<>}]], { i(1) })),

  -- s1 -> \section{}
  s({
    trig = "s1",
    dscr = "Top-level section",
    condition = line_begin,
  }, fmta([[\section{<>}]], { i(1) })),
  -- s2 -> \subsection{}
  s({
    trig = "s2",
    dscr = "2nd-level section",
    condition = line_begin,
  }, fmta([[\subsection{<>}]], { i(1) })),
  -- new generic env
  s(
    {
      trig = "new",
      dscr = "A generic new environmennt",
      condition = line_begin,
    },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),
  -- new equation
  s(
    {
      trig = "eq",
      dscr = "A new equation (with number)",
      condition = line_begin,
    },
    fmta(
      [[
      \begin{equation}
          <>
      \end{equation}
    ]],
      {
        i(1),
      }
    )
  ),
  -- new equation without number
  s(
    {
      trig = "eq*",
      dscr = "A new equation (without number)",
      condition = line_begin,
    },
    fmta(
      [[
      \[ <> \]
      ]],
      {
        i(1),
      }
    )
  ),
  -- new figure
  s(
    {
      trig = "fig",
      dscr = "A new figure",
      condition = line_begin,
    },
    fmta(
      [[
      \begin{figure}
        \center
        \includegraphics[width=\0.7linewidth]{<>}
        \caption{<>}
        \label{fig:<>}
      \end{figure}
      ]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),
  -- enumerate
  s(
    {
      trig = "en",
      dscr = "A new enumerate",
      condition = line_begin,
    },
    fmta(
      [[
      \begin{enumerate}
          <>
      \end{enumerate}
    ]],
      {
        i(1),
      }
    )
  ),
  -- itemize
  s(
    {
      trig = "eit",
      dscr = "A new itemize",
      condition = line_begin,
    },
    fmta(
      [[
      \begin{itemize}
          \item <>
      \end{itemize}
    ]],
      {
        i(1),
      }
    )
  ),
}
