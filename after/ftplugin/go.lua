vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.expandtab = false

-- Always run `gofmt` before saving the buffer.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function() vim.lsp.buf.format() end,
})
