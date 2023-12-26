-- Bootstrap plugins manager
local plugins_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(plugins_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    plugins_path,
  })
end
vim.opt.rtp:prepend(plugins_path)

-- Load user configs before load plugins
require("user.configs")

require("lazy").setup({
  -- Load plugin specifics in directories
  spec = {
    { import = "user/plugins" },
    { import = "user/langs" },
    -- { import = "user/debug" },
  },
  defaults = {
    -- Do not lazy load plugins by default
    lazy = false,
    -- Always use the latest git commit, set to "*" for latest stable version
    version = false,
  },
  install = {
    -- Automatically install missing plugins
    missing = true,
    -- Try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "tokyonight", "catppuccin", "habamax" },
  },
  -- Do not automatically check for plugin updates
  checker = { enabled = false },
  -- Do not automatically check for config file changes and reload the ui
  change_detection = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
