-- disable warnings of type MD013: spaces, url, ...
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--disable", "MD013", "--" },
      },
    },
  },
}
