local is_vscode = require("utils").is_vscode
------------------------------------------------------------
-------------------- Основные настройки --------------------
------------------------------------------------------------
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.scrolloff = 7
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.fileformat = "unix"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = true
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.so = 999

------------------------------------------------------------
---------------------- Цветовая схема ----------------------
------------------------------------------------------------
vim.opt.termguicolors = true

------------------------------------------------------------
------------------- Синтаксис и перевод --------------------
------------------------------------------------------------
if not is_vscode then
    vim.cmd("filetype indent plugin on")
    vim.cmd("syntax on")
    vim.opt.spell = true
    vim.opt.spelllang = { "en_us", "ru_ru" }
end

------------------------------------------------------------
--------------- Конфигурация свопа и бекапов ---------------
------------------------------------------------------------
HOME = os.getenv("HOME")
SWAPDIR = HOME .. "/.local/state/nvim/swap"
UNDODIR = HOME .. "/.local/state/nvim/undo"
BACKUPDIR = HOME .. "/.local/state/nvim/backup"

if vim.fn.isdirectory(SWAPDIR) == 0 then
    vim.fn.mkdir(SWAPDIR, "p", "0o700")
end

if vim.fn.isdirectory(BACKUPDIR) == 0 then
    vim.fn.mkdir(BACKUPDIR, "p", "0o700")
end

if vim.fn.isdirectory(UNDODIR) == 0 then
    vim.fn.mkdir(UNDODIR, "p", "0o700")
end

vim.opt.directory = SWAPDIR
vim.opt.backupdir = BACKUPDIR
vim.opt.undodir = UNDODIR

vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true

vim.opt.backupcopy = "auto"

------------------------------------------------------------
------------------ Конфигурация плагинов -------------------
------------------------------------------------------------
if not is_vscode then
    -- Tagbar настройка
    vim.g.tagbar_compact = 1
    vim.g.tagbar_sort = 0
    vim.api.nvim_create_autocmd(
        { "VimEnter" },
        {
            pattern = { "*.py", "*.pl", "*.js", "*.ts", "*.php" },
            command = "TagbarToggle",
        }
    )
end

------------------------------------------------------------
------------------ Настройки провайдеров -------------------
------------------------------------------------------------
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python"
