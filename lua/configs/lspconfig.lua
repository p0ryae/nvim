local lspconfig = require "lspconfig"
local Path = require "plenary.path"

require("java").setup {
  jdk = {
    auto_install = false,
  },
}

local servers = { "html", "cssls", "ts_ls", "clangd", "jsonls", "jdtls" }
for _, srv in ipairs(servers) do
  lspconfig[srv].setup {}
end

-- ESLint with nodePath
local nodePath = Path:new("./.yarn/sdks"):absolute() or ""
lspconfig.eslint.setup {
  settings = {
    nodePath = nodePath,
  },
}
