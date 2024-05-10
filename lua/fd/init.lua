-- Multibyte
-- ›,·,»·,¶,→,←,×,▸,¬,˽,˰
vim.o.listchars = "trail:·,tab:» ,extends:→,precedes:←,nbsp:×"

-- Vertical split chars
vim.o.fillchars = "stl: ,stlnc: ,vert:│"

-- Keep sign column static
vim.o.signcolumn = "number"

-- Show ↪ at the beginning of wrapped lines
vim.o.showbreak = "↪"
vim.o.breakindent = true
vim.o.breakindentopt = "sbr,min:0"

-- Keep margin when zt zb
vim.o.scrolloff = 2

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Set
vim.opt.shada = "!,'1024,<1000,s10,h"

--" Autocmd
--if has("autocmd")
--  " Enable file type detection.
--  filetype plugin indent on
--
--  au FileType python     setlocal nosmartindent nonumber "textwidth=79
--  au FileType perl       setlocal noexpandtab foldmethod=indent
--  au FileType javascript setlocal expandtab shiftwidth=4 tabstop=4
--  au FileType vim        setlocal expandtab shiftwidth=2 tabstop=2
--  au FileType scss       setlocal expandtab shiftwidth=2 tabstop=2
--  au FileType css        setlocal expandtab shiftwidth=4 tabstop=4
--  au FileType html       setlocal expandtab shiftwidth=2 tabstop=2
--  au FileType jinja      setlocal expandtab shiftwidth=2 tabstop=2
--  au FileType yaml       setlocal expandtab shiftwidth=2 tabstop=2
--  au FileType tex        setlocal updatetime=200
--endif

-- Store undofile in to fixed location
local undopath = vim.fn.stdpath("data") .. "/undo//"
if not vim.loop.fs_stat(undopath) then
    vim.fn.system({
        "mkdir",
        "-p",
        undopath
    })
end

-- Store undo files in fixed location
vim.o.undofile = true
vim.o.undodir = undopath

-- Store swap files in fixed location
vim.o.swapfile = true
vim.o.directory = "/var/tmp//,/tmp//,."

-- Store backup files in fixed location
vim.o.backup = true
vim.o.backupdir = "/var/tmp//,/tmp//,."

--" Set your path variable to current directory, and children
--set path=.,,**

--" Disable timeout for Esc key
--set ttimeout ttimeoutlen=0 notimeout
--set ttyfast " Optimize for fast terminal connections
--set lazyredraw " Don't redraw while executing macros (good performance config)

-- " Autocomplete options:
-- " longest: do not select the first candidate
-- " preview: removed includes display of documentation
-- set completeopt=menuone,longest
--
-- set confirm " Get a dialog when :q, :w, or :wq fails
--
-- let mapleader = "\<Space>" " Map leader
--
-- let maplocalleader = "\<Backspace>" " Local leader
--
-- set hlsearch " Highlight search terms (very useful!)
--
-- set incsearch " Show search matches while typing
--
-- set display=lastline " Display lastline instead of @
--
-- set laststatus=2 " Enable statusline
--
-- set scrolloff=3 " Minimal number of screen lines to keep above and below the cursor
--
-- set magic " For regular expressions turn magic on

--Searches are Non Case-sensitive
vim.o.ignorecase = true

-- Do smart case matching when searching
vim.o.smartcase = true

-- set showcmd " Show incomplete cmds down the bottom

--Show title
vim.o.title = true

-- set noautochdir " Vim will not change the current working directory whenever you open a file
--
-- set autoread " Reload files changed outside automatically

-- Number of spaces that a <Tab> in the file counts for
vim.o.tabstop = 4

-- Number of spaces that a <Tab> counts for while performing editing operations
vim.o.softtabstop = 0

-- Number of spaces to use for each step of (auto)indent
vim.o.shiftwidth = 4

-- Use the appropriate number of spaces to insert a <Tab>
vim.o.expandtab = true

-- set backspace=indent,eol,start " Fix backspace indent

-- Be smart when using tabs
vim.o.smarttab = true

-- Enable auto indent
vim.o.autoindent = true

-- Smart indent
vim.o.smartindent = true

-- Enable word wrap
vim.o.wrap = false

-- set textwidth=0 " Disable line break
--
-- set noerrorbells novisualbell t_vb= " No annoying sound on errors
--
-- set encoding=utf8 " Default encoding
--
-- set termencoding=utf-8 " Terminal encoding
--
-- set fileencodings=utf8 " Supported file encodings

-- Enable line numbers
vim.o.number = true

-- Enable relative line numbers
vim.o.relativenumber = true

-- "set colorcolumn=80 " Show right margin
--
-- set list " Show non printable characters
--
-- set ruler " Always display cursor position
--
-- set hidden " A buffer becomes hidden when it is abandoned
--
-- set wildmenu " Turn on the Wild menu
--
-- set wildmode=list:longest,list:full " Wildmenu configuration
--
-- " Ignore files
-- set wildignore=*.o,*.obj,.git/**,node_modules/**,.sass-cache,*.pyc,*.gem
-- set wildignore+=*.jpg,*.jpeg,*.tiff,*.gif,*.png,*.svg,*.pdf
--
-- set conceallevel=0 " Conceal level
--
-- set modelines=1 " Make Vim only use folding settings for current file
--
-- set foldmethod=syntax
--
-- set foldminlines=1
--
-- set noshowmode " Suppress mode change messages
--
-- set exrc " Allow load .vimrc or _vimrc from current directory

-- Highlight the screen line of the cursor
vim.o.cursorline = true

-- todo: https://gist.github.com/creativenull/e7aa618b8f714f6302e2bf382ef7cf9f
-- todo: https://youtu.be/w7i4amO_zaE?t=1368

vim.diagnostic.config({
    virtual_text = false,
    underline = {
        severity = vim.diagnostic.severity.ERROR,
    }
})

require("fd.remap")
require("fd.lazy")
require("fd.cmd")
