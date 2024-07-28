local is_not_vscode = not require("utils").is_vscode

return {
    ------------------------------------------------------------
    ------------------ Плагины внешнего вида -------------------
    ------------------------------------------------------------
    ------------------------ Тема Nord -------------------------
    {
        "https://github.com/shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        name = "nord",
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_borders = false
            vim.g.nord_disable_background = false
            vim.g.nord_italic = false
            vim.g.nord_uniform_diff_background = true
            vim.g.nord_bold = false
            vim.cmd([[colorscheme nord]])
        end,
    },
    --------------------- Строка состояния ---------------------
    {
        "https://github.com/nvim-lualine/lualine.nvim",
        dependencies = {
            "https://github.com/kyazdani42/nvim-web-devicons"
        },
        opts = {
            options = {
                theme = "nord",
            }
        },
        enabled = is_not_vscode,
    },
    ---------------------- Строка вкладок ----------------------
    {
        "https://github.com/akinsho/bufferline.nvim",
        dependencies = {
            "https://github.com/kyazdani42/nvim-web-devicons"
        },
        config = function()
            require("bufferline").setup({
                options = {
                    color_icons = true,
                    separator_style = "slant",
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { "close" },
                    },
                    diagnostics = "coc",
                    themable = true,
                    always_show_bufferline = true,
                    separator_style = "thin",
                    show_buffer_close_icons = true,
                    view = "multiwindow",
                    indicator = {
                        style = "underline",
                    },
                    show_tab_indicators = true,
                    max_name_length = 14,
                    max_prefix_length = 13,
                    tab_size = 10,
                },
                highlights = require("nord").bufferline.highlights({ bold = true }),
            })
        end,
        keys = {
            { "<Tab>",   ":BufferLineCycleNext<CR>", desc = "New tab",      noremap = true, silent = true },
            { "<S-Tab>", ":BufferLineCyclePrev<CR>", desc = "Previous tab", noremap = true, silent = true },
        },
        enabled = is_not_vscode,
    },
    ------------ Пользовательская страница запуска -------------
    {
        "https://github.com/mhinz/vim-startify",
        enabled = is_not_vscode,
    },
    --------------------- Полоса прокрутки ---------------------
    {
        "https://github.com/dstein64/nvim-scrollview",
        enabled = is_not_vscode,
    },
    ----------------- Плавающая строка команд ------------------
    {
        "https://github.com/folke/noice.nvim",
        dependencies = {
            "https://github.com/MunifTanjim/nui.nvim",
            "https://github.com/rcarriga/nvim-notify"
        },
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },
            messages = {
                enabled = false,
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                },
            },
        },
        enabled = is_not_vscode,
    },
    ------------------------------------------------------------
    ------------------- Навигация по файлам --------------------
    ------------------------------------------------------------
    -------------------- Файловый Менеджер ---------------------
    {
        "https://github.com/kyazdani42/nvim-tree.lua",
        dependencies = {
            "https://github.com/kyazdani42/nvim-web-devicons"
        },
        opts = {
            view = {
                side = "right",
            },
        },
        keys = {
            { "<F3>",  ":NvimTreeToggle<CR>",   desc = "Toggle filetree",            noremap = true, silent = true },
            { "<F15>", ":NvimTreeFindFile<CR>", desc = "Show this file in filetree", noremap = true, silent = true },
        },
        enabled = is_not_vscode,
    },
    --------------------- Структура файла ----------------------
    {
        "https://github.com/preservim/tagbar",
        enabled = is_not_vscode,
    },
    ----------------- Нечеткий поиск по файлам -----------------
    {
        "https://github.com/nvim-telescope/telescope.nvim",
        dependencies = {
            "https://github.com/nvim-lua/plenary.nvim",
        },
        config = function()
            local telescope = require("telescope.builtin")
            vim.keymap.set("n", "<F2>", telescope.find_files, { noremap = true, silent = true })
            vim.keymap.set("n", "<F14>", telescope.buffers, { noremap = true, silent = true })
            vim.keymap.set("n", "<D-F2>", telescope.live_grep, { noremap = true, silent = true })
        end,
        enabled = is_not_vscode,
    },
    ------------------- Терминал внутри vim --------------------
    {
        "https://github.com/akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                open_mapping = "<F1>",
                direction = "float",
                float_opts = {
                    border = "curved",
                },
                highlights = require("nord").bufferline.highlights({ bold = true }),
            })
        end,
        enabled = is_not_vscode,
    },
    -------------- Навигация по python структурам --------------
    {
        "https://github.com/jeetsukumaran/vim-pythonsense",
    },
    ------------------------------------------------------------
    ------------------- Работа с редактором --------------------
    ------------------------------------------------------------
    ----------------------- Работа с git -----------------------
    {
        "https://github.com/lewis6991/gitsigns.nvim",
        opts = {},
        enabled = is_not_vscode,
    },
    ---------------- Работа с обрамление текста ----------------
    {
        "https://github.com/kylechui/nvim-surround",
        opts = {},
    },
    ------------------ Работа с комментариями ------------------
    {
        "https://github.com/numToStr/Comment.nvim",
        opts = {},
    },
    --------------------- Отступы по pep-8 ---------------------
    {
        "https://github.com/Vimjas/vim-python-pep8-indent",
    },
    ------------ Работа кнопок в русской раскладке -------------
    {
        "https://github.com/powerman/vim-plugin-ruscmd",
    },
    ---------------- Завершение структур языка -----------------
    {
        "https://github.com/cohama/lexima.vim",
    },
    ------------------------------------------------------------
    ---------------------- Работа с кодом ----------------------
    ------------------------------------------------------------
    --------------------------- LSP ----------------------------
    {
        "https://github.com/neoclide/coc.nvim",
        branch = "release",
        config = function()
            vim.keymap.set("i", "<TAB>", [[coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"]],
                { silent = true, noremap = true, expr = true, replace_keycodes = false })
            vim.keymap.set("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"]],
                { silent = true, noremap = true, expr = true, replace_keycodes = false })
            vim.keymap.set("i", "<C-j>", [[coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"]],
                { silent = true, noremap = true, expr = true, replace_keycodes = false })
            vim.keymap.set("i", "<C-SPACE>", "coc#refresh()", { silent = true, expr = true })
            vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
            vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
            vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
            vim.keymap.set("n", "gt", "<Plug>(coc-type-definition)", { silent = true })
            vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
            vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
            function _G.show_docs()
                local cw = vim.fn.expand("<cword>")
                if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
                    vim.api.nvim_command("h " .. cw)
                elseif vim.api.nvim_eval("coc#rpc#ready()") then
                    vim.fn.CocActionAsync("doHover")
                else
                    vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
                end
            end

            vim.keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })
            vim.keymap.set("n", "<F18>", "<Plug>(coc-rename)", { silent = true })
            vim.keymap.set("x", "<S-f>", "<Plug>(coc-format-selected)", { silent = true })
            vim.keymap.set("n", "<S-f>", "<Plug>(coc-format-selected)", { silent = true })
            vim.keymap.set("n", "<F6>", "<Plug>(coc-codeaction-refactor)", { silent = true })
        end,
        enabled = is_not_vscode,
    },
    {
        "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "v0.9.2",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        enabled = is_not_vscode,
    },
    ----------------------- Дебаггер -------------------------
    {
        "https://github.com/mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup(vim.g.python3_host_prog)
        end,
        enabled = is_not_vscode,
    },
    {
        "https://github.com/rcarriga/nvim-dap-ui",
        dependencies = {
            "https://github.com/mfussenegger/nvim-dap",
            "https://github.com/nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
            vim.keymap.set("n", "<F20>", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<F5>", ":DapContinue<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<F8>", ":DapStepOver<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<F17>", ":DapStepInto<CR>", { noremap = true, silent = true })
        end,
        enabled = is_not_vscode,
    }
}
