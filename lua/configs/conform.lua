local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    java = { "google-java-format" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "first",
  },
}

return options
