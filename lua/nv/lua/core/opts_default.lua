local opt = vim.opt
local o = vim.o
local g = vim.g

-- globals ---------------------------------------------------------------------

-- ~/.local/state/nvim/shada/main.shada
-- [!]keep-globals [']n-files [<]n-lines [s]KiB-size [h]no-hlsearch
o.shada = "!,'1024,<1024,s32,h"

-- options ---------------------------------------------------------------------

o.laststatus = 2
o.showmode = false

-- show title
o.title = true

-- o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "line"

-- indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- word wrap
o.wrap = false

-- ›,·,»·,¶,→,←,×,▸,¬,˽,˰
o.list = true
o.listchars = "trail:·,tab:» ,extends:→,precedes:←,nbsp:×"
o.fillchars = "eob: "
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- numbers
o.ruler = false
o.number = true
o.numberwidth = 3
o.relativenumber = true

-- enable highlight groups
opt.termguicolors = true

-- show ↪ at the beginning of wrapped lines
o.showbreak = "↪"
o.breakindent = true
o.breakindentopt = "sbr,min:0"

-- disable nvim intro
opt.shortmess:append "sI"

-- keep margin when zt zb
o.scrolloff = 2

-- o.signcolumn = "number"
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 2000

-- Store swap files in fixed location
o.undofile = true
o.undodir = vim.fn.stdpath "data" .. "/undo"

-- Store swap files in fixed location
o.swapfile = true
o.directory = vim.fn.stdpath "data" .. "/swap"

-- Store backup files in fixed location
o.backup = true
o.backupdir = vim.fn.stdpath "data" .. "/backup"

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
