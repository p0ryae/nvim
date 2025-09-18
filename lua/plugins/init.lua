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
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      legacy_commands = false,
      ui = { enable = false },
      workspaces = {
        {
          name = "ubc",
          path = "~/UBC/Vaults",
        },
      },
      attachments = {
        img_folder = "/assets/imgs",
        confirm_img_paste = false,
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    opts = {
      render_modes = true,
      file_types = { "markdown" },
    },
    ft = { "markdown" },
  },

  {
    "3rd/image.nvim",
    build = false,
    opts = {
      processor = "magick_cli",
    },
    ft = { "markdown" },
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

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
