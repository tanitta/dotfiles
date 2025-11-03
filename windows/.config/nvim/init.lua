local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        opts = {
            filesystem = {
                -- follow_current_file = { enabled = true },
                -- hijack_netrw_behavior = "open_current",
                -- use_libuv_file_watcher = true,
                filtered_items = {
                    visible = false, -- デフォルトで隠されているかどうか
                    show_hidden_count = true,
                    hide_dotfiles = false, -- dotfileを隠すかどうか
                    hide_gitignored = false, -- gitignoreされているファイルを隠すかどうか
                    never_show = {
                        ".git",
                        ".DS_Store",
                        ".history",
                    },
                },
            },
        },
        lazy = false, -- neo-tree will lazily load itself
        config = function()
            vim.keymap.set("n", "<leader>we", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
        end,
    },
    -- {
    --     'stevearc/oil.nvim',
    --     ---@module 'oil'
    --     ---@type oil.SetupOpts
    --     opts = {},
    --     -- Optional dependencies
    --     dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    --     -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    --     -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    --     lazy = false,
    -- },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            -- [How to position the message and pupup windows to the lower right corner of the UI? · folke/noice\.nvim · Discussion \#469](https://github.com/folke/noice.nvim/discussions/469#discussioncomment-9570150)
            top_down = false
        }
    },
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup()
        end
    },
    'UtkarshVerma/molokai.nvim',
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    -- LSP
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            { "<space>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "<leader><space>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "<leader><space>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "<leader><space>r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "<leader><space>R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<leader><space><c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { 
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local sorters = require("telescope.sorters")
            telescope.setup({
                defaults = {
                    -- デフォルトの sorter を fzy に差し替え
                    -- sorting_strategy = "ascending",  -- 必要なら: リストを上から昇順に
                    -- file_sorter = sorters.get_fzy_sorter,
                    -- generic_sorter = sorters.get_fzy_sorter,
                    file_ignore_patterns = {
                        "%.git/",   -- .git以下を無視
                    },
                },
                pickers = {
                    find_files = {
                        sorter = sorters.get_fzy_sorter(),
                        hidden = true,
                    },
                    live_grep = {
                        sorter = sorters.get_fzy_sorter(),
                        additional_args = function(_)
                            return { "--hidden" }
                        end,
                    },
                },
            })
            -- telescope.load_extension("asearch") -- exposes :Telescope asearch … pickers (init.lua:69-87)
            vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>P", "<cmd>Telescope commands<CR>", { noremap = true, silent = true, desc = "Command palette" })
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "kalvinpearce/ShaderHighlight",
        -- ft = { "shader", "cginc", "hlsl", "lilcontainer" }, -- 拡張子に合わせて
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- 安定版を追従
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "famiu/nvim-reload",
        config = function()
            require("nvim-reload")
            -- キーマップは不要、コマンドだけ使う
        end,
    },
    {
        "mg979/vim-visual-multi",
        branch = "master",
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure({
                providers = { 'lsp', 'treesitter', 'regex' },
                delay = 0,
            })
            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true})
                    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true})
                    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true})
                end,
            })
        end
    },
    -- Git
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
        "nvim-mini/mini.pick",           -- optional
        "folke/snacks.nvim",             -- optional
      },
    },
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add          = { text = "▎" },
                change       = { text = "▎" },
                delete       = { text = "󰍵" },
                topdelete    = { text = "󰍵" },
                changedelete = { text = "▎" },
                untracked    = { text = "▎" },
            },
            signcolumn = true,  -- 行番号の左に表示
            numhl      = false, -- 行番号を色付けするか
            linehl     = false, -- 行全体をハイライトするか
            word_diff  = false, -- 単語単位で差分を表示するか

            -- 操作系
            watch_gitdir = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked = true,
            current_line_blame = false, -- true にすると blame コメントを表示
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
                delay = 500,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- default
            max_file_length = 40000,
            preview_config = {
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1
            },
        },
        keys = {
            { "]c", function() require("gitsigns").next_hunk() end, desc = "Next Git change" },
            { "[c", function() require("gitsigns").prev_hunk() end, desc = "Prev Git change" },
            { "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
            { "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
            { "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
            { "<leader>hb", function() require("gitsigns").blame_line() end, desc = "Blame line" },
        }
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                hlsl = true,
                cg = true,
                shaderlab= true,
                cginc = true,
                lua = true,
                rust = true,

            },
        },
    },
    {
        'saghen/blink.cmp',
        -- optional = true,
        -- optional: provides snippets for the snippet source
        dependencies = { 
            'rafamadriz/friendly-snippets',
            -- "giuxtaposition/blink-cmp-copilot",
            "fang2hou/blink-copilot",
        },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'super-tab' },

            appearance = {
                -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
                nerd_font_variant = 'mono',
                kind_icons = {
                    Copilot = "",
                    Text = '󰉿',
                    Method = '󰊕',
                    Function = '󰊕',
                    Constructor = '󰒓',

                    Field = '󰜢',
                    Variable = '󰆦',
                    Property = '󰖷',

                    Class = '󱡠',
                    Interface = '󱡠',
                    Struct = '󱡠',
                    Module = '󰅩',

                    Unit = '󰪚',
                    Value = '󰦨',
                    Enum = '󰦨',
                    EnumMember = '󰦨',

                    Keyword = '󰻾',
                    Constant = '󰏿',

                    Snippet = '󱄽',
                    Color = '󰏘',
                    File = '󰈔',
                    Reference = '󰬲',
                    Folder = '󰉋',
                    Event = '󱐋',
                    Operator = '󰪚',
                    TypeParameter = '󰬛',
                },
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = {
                    'lsp',
                    'path',
                    'snippets',
                    'buffer',
                    'copilot',
                },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                    -- copilot = {
                    --     name = "copilot",
                    --     module = "blink-cmp-copilot",
                    --     score_offset = 100,
                    --     async = true,
                    --     transform_items = function(_, items)
                    --         local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                    --         local kind_idx = #CompletionItemKind + 1
                    --         CompletionItemKind[kind_idx] = "Copilot"
                    --         for _, item in ipairs(items) do
                    --             item.kind = kind_idx
                    --         end
                    --         return items
                    --     end,
                    -- },
                },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
      "Isrothy/neominimap.nvim",
      version = "v3.x.x",
      lazy = false, -- NOTE: NO NEED to Lazy load
      -- Optional. You can alse set your own keybindings
      keys = {
        -- Global Minimap Controls
        { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
        { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
        { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
        { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

        -- Window-Specific Minimap Controls
        { "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
        { "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
        { "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
        { "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },

        -- Tab-Specific Minimap Controls
        { "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
        { "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
        { "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
        { "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },

        -- Buffer-Specific Minimap Controls
        { "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
        { "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
        { "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
        { "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },

        ---Focus Controls
        { "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
        { "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
        { "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
      },
      init = function()
        -- The following options are recommended when layout == "float"
        vim.opt.wrap = false
        vim.opt.sidescrolloff = 36 -- Set a large value

        --- Put your configuration here
        ---@type Neominimap.UserConfig
        vim.g.neominimap = {
          auto_enable = true,
          layout = "split", ---@type Neominimap.Config.LayoutType
        }
      end,
    }
})
-- vim.g.lua_indent_disable = true


-- vim.opt.autochdir = false
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.wrap = false
-- vim.opt.list = true


-- vim.opt.expandtab = false
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
-- vim.opt.smartindent = false
-- vim.opt.autoindent = true

vim.opt.autochdir = false
vim.opt.softtabstop = 4

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
-- vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.list = true

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    command = "setlocal nowrap",
})


-- ノーマルモード：今の行をトグル
vim.keymap.set("n", "<C-_>", function()
    require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })

-- ビジュアルモード：選択範囲をトグル
vim.keymap.set("x", "<C-_>", function()
    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    vim.api.nvim_feedkeys(esc, "nx", false)
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })

-- Color Scheme
require("monokai-pro").setup({
    -- ... your config
})

-- lua
vim.cmd([[colorscheme molokai]])



-- vim.opt.termguicolors = true
-- vim.opt.winblend = 0 -- ウィンドウの不透明度
-- vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

vim.o.updatetime = 800
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ctx)
    local set = vim.keymap.set
    set("n", "<leader>lgD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = true })
    set("n", "<leader>lgd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = true })
    set("n", "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = true })
    set("n", "<leader>ln", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = true })
    set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = true })
    set("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = true })
    set("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = true })
    set("n", "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { buffer = true })
    set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = true })
    set("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = true })
    set("n", "<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = true })
    set("n", "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = true })
    set("n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { buffer = true })
    set("n", "<leader>l[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", { buffer = true })
    set("n", "<leader>l]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { buffer = true })
    set("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = true })
    set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { buffer = true })
  end,
})

require("mason").setup()
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    require("mason-lspconfig").setup({
        ensure_installed = { "omnisharp" },
    })
end


vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focus = false,        -- ← フォーカスを奪わない
            border = "rounded",   -- ← 枠線のスタイル（"single", "double", "shadow" などもOK）
            scope = "cursor",     -- ← カーソル位置の診断だけ表示
        })
    end,
})

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end






vim.api.nvim_create_user_command("OpenConfig", function()
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, {})

local lualine_auto_theme = require("lualine.themes.auto")
lualine_auto_theme.inactive.a = { fg = "#808080", bg = "#181a1b" }
lualine_auto_theme.inactive.b = { fg = "#808080", bg = "#181a1b" }
lualine_auto_theme.inactive.c = { fg = "#808080", bg = "#181a1b" }
lualine_auto_theme.inactive.x = { fg = "#808080", bg = "#181a1b" }
lualine_auto_theme.inactive.y = { fg = "#808080", bg = "#181a1b" }
lualine_auto_theme.inactive.z = { fg = "#808080", bg = "#181a1b" }
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = lualine_auto_theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

-- 背景透過
vim.api.nvim_set_hl(0, "Normal",   { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- 行番号・サイン列は暗い背景に固定
vim.api.nvim_set_hl(0, "LineNr",     { bg = "#1e1e1e" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1e1e1e" })

vim.api.nvim_set_hl(0, "NeoTreeNormal",   { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })


vim.filetype.add {
    extension = {
        meta = "yaml"
    },
}


require("notify").setup({
    background_colour = "#1a1b26",
})

-- Terminal
require("toggleterm").setup{
    size = 20,
    direction = 'horizontal',
    open_mapping = [[<leader><c-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    close_on_exit = true,
}

local Terminal = require("toggleterm.terminal").Terminal

-- 横方向 (horizontal)
vim.keymap.set("n", "<leader><C-t>h", function()
    local term = Terminal:new({ direction = "horizontal" })
    term:toggle()
end, { noremap = true, silent = true })

-- 縦方向 (vertical)
vim.keymap.set("n", "<leader><C-t>v", function()
    local term = Terminal:new({ direction = "vertical" })
    term:toggle()
end, { noremap = true, silent = true })

-- float
vim.keymap.set("n", "<leader><C-t>f", function()
    local term = Terminal:new({ direction = "float" })
    term:toggle()
end, { noremap = true, silent = true })

-- -- ノーマルモードで <leader>t を押したらターミナルを開く
-- vim.api.nvim_set_keymap('n', '<leader>t', ':terminal<CR>', opts)
--
-- -- ターミナルモードで Esc を押すとノーマルモードに戻る
-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "shaderlab", "hlsl", "cginc" },
    callback = function()
        vim.bo.commentstring = "// %s"
    end,
})

vim.api.nvim_create_user_command("Drop", function(opts)
    vim.cmd("tab drop " .. opts.args)
    vim.cmd("wincmd p")
end, { nargs = 1 })

