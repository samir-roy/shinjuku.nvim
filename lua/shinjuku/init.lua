-- Colorscheme name:    shinjuku.nvim
-- Description:         Shinjuku Neovim Dark Colorscheme
-- Author:              https://github.com/samir-roy

local bufferline = require("bufferline.theme")

-- Sets up global function to toggle colorful syntax highlighting
local installColorfulToggleCommand = function()
  -- function to reapply theme when changing syntax highlighting colorful mode
  function ShinjukuToggleColorfulSyntax()
    if vim.g.shinjuku_minimal_syntax then
      vim.g.shinjuku_minimal_syntax = false
    else
      vim.g.shinjuku_minimal_syntax = true
    end

    require("shinjuku.util").reapply()
  end

  -- define command :ShinjukuToggleColorfulSyntax
  vim.api.nvim_exec([[
    command! ShinjukuToggleColorfulSyntax lua ShinjukuToggleColorfulSyntax()
  ]], false)
end

-- Load the theme
local set = function()
  installColorfulToggleCommand()
  require("shinjuku.util").load()
end

return { set = set, bufferline = bufferline }
