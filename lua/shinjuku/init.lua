-- Colorscheme name:    shinjuku.nvim
-- Description:         Shinjuku Neovim Dark Colorscheme
-- Author:              https://github.com/samir-roy

local bufferline = require("bufferline.theme")

-- Load the theme
local set = function()
  require("shinjuku.util").load()
end

return { set = set, bufferline = bufferline }
