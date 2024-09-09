return {
  "echasnovski/mini.starter",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = "VimEnter",
  opts = function()
    local logo = table.concat({
"        ██████████                      ███   ████                     ███          ",            
"        ████            █               ███ ████                                    ",                                     
"        ███████    ██████  ███ ███ ███  ███████    ███   ███ ███  ███  ███          ",            
"        ███████    ███     ███████ ██   ████████   ███   ███  ███ ███  ███          ",            
"        ████       ███      ████ ████   ███  ████  ███   ███   █████   ███          ",            
"        ██████████ ███      ████ ███    ███   ████  ████████   ████    ███          ",            
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
      --local starter = require("mini.starter")
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
end
}
