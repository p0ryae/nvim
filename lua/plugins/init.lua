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
    "sudo-tee/opencode.nvim",
    lazy = false,
    config = function()
      require("opencode").setup {}
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
          file_types = { "markdown", "opencode_output" },
        },
        ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
      },
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
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
