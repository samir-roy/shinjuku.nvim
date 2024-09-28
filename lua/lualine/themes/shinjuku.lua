local colors = require("shinjuku.colors")

local shinjuku = {}

shinjuku.normal = {
	a = { fg = colors.dark_background, bg = colors.warning },
	b = { fg = colors.dark_text, bg = colors.light_background },
	c = { fg = colors.dark_text, bg = colors.dark_background },
}

shinjuku.insert = {
	a = { fg = colors.dark_background, bg = colors.success },
	b = { fg = colors.syntax_function, bg = colors.light_background },
	y = {  fg = colors.dark_text, bg = colors.light_background },
}

shinjuku.visual = {
	a = { fg = colors.background, bg = colors.error },
	b = { fg = colors.darkest_text, bg = colors.light_background },
	y = {  fg = colors.dark_text, bg = colors.light_background },
}

shinjuku.replace = {
	a = { fg = colors.background, bg = colors.substitute },
	b = { fg = colors.darkest_text, bg = colors.light_background },
	y = {  fg = colors.dark_text, bg = colors.light_background },
}

shinjuku.command = {
	a = { fg = colors.background, bg = colors.darkest_text, gui = "bold" },
	b = { fg = colors.darkest_text, bg = colors.light_background },
	y = {  fg = colors.dark_text, bg = colors.light_background },
}

shinjuku.inactive = {
	a = { fg = colors.darkest_text, bg = colors.background, gui = "bold" },
	b = { fg = colors.darkest_text, bg = colors.background },
	c = { fg = colors.darkest_text, bg = colors.dark_background },
}

return shinjuku
