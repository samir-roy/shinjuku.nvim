local named_colors = require("shinjuku.named_colors")

local shinjuku = {
	shinjuku0_gui = named_colors.black, -- shinjuku0 in palette
	shinjuku1_gui = named_colors.dark_gray, -- shinjuku1 in palette
	shinjuku2_gui = named_colors.gray, -- shinjuku2 in palette
	shinjuku3_gui = named_colors.light_gray, -- shinjuku3 in palette
	shinjuku3_gui_bright = named_colors.light_gray_bright, -- out of palette
	shinjuku4_gui = named_colors.darkest_white, -- shinjuku4 in palette
	shinjuku5_gui = named_colors.darker_white, -- shinjuku5 in palette
	shinjuku6_gui = named_colors.white, -- shinjuku6 in palette
	shinjuku7_gui = named_colors.teal, -- shinjuku7 in palette
	shinjuku8_gui = named_colors.off_blue, -- shinjuku8 in palette
	shinjuku9_gui = named_colors.glacier, -- shinjuku9 in palette
	shinjuku10_gui = named_colors.blue, -- shinjuku10 in palette
	shinjuku11_gui = named_colors.red, -- shinjuku11 in palette
	shinjuku12_gui = named_colors.orange, -- shinjuku12 in palette
	shinjuku13_gui = named_colors.yellow, -- shinjuku13 in palette
	shinjuku14_gui = named_colors.green, -- shinjuku14 in palette
	shinjuku15_gui = named_colors.neon_yellow, -- shinjuku15 in palette
  black = named_colors.pure_black,
  special = named_colors.light_lavender,
	none = named_colors.none,
}

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.shinjuku_contrast then
	shinjuku.sidebar = shinjuku.shinjuku1_gui
	shinjuku.float = shinjuku.shinjuku1_gui
else
	shinjuku.sidebar = shinjuku.shinjuku0_gui
	shinjuku.float = shinjuku.shinjuku0_gui
end

if vim.g.shinjuku_cursorline_transparent then
	shinjuku.cursorlinebg = shinjuku.shinjuku0_gui
	shinjuku.cursorlinefg = shinjuku.none
else
	shinjuku.cursorlinebg = shinjuku.shinjuku11_gui
	shinjuku.cursorlinefg = shinjuku.shinjuku0_gui
end

return shinjuku
