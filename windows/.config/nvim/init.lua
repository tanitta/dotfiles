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
		lazy = false, -- neo-tree will lazily load itself
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
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
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
		}
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	{
		"hrsh7th/cmp-cmdline",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			local cmp = require("cmp")
			-- ":" コマンドラインでの補完
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "path" },
					{ name = "cmdline" },
				},
			})
			-- "/" 検索での補完
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
		end,
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
				},
				pickers = {
					find_files = {
						sorter = sorters.get_fzy_sorter(),
					},
					live_grep = {
						sorter = sorters.get_fzy_sorter(),
					},
				},
			})
			-- telescope.load_extension("asearch") -- exposes :Telescope asearch … pickers (init.lua:69-87)
			vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
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
		-- event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				copilot_node_command = 'node',
				filetypes = {
					hlsl = true,
					shader = true,
					cginc = true,
					lua = true,
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function ()
			require("copilot_cmp").setup()
		end
	}
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
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

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	require("mason-lspconfig").setup({
		ensure_installed = { "omnisharp" },
	})
end

vim.lsp.config('*', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
--[[
local set = vim.keymap.set
set('n','H','<cmd>cs vim.lsp.buf.hover()<CR>')
set('n','gj','<cmd>cs vim.lsp.buf.definition()<CR>')
set('n','gf','<cmd>cs vim.lsp.buf.formatting()<CR>')
set('n','gr','<cmd>cs vim.lsp.buf.references()<CR>')
set('n','gR','<cmd>cs vim.lsp.buf.rename()<CR>')
set('n','ga','<cmd>cs vim.lsp.buf.code_action()<CR>')
]]--

-- auto lspconfig setting
--[[
require('mason-lspconfig').setup_handlers {
	function(server_name)
		if server_name == 'omnisharp_mono' then
			return 
		end
		require('lspconfig')[server_name].setup {}
	end,
}
]]--


local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = 'copilot' },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(), -- 既存
		["<C-p>"] = cmp.mapping.select_prev_item(), -- 既存

		["<Tab>"] = vim.schedule_wrap(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.confirm({select = true})
			else
				fallback()
			end
		end),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.snippet and vim.snippet.active({ direction = -1 }) then
				vim.snippet.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enterで決定
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	}
})

vim.api.nvim_create_user_command("OpenConfig", function()
	vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, {})

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
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

-- vim.filetype.add({
-- 	extension = {
-- 		shader = "hlsl",
-- 		cginc  = "hlsl",
-- 		hlsl = "hlsl",
-- 		lilcontainer = "hlsl",
-- 	},
-- })

vim.filetype.add {
	extension = {
		meta = "yaml"
	},
}


require("notify").setup({
	background_colour = "#1a1b26",
})
-- vim.api.nvim_create_autocmd("FileType", {
	--   pattern = "*",
	--   callback = function()
		--     vim.opt.iskeyword:remove("_")
		--   end,
		-- })

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




