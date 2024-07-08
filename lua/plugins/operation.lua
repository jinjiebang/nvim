return {
    {
        "keaising/im-select.nvim",
        vscode = true,
        config = function()
            require("im_select").setup({})
        end,
    },
    {
        "folke/flash.nvim",
        opts = {
            label = {
                uppercase = false,
            },
        }
    },
    {
        'vscode-neovim/vscode-multi-cursor.nvim',
        event = 'VeryLazy',
        vscode = true,
        opts = { no_selection = true },
        cond = not not vim.g.vscode,
    }
}
