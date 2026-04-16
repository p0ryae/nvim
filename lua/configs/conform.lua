local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    sql = { "sql_formatter" },
    css = { "prettierd" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    java = { "google-java-format" },

    json = { "prettierd" },
    jsonc = { "prettierd" },

    typescript = {},
    typescriptreact = {},
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "first",
  },
}

return options
