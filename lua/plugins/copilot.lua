return {
    "zbirenbaum/copilot.lua",
    -- Use InsertEnter so it attaches the moment you start typing in any file
    event = "InsertEnter", 
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = true,
                hide_during_completion = true,
                keymap = {
                    accept = false, -- We disable the default so your S-Tab works
                },
            },
            panel = { enabled = false },
            filetypes = {
                -- This ensures it attaches to everything except what you explicitly deny
                ["*"] = true,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },
        })

        -- Your Shift-Tab Mapping
        vim.keymap.set("i", '<S-Tab>', function()
            if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
            else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
            end
        end, { silent = true })
    end,
}
