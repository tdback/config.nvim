local autocmd = vim.api.nvim_create_autocmd

autocmd({ "TextYankPost" }, {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 50,
    })
  end,
})

autocmd({ "BufWritePre" }, { pattern = "*", command = [[%s/\s\+$//e]] })
