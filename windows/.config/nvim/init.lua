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
	-- {
		-- 	'hrsh7th/nvim-cmp',
		-- 	dependencies = {
			-- 		'hrsh7th/cmp-nvim-lsp',
			-- 	}
			-- },
			-- {
				-- 	"hrsh7th/cmp-cmdline",
				-- 	dependencies = { "hrsh7th/nvim-cmp" },
				-- },
				{
					"numToStr/Comment.nvim",
					config = function()
						require("Comment").setup()
					end
				},
				-- {
					-- 	"hrsh7th/cmp-path",
					-- 	dependencies = { "hrsh7th/nvim-cmp" }
					-- },
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
									cg = true,
									shaderlab= true,
									cginc = true,
									lua = true,
									rust = true,
								},
							})
						end,
					},
					-- {
						-- 	"CopilotC-Nvim/CopilotChat.nvim",
						-- 	dependencies = {
							-- 		{ "nvim-lua/plenary.nvim", branch = "master" },
							-- 	},
							-- 	build = "make tiktoken",
							-- 	opts = {
								-- 		-- See Configuration section for options
								-- 	},
								-- },
								{
									'saghen/blink.cmp',
									-- optional: provides snippets for the snippet source
									dependencies = { 
										'rafamadriz/friendly-snippets',
										"giuxtaposition/blink-cmp-copilot",
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

										-- appearance = {
											--   -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
											--   -- Adjusts spacing to ensure icons are aligned
											--   nerd_font_variant = 'mono'
											-- },
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
												default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
												providers = {
													copilot = {
														name = "copilot",
														module = "blink-cmp-copilot",
														score_offset = 100,
														async = true,
														transform_items = function(_, items)
															local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
															local kind_idx = #CompletionItemKind + 1
															CompletionItemKind[kind_idx] = "Copilot"
															for _, item in ipairs(items) do
																item.kind = kind_idx
															end
															return items
														end,
													},
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
									}
									-- {
										-- 	"zbirenbaum/copilot-cmp",
										-- 	config = function ()
											-- 		require("copilot_cmp").setup()
											-- 	end
											-- }
										})
										-- vim.g.lua_indent_disable = true


										vim.opt.autochdir = false
										vim.opt.tabstop = 4
										vim.opt.softtabstop = 4
										vim.opt.shiftwidth = 4
										vim.opt.wrap = false
										vim.opt.list = true


										-- vim.opt.expandtab = false
										-- vim.opt.shiftwidth = 2
										-- vim.opt.tabstop = 2
										-- vim.opt.smartindent = false
										-- vim.opt.autoindent = true

										-- vim.opt.autochdir = false
										-- vim.opt.softtabstop = 4
										-- vim.opt.expandtab = true
										-- vim.opt.shiftwidth = 4
										-- vim.opt.tabstop = 4
										-- vim.opt.smartindent = false
										-- vim.opt.autoindent = true
										-- vim.opt.wrap = false
										-- vim.opt.list = true

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


										require("mason").setup()
										if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
											require("mason-lspconfig").setup({
												ensure_installed = { "omnisharp" },
											})
										end

										-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
										-- vim.lsp.config('*', {
											-- 	capabilities = require('cmp_nvim_lsp').default_capabilities(),
											-- })


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

											-- local cmp = require("cmp")
											-- cmp.setup({
												-- 	sources = {
													-- 		{ name = "nvim_lsp" },
													-- 		{ name = 'copilot' },
													-- 	},
													-- 	mapping = cmp.mapping.preset.insert({
														-- 		["<C-n>"] = cmp.mapping.select_next_item(), -- 既存
														-- 		["<C-p>"] = cmp.mapping.select_prev_item(), -- 既存
														--
														-- 		["<Tab>"] = vim.schedule_wrap(function(fallback)
															-- 			if cmp.visible() and has_words_before() then
															-- 				cmp.confirm({select = true})
															-- 			else
															-- 				fallback()
															-- 			end
															-- 		end),
															--
															-- 		["<S-Tab>"] = cmp.mapping(function(fallback)
																-- 			if cmp.visible() then
																-- 				cmp.select_prev_item()
																-- 			elseif vim.snippet and vim.snippet.active({ direction = -1 }) then
																-- 				vim.snippet.jump(-1)
																-- 			else
																-- 				fallback()
																-- 			end
																-- 		end, { "i", "s" }),
																--
																-- 		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enterで決定
																-- 	}),
																-- 	snippet = {
																	-- 		expand = function(args)
																		-- 			vim.snippet.expand(args.body)
																		-- 		end,
																		-- 	}
																		-- })
																		--
																		--
																		-- cmp.setup.cmdline(':', {
																			-- 	mapping = cmp.mapping.preset.cmdline(),
																			-- 	sources = cmp.config.sources({
																				-- 		{ 
																					-- 			name = "path", 
																					-- 			option = { label_trailing_slash = false},
																					-- 		},
																					-- 	}, 
																					-- 	{
																						-- 		{
																							-- 			name = 'cmdline',
																							-- 			option = {
																								-- 				ignore_cmds = { 'Man', '!' }
																								-- 			}
																								-- 		}
																								-- 	}),
																								-- 	-- matching = { disallow_symbol_nonprefix_matching = false }
																								-- })
																								-- cmp.setup.cmdline("/", {
																									-- 	mapping = cmp.mapping.preset.cmdline(),
																									-- 	sources = {
																										-- 		{ name = "buffer" },
																										-- 	},
																										-- })





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
																												-- inactive = {
																													-- 	a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
																													-- 	b = {bg = colors.darkgray, fg = colors.gray},
																													-- 	c = {bg = colors.darkgray, fg = colors.gray}
																													-- }
																													-- },
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

