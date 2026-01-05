local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

-- ----------------------------------------------------------------------------
-- Function that check if in math-mode
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
  -- $ -> $<>$ (dynamic)
  s(
    {
      trig = "([^%a])$",
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
    },
    fmta("<>$<>$", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  -- ff -> /frac{}{}
  s(
    {
      trig = "ff",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[<>\frac{<>}{<>}]], {
      f(function(_, snip)
        return snip.captures[1] -- <- this is to add back the blank space before the snippet
      end),
      i(1),
      i(2),
    })
  ),

  -- pf -> /frac{\partial }{\partial }
  s(
    {
      trig = "pf",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[<>\frac{\partial <>}{\partial <>}]], {
      f(function(_, snip)
        return snip.captures[1] -- <- this is to add back the blank space before the snippet
      end),
      i(1),
      i(2),
    })
  ),

  -- typing 00 is replaced by _{} and you type inside the brackets
  --  but not in numbers
  s(
    {
      trig = "([%a%)%]%}])00",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = in_mathzone,
    },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- int -> /int_{ }{ }
  s(
    {
      trig = "int",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[\int_{<>}^{<>}]], {
      i(1),
      i(2),
    })
  ),
  -- sum -> /sum_{ }{ }
  s(
    {
      trig = "sum",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[\sum_{<>}^{<>}]], {
      i(1),
      i(2),
    })
  ),

  -- :m --> \mathcal{}
  s(
    {
      trig = ";m",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[\mathcal{<>}]], {
      d(1, get_visual),
    })
  ),
  -- -- mb --> \mathbf{}
  -- s(
  --   {
  --     trig = "mb",
  --     snippetType = "autosnippet",
  --     regTrig = true,
  --     wordTrig = false,
  --     condition = in_mathzone,
  --   },
  --   fmta([[\mathbf{<>}]], {
  --     d(1, get_visual),
  --   })
  -- ),

  -- mb --> \mathbf{}
  s(
    {
      trig = "([^%a])mb",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[<>\mathbf{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  -- :p -> ^{}
  s(
    {
      trig = ":p",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[^{<>}]], {
      d(1, get_visual),
    })
  ),
  -- ss -> _{}
  s(
    {
      trig = "([^%a])ss",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[<>_{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- sq -> \sqrt{}
  s(
    {
      trig = "sq",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
    },
    fmta([[\sqrt{<>}]], {
      d(1, get_visual),
    })
  ),
}
