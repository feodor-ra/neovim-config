local is_not_vscode = not require("utils").is_vscode

-- jk как выход из insert режима
vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
-- , + <SPACE> выключает подсветку поиска
vim.keymap.set("n", ",<SPACE>", ":nohlsearch<CR>", { noremap = true })
-- x и X записывают в пустой буфер
vim.keymap.set("n", "x", [["_x]], { noremap = true })
vim.keymap.set("x", "x", [["_x]], { noremap = true })
vim.keymap.set("n", "X", [["_X]], { noremap = true })
vim.keymap.set("x", "X", [["_X]], { noremap = true })
-- ZW для сохранения файла
vim.keymap.set("n", "ZW", ":w<CR>", { noremap = true, silent = true })

if is_not_vscode then
    -- Навигация в таббаре
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    -- Навигация по дереву файлов
    vim.keymap.set("n", "<F3>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<F3>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
end

