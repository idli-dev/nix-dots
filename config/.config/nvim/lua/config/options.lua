-- Vim/Neovim Options
local o = vim.opt

-- Numbers
o.number = true                -- show absolute line number
o.relativenumber = true        -- show relative line numbers

-- Tabs and Indents
o.tabstop = 2                  -- a tab counts for 2 spaces
o.softtabstop = 2              -- editing a tab counts for 2 spaces
o.shiftwidth = 2               -- auto-indent uses 2 spaces
o.expandtab = true             -- use spaces instead of tabs
o.autoindent = true            -- copy indent from previous line
o.smartindent = true           -- smart auto-indenting for C-like programs
o.preserveindent = true        -- preserve existing indent structure

-- Cursor and Sign Column
o.cursorline = true            -- highlight current line
o.cursorlineopt = "number"     -- only highlight line number
o.signcolumn = "yes"           -- always show sign column
o.scrolloff = 8                -- minimal lines above/below cursor
o.sidescrolloff = 8            -- minimal columns to left/right

-- Searching
o.ignorecase = true            -- ignore case in search
o.smartcase = true             -- case-sensitive if uppercase used
o.incsearch = true             -- show matches while typing
o.hlsearch = true              -- highlight search matches
o.wrapscan = true              -- searches wrap around the file

-- Splits
o.splitbelow = true            -- horizontal splits below
o.splitright = true            -- vertical splits to the right

-- File Handling
o.autoread = true              -- auto reload changed files
o.backup = false               -- don't create backup files
o.writebackup = false          -- don't create backup before write
o.swapfile = false             -- no swap files
o.undofile = true              -- persistent undo
o.encoding = "utf-8"           -- internal encoding
o.fileencoding = "utf-8"       -- file encoding

-- Visual Options
o.termguicolors = true         -- true color support
o.background = "dark"          -- dark theme
o.wrap = false                 -- long lines do not wrap

-- Completion
o.completeopt = "menuone,noinsert,noselect"  -- nice completion experience
o.pumheight = 10               -- popup menu height
o.pumwidth = 25                -- minimum popup width

-- Mouse and GUI
o.mouse = "a"                  -- enable mouse in all modes
o.mousefocus = true            -- focus follows mouse
o.mousehide = true             -- hide mouse while typing
o.guicursor = "n-c-v:block-nCursor"

-- Miscellaneous
o.title = true                 -- set terminal title
o.hidden = true                -- allow buffer switching without saving
o.lazyredraw = true            -- don't redraw while executing macros
o.updatetime = 300             -- faster completion & CursorHold
o.timeoutlen = 500             -- time to wait for a mapped sequence
o.ttimeoutlen = 50             -- time to wait for key codes

-- Folding
o.foldenable = false

-- Window & UI Defaults
o.winminheight = 1
o.winheight = 10
o.winminwidth = 1
o.winwidth = 10
