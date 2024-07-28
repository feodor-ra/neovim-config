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
