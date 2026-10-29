local Path = require "plenary.path"

local function pnp_root(dir)
  local found = vim.fs.find(".pnp.cjs", { path = dir or vim.fn.getcwd(), upward = true })[1]
  return found and vim.fs.dirname(found) or nil
end

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
  settings = {
    nodePath = (pnp_root() or vim.fn.getcwd()) .. "/.yarn/sdks",
  },
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

vim.lsp.config("ts_ls", {
  before_init = function(params, config)
    local root = pnp_root(config.root_dir)
    if root then
      params.initializationOptions = vim.tbl_deep_extend("force", params.initializationOptions or {}, {
        tsserver = { path = root .. "/.yarn/sdks/typescript/lib/tsserver.js" },
      })
    end
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
