return {

  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  cmd = "CopilotChat",
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      model = "gpt-4",
      auto_insert_mode = true,
      show_help = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
--        layout = {
--          position = "50%",
--          size = {
--            height = "60%",
--            width = "60%",
--          },
--        },
--        options = {
--          style = "minimal",
--          border = "rounded",
--        },
--        floating_window = true,
			},
      selection = function(source)
        local select = require("CopilotChat.select")
        return select.visual(source) or select.buffer(source)
      end,
    }
  end,
  keys = {
    { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
    --{ "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        return require("CopilotChat").toggle()
      end,
      desc = "Toggle (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function()
        return require("CopilotChat").reset()
      end,
      desc = "Clear (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>aq",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input)
        end
      end,
      desc = "Quick Chat (CopilotChat)",
      mode = { "n", "v" },
    },
    -- Show help actions with telescope
    { "<leader>ad", function() require('telescope.builtin').pick('help') end, desc = "Diagnostic Help (CopilotChat)", mode = { "n", "v" } },
    -- Show prompts actions with telescope
    --{ "<leader>ap", function() require('telescope.builtin').pick('prompt') end, desc = "Prompt Actions (CopilotChat)", mode = { "n", "v" } },
    { "<leader>ap", function() require('telescope.builtin').pick('prompt') end, desc = "Prompt Actions (CopilotChat)", mode = { "n", "v" } },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    require("CopilotChat.integrations.cmp").setup()

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}

