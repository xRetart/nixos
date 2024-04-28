-- highlight on yank
local autocommand = vim.api.nvim_create_autocmd
autocommand("TextYankPost", { callback = function() vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 } end })
autocommand("BufWritePre", { callback = function() vim.lsp.buf.format() end })
