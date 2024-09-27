local named_colors = require("shinjuku.named_colors")

local shinjuku = {
	background = named_colors.black,
	shinjuku1_gui = named_colors.dark_gray,
	shinjuku2_gui = named_colors.gray,
	shinjuku3_gui = named_colors.light_gray,
	shinjuku3_gui_bright = named_colors.gray,
	shinjuku4_gui = named_colors.darkest_white,
	shinjuku5_gui = named_colors.darker_white,
	shinjuku6_gui = named_colors.white,
	shinjuku7_gui = named_colors.white,
	shinjuku8_gui = named_colors.white,
	shinjuku9_gui = named_colors.white,
	shinjuku10_gui = named_colors.white,
	shinjuku11_gui = named_colors.red,
	shinjuku12_gui = named_colors.orange,
	shinjuku13_gui = named_colors.yellow,
	shinjuku14_gui = named_colors.green,
	shinjuku15_gui = named_colors.neon_yellow,
  shinjuku_bracket = named_colors.silver,
  shinjuku_error = named_colors.deep_pink,
  black = named_colors.pure_black,
  darkest = named_colors.darkest_gray,
  special = named_colors.deep_lavender,
	none = named_colors.none,
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
