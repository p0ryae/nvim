local Path = require "plenary.path"

local nodePath = Path:new("./.yarn/sdks"):absolute() or ""
local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
  settings = { nodePath = nodePath },
  on_attach = function(client, bufnr)
    if base_on_attach then
      base_on_attach(client, bufnr)
    end
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})

vim.lsp.config("jdtls", {
  cmd = { "jdtls" },
  root_dir = require("jdtls.setup").find_root { "gradlew" } or vim.fn.getcwd(),
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

vim.lsp.enable {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "jsonls",
  "jdtls",
  "pyright",
  "neocmake",
  "gopls",
  "rust_analyzer",
  "kotlin_language_server",
  "svelte",
  "docker_language_server",
  "elixirls",
  "nixd",
  "eslint",
}
