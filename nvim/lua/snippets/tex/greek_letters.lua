-- ----------------------------------------------------------------------------
-- Function that check if in math-mode
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local greek_specs = {
  alpha = { context = { name = "alpha" }, command = "\\alpha" },
  alpha2 = { context = { name = ";a" }, command = "\\alpha" },
  beta = { context = { name = "beta" }, command = "\\beta" },
  beta2 = { context = { name = ";b" }, command = "\\beta" },
  gam = { context = { name = "gamma" }, command = "\\gamma" },
  Gam = { context = { name = "Gamma" }, command = "\\Gamma" },
  delta = { context = { name = "delta" }, command = "\\delta" },
  delta2 = { context = { name = ";d" }, command = "\\delta" },
  Delta = { context = { name = "Delta" }, command = "\\Delta" },
  Delta2 = { context = { name = ";D" }, command = "\\Delta" },
  eps = { context = { name = "eps", priority = 500 }, command = "\\epsilon" },
  veps = { context = { name = "veps" }, command = "\\varepsilon" },
  zeta = { context = { name = "zeta" }, command = "\\zeta" },
  eta = { context = { name = "eta", priority = 500 }, command = "\\eta" },
  theta = { context = { name = "theta" }, command = "\\theta" },
  Theta = { context = { name = "Theta" }, command = "\\Theta" },
  Theta2 = { context = { name = ";t" }, command = "\\theta" },
  iota = { context = { name = "iota" }, command = "\\iota" },
  kappa = { context = { name = "kappa" }, command = "\\kappa" },
  lmbd = { context = { name = "lambda" }, command = "\\lambda" },
  Lmbd = { context = { name = "Lambda" }, command = "\\Lambda" },
  mu = { context = { name = "mu" }, command = "\\mu" },
  nu = { context = { name = "nu" }, command = "\\nu" },
  xi = { context = { name = "xi" }, command = "\\xi" },
  pi = { context = { name = "pi" }, command = "\\pi" },
  rho = { context = { name = "rho" }, command = "\\rho" },
  sig = { context = { name = "sigma" }, command = "\\sigma" },
  Sig = { context = { name = "Sigma" }, command = "\\Sigma" },
  tau = { context = { name = "tau" }, command = "\\tau" },
  ups = { context = { name = "upsilon" }, command = "\\upsilon" },
  phi = { context = { name = "phi" }, command = "\\phi" },
  vphi = { context = { name = "varphi" }, command = "\\varphi" },
  chi = { context = { name = "chi" }, command = "\\chi" },
  psi = { context = { name = "psi" }, command = "\\psi" },
  omega = { context = { name = "omega" }, command = "\\omega" },
  Omega = { context = { name = "Omega" }, command = "\\Omega" },
  nabla = { context = { name = ";n" }, command = "\\nabla" },
  infinity = { context = { name = ";8" }, command = "\\infty" },
}
-- you can either use shortcuts or full name
-- e.g. ;a or alpha will auto ouput \alpha
M = {}

local greek_snippets = {}
for k, v in pairs(greek_specs) do
  greek_snippets[k] = s({
    trig = v.context.name,
    snippetType = "autosnippet",
    condition = in_mathzone,
  }, { t(v.command) })
  table.insert(M, greek_snippets[k])
end

return M
