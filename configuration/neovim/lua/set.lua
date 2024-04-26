local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.local/share/history/vim'
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.scrolloff = 8

opt.updatetime = 50
opt.timeout = false

local globals = vim.g

-- disable netrw
globals.loaded_netrw = 2
globals.loaded_netrwPlugin = 1
