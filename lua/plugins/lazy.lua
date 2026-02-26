return {
{
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- set this if you want to always pull the latest change
	build = "make",

  dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
    "stevearc/dressing.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons

		-- Copilot backend
		{
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false }, -- disable ghost text (Avante handles suggestions)
          panel = { enabled = false },
        })
      end,
		},

      -- Make sure to set this up properly if you have lazy=true
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
		
      -- support for image pasting
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
	-- provider = "copilot",
	-- copilot = {
	--     endpoint = "https://api.githubcopilot.com",
	--     model = "gpt-4o-2024-08-06",
	--     proxy = nil, -- [protocol://]host[:port] Use this proxy
	--     allow_insecure = false, -- Allow insecure server connections
	    -- timeout = 30000, -- Timeout in milliseconds
	    -- temperature = 0,
	    -- max_tokens = 4096,
	    --},
	  --provider = "openai",
	  --openai = {
	  --  model = "gpt-40-mini",
	  --  },
		--	default = {
		 -- 	embed_image_as_base64 = false,
		 -- 	prompt_for_file_name = false,
		 -- 	drag_and_drop = {
		 -- 		insert_mode = true,
		 -- 	},
     --     -- required for Windows users
     --     use_absolute_path = true,
     --   },
      },
    },
  },
  opts = {
		-- provider = "claude", -- Recommend using Claude
		-- claude = {
		-- 	endpoint = "https://api.anthropic.com",
		-- 	model = "claude-3-haiku",
		-- 	--model = "claude-3-sonnet",
		-- 	temperature = 0,
		-- 	max_tokens = 4096,
		-- },
		-- provider = "openai",
		-- openai = {
		-- 	-- endpoint = "https://api.openai.com/v1",
		-- 	model = "gpt-4o-mini",

		-- 	-- timeout = 30000,
		-- 	-- temperature = 0,
		-- 	-- max_tokens = 4096,
		-- 	-- ["local"] = false,
		-- },
		provider = "copilot",
		auto_suggestions_provider = "copilot",

		openai = {
			endpoint = "https://api.githubcopilot.com",
			model = "gpt-4o-2024-08-06",
			proxy = nil, -- [protocol://]host[:port] Use this proxy
			allow_insecure = false, -- Allow insecure server connections
			timeout = 30000, -- Timeout in milliseconds
			temperature = 0,
			max_tokens = 4096,
		}
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
},
{
  "echasnovski/mini.starter",
  version = false,
  event = "VimEnter",
  opts = function()
    local logo = table.concat({
"░░░░░░░ ░░░░░░  ░░     ░░ ░░   ░░ ░░    ░░ ░░    ░░ ░░ ",
"▒▒      ▒▒   ▒▒ ▒▒     ▒▒ ▒▒  ▒▒  ▒▒    ▒▒ ▒▒    ▒▒ ▒▒ ",
"▒▒▒▒▒   ▒▒▒▒▒▒  ▒▒  ▒  ▒▒ ▒▒▒▒▒   ▒▒    ▒▒ ▒▒    ▒▒ ▒▒ ",
"▓▓      ▓▓   ▓▓ ▓▓ ▓▓▓ ▓▓ ▓▓  ▓▓  ▓▓    ▓▓  ▓▓  ▓▓  ▓▓ ",
"███████ ██   ██  ███ ███  ██   ██  ██████    ████   ██ ",

      --      "        ██████████                      ███   ████                     ███          ",            
      --      "        ████            █               ███ ████                                    ",                                     
      --      "        ███████    ██████  ███ ███ ███  ███████    ███   ███ ███  ███  ███          ",            
      --      "        ███████    ███     ███████ ██   ████████   ███   ███  ███ ███  ███          ",            
      --      "        ████       ███      ████ ████   ███  ████  ███   ███   █████   ███          ",            
      --      "        ██████████ ███      ████ ███    ███   ████  ████████   ████    ███          ",            
    }, "\n")
    local pad = string.rep(" ", 22)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    local starter = require("mini.starter")
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section("Find file",       "Telescope find_files",                                   "Telescope"),
        new_section("Recent files",    "Telescope oldfiles",                                     "Telescope"),
        new_section("Grep text",       "Telescope live_grep",                                    "Telescope"),
        new_section("Config",          "lua require('lazyvim.util').telescope.config_files()()", "Config"),
        new_section("Extras",          "LazyExtras",                                             "Config"),
        new_section("Lazy",            "Lazy",                                                   "Config"),
        new_section("New file",        "ene | startinsert",                                      "Built-in"),
        new_section("Quit",            "qa",                                                     "Built-in"),
        new_section("Session restore", [[lua require("persistence").load()]],                    "Session"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      },
    }
    return config
  end,
  config = function(_, config)
    -- Initialize the starter with the provided config
    local starter = require("mini.starter")
    starter.setup(config)

    -- Setup autocommand for LazyVim startup
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(" ", 8)
        starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(function()
          if vim.api.nvim_buf_is_valid(starter.config.buf_id) then
            starter.refresh()
          end
        end)
      end,
    })
  end,
}
}
