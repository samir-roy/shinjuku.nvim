local colors = require("shinjuku.colors")

local shinjuku = {}

shinjuku.normal = {
	a = { fg = colors.shinjuku1_gui, bg = colors.shinjuku15_gui },
	b = { fg = colors.shinjuku5_gui, bg = colors.shinjuku2_gui },
	c = { fg = colors.shinjuku5_gui, bg = colors.shinjuku3_gui_bright },
}

shinjuku.insert = {
	a = { fg = colors.shinjuku1_gui, bg = colors.shinjuku14_gui },
	b = { fg = colors.shinjuku6_gui, bg = colors.shinjuku2_gui },
	y = {  fg = colors.shinjuku5_gui, bg = colors.shinjuku2_gui },
}

shinjuku.visual = {
	a = { fg = colors.shinjuku0_gui, bg = colors.shinjuku11_gui },
	b = { fg = colors.shinjuku4_gui, bg = colors.shinjuku2_gui },
	y = {  fg = colors.shinjuku5_gui, bg = colors.shinjuku2_gui },
}

shinjuku.replace = {
	a = { fg = colors.shinjuku0_gui, bg = colors.shinjuku12_gui },
	b = { fg = colors.shinjuku4_gui, bg = colors.shinjuku2_gui },
	y = {  fg = colors.shinjuku5_gui, bg = colors.shinjuku2_gui },
}

shinjuku.command = {
	a = { fg = colors.shinjuku0_gui, bg = colors.shinjuku4_gui, gui = "bold" },
	b = { fg = colors.shinjuku4_gui, bg = colors.shinjuku2_gui },
	y = {  fg = colors.shinjuku5_gui, bg = colors.shinjuku2_gui },
}

shinjuku.inactive = {
	a = { fg = colors.shinjuku4_gui, bg = colors.shinjuku0_gui, gui = "bold" },
	b = { fg = colors.shinjuku4_gui, bg = colors.shinjuku0_gui },
	c = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui },
}

return shinjuku
