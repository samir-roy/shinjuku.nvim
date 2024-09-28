local palette = require("shinjuku.palette")

local shinjuku = {
	background = palette.black,
	shinjuku1_gui = palette.dark_gray,
	shinjuku2_gui = palette.gray,
	shinjuku3_gui = palette.light_gray,
	shinjuku3_gui_bright = palette.gray,
	shinjuku4_gui = palette.darkest_white,
	text = palette.darker_white,
	shinjuku6_gui = palette.white,
	shinjuku7_gui = palette.white,
	shinjuku8_gui = palette.white,
	shinjuku9_gui = palette.white,
	shinjuku10_gui = palette.white,
	shinjuku11_gui = palette.red,
	shinjuku12_gui = palette.orange,
	shinjuku13_gui = palette.yellow,
	shinjuku14_gui = palette.green,
	shinjuku15_gui = palette.neon_yellow,
  shinjuku_bracket = palette.silver,
  shinjuku_error = palette.deep_pink,
  black = palette.pure_black,
  darkest = palette.darkest_gray,
  special = palette.deep_lavender,
  highlight = palette.blue,
	none = palette.none,
}

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.shinjuku_contrast then
	shinjuku.sidebar = shinjuku.shinjuku1_gui
	shinjuku.float = shinjuku.shinjuku1_gui
else
	shinjuku.sidebar = shinjuku.background
	shinjuku.float = shinjuku.background
end

if vim.g.shinjuku_cursorline_transparent then
	shinjuku.cursorlinebg = shinjuku.background
	shinjuku.cursorlinefg = shinjuku.none
else
	shinjuku.cursorlinebg = shinjuku.shinjuku11_gui
	shinjuku.cursorlinefg = shinjuku.background
end

return shinjuku
