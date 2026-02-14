return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    opts = {
      render_modes = true,
      file_types = { "markdown" },
    },
    ft = "markdown",
  },

  {
    "3rd/image.nvim",
    build = false,
    opts = {
      processor = "magick_cli",
    },
    ft = "markdown",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require "nvchad.configs.cmp"

      -- extend NvChad cmp sources with spell
      table.insert(opts.sources, { name = "spell" })

      return opts
    end,
    dependencies = {
      "f3fora/cmp-spell",
    },
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },
}
