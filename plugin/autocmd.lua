local autocmd = vim.api.nvim_create_autocmd

-- Highlight text being yanked.
autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 50,
    })
  end,
})

-- Remove trailing whitespace on save (and keep cursor's position!).
autocmd({ "BufWritePre" }, {
  callback = function()
    local cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", cursor)
  end,
})

-- Restore cursor's position in buffer from previous session.
autocmd({ "BufReadPost" }, {
  callback = function(args)
    if vim.bo.filetype == "gitcommit" then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

-- Close on `q` or `<Esc>`.
autocmd({ "FileType" }, {
  pattern = {
    "help",
    "qf",
    "lspinfo",
    "man",
    "checkhealth",
    "lazy",
  },
  command = [[
    nnoremap <buffer><silent> q :close<CR>
    nnoremap <buffer><silent> <Esc> :close<CR>
    set nobuflisted
  ]]
})

-- Autocreate a directory when saving a file.
autocmd({ "BufWritePre" }, {
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
