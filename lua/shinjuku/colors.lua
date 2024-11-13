local palette = require("shinjuku.palette")

local colors = {
  background = palette.black,
  dark_background = palette.dark_gray,
  light_background = palette.gray,

  inactive_text = palette.light_gray,
  dark_text = palette.darker_white,
  darkest_text = palette.darkest_white,

  comment = palette.gray,
  delete = palette.red,
  constant = palette.yellow,
  bracket = palette.silver,

  success = palette.green,
  warning = palette.neon_yellow,
  error = palette.deep_pink,

  substitute = palette.orange,
  highlight = palette.blue,
  darkest = palette.darkest_gray,
  black = palette.pure_black,
  special = palette.deep_lavender,
  none = palette.none,
}

-- Optional fewer colors in syntax highlighting
if vim.g.shinjuku_minimal_syntax then
  colors.syntax_default = palette.white
  colors.syntax_function = palette.white
  colors.syntax_keyword = palette.bright_white
  colors.syntax_param = palette.white
  colors.syntax_tag = palette.white
  colors.string = palette.sky_blue
else
  colors.syntax_default = palette.white
  colors.syntax_function = palette.sea_green
  colors.syntax_keyword = palette.light_cyan
  colors.syntax_param = palette.sky_blue
  colors.syntax_tag = palette.sea_green
  colors.string = palette.red
end

-- Optional contrast sidebars, floating windows and popup menus
if vim.g.shinjuku_contrast then
  colors.sidebar = colors.dark_background
  colors.float = colors.dark_background
else
  colors.sidebar = colors.background
  colors.float = colors.none
end

-- Optional darker background for cursor line
if vim.g.shinjuku_cursorline_transparent then
  colors.cursorlinebg = palette.none
  colors.cursorlinefg = palette.none
else
  colors.cursorlinebg = palette.darker_than_black
  colors.cursorlinefg = palette.none
end

return colors
