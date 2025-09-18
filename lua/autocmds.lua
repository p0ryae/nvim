require "nvchad.autocmds"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nc"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_ca"
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "ObsidianNoteEnter",
  callback = function(ev)
    vim.keymap.set("n", "<leader>op", "<cmd>Obsidian paste_img<cr>", {
      buffer = ev.buf,
      desc = "[P]aste image",
    })
  end,
})
