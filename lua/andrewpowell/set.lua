-- Theme
vim.cmd.colorscheme("slate")

-- Basic settings
vim.cmd([[set nocompatible]])
vim.g.loaded_matchparen = 1
--vim.opt.guicursor = ""
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.cursorline = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false

-- Undo / Backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search settings
vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"
vim.opt.showmatch = false
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.conceallevel = 0    -- Don't hide markup
vim.opt.lazyredraw = true   -- Don't redraw during macros
vim.opt.synmaxcol = 300     -- Syntax highlighting limit

-- Editing / Completion
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true     -- Auto reload files changed outside vim
vim.opt.autowrite = false   -- Don't auto save

-- General behavior
vim.opt.hidden = true                              -- Allow hidden buffers
vim.opt.errorbells = false                         -- No error bells
vim.opt.backspace = "indent,eol,start"             -- Better backspace behavior
vim.opt.autochdir = false                          -- Don't auto change directory
vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.path:append("**")                          -- include subdirectories in search
vim.opt.selection = "exclusive"                    -- Selection behavior
vim.opt.modifiable = true                          -- Allow buffer modifications
vim.opt.encoding = "UTF-8"                         -- Set encoding

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = ""

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"
