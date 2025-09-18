local Path = require "plenary.path"

local nodePath = Path:new("./.yarn/sdks"):absolute() or ""
local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
  settings = { nodePath = nodePath },
  on_attach = function(client, bufnr)
    if not base_on_attach then
      return
    end

    base_on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})

vim.lsp.enable { "eslint", "html", "cssls", "ts_ls", "clangd", "jsonls", "jdtls" }
