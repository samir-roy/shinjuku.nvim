local shinjuku = require("shinjuku.colors")

local theme = {}

local italic = vim.g.shinjuku_italic == false and shinjuku.none or "italic"
local italic_undercurl = vim.g.shinjuku_italic == false and "undercurl" or "italic,undercurl"
local bold = vim.g.shinjuku_bold == false and shinjuku.none or "bold"
local reverse_bold = vim.g.shinjuku_bold == false and "reverse" or "reverse,bold"
local bold_underline = vim.g.shinjuku_bold == false and "underline" or "bold,underline"
local bold_italic;
if vim.g.shinjuku_bold == false then
	bold_italic = vim.g.shinjuku_italic == false and shinjuku.none or "italic"
elseif vim.g.shinjuku_italic == false then
	bold_italic = "bold"
else
	bold_italic = "bold,italic"
end

theme.loadSyntax = function()
	-- Syntax highlight groups
	return {
		Type = { fg = shinjuku.shinjuku9_gui }, -- int, long, char, etc.
		StorageClass = { fg = shinjuku.shinjuku9_gui }, -- static, register, volatile, etc.
		Structure = { fg = shinjuku.shinjuku9_gui }, -- struct, union, enum, etc.
		Constant = { fg = shinjuku.shinjuku4_gui }, -- any constant
		Character = { fg = shinjuku.shinjuku12_gui }, -- any character constant: 'c', '\n'
		Number = { fg = shinjuku.shinjuku15_gui }, -- a number constant: 5
		Boolean = { fg = shinjuku.shinjuku9_gui }, -- a boolean constant: TRUE, false
		Float = { fg = shinjuku.shinjuku15_gui }, -- a floating point constant: 2.3e10
		Statement = { fg = shinjuku.shinjuku9_gui }, -- any statement
		Label = { fg = shinjuku.shinjuku9_gui }, -- case, default, etc.
		Operator = { fg = shinjuku.shinjuku9_gui }, -- sizeof", "+", "*", etc.
		Exception = { fg = shinjuku.shinjuku9_gui }, -- try, catch, throw
		PreProc = { fg = shinjuku.shinjuku9_gui }, -- generic Preprocessor
		Include = { fg = shinjuku.shinjuku9_gui }, -- preprocessor #include
		Define = { fg = shinjuku.shinjuku9_gui }, -- preprocessor #define
		Macro = { fg = shinjuku.shinjuku9_gui }, -- same as Define
		Typedef = { fg = shinjuku.shinjuku9_gui }, -- A typedef
		PreCondit = { fg = shinjuku.shinjuku13_gui }, -- preprocessor #if, #else, #endif, etc.
		Special = { fg = shinjuku.shinjuku4_gui }, -- any special symbol
		SpecialChar = { fg = shinjuku.shinjuku13_gui }, -- special character in a constant
		Tag = { fg = shinjuku.shinjuku4_gui }, -- you can use CTRL-] on this
		Delimiter = { fg = shinjuku.shinjuku6_gui }, -- character that needs attention like , or .
		SpecialComment = { fg = shinjuku.shinjuku8_gui }, -- special things inside a comment
		Debug = { fg = shinjuku.shinjuku11_gui }, -- debugging statements
		Underlined = { fg = shinjuku.shinjuku14_gui, bg = shinjuku.none, style = "underline" }, -- text that stands out, HTML links
		Ignore = { fg = shinjuku.shinjuku1_gui }, -- left blank, hidden
		Todo = { fg = shinjuku.shinjuku13_gui, bg = shinjuku.none, style = bold_italic }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Conceal = { fg = shinjuku.none, bg = shinjuku.shinjuku0_gui },
		htmlLink = { fg = shinjuku.shinjuku14_gui, style = "underline" },
		markdownH1Delimiter = { fg = shinjuku.shinjuku8_gui },
		markdownH2Delimiter = { fg = shinjuku.shinjuku11_gui },
		markdownH3Delimiter = { fg = shinjuku.shinjuku14_gui },
		htmlH1 = { fg = shinjuku.shinjuku8_gui, style = bold },
		htmlH2 = { fg = shinjuku.shinjuku11_gui, style = bold },
		htmlH3 = { fg = shinjuku.shinjuku14_gui, style = bold },
		htmlH4 = { fg = shinjuku.shinjuku15_gui, style = bold },
		htmlH5 = { fg = shinjuku.shinjuku9_gui, style = bold },
		markdownH1 = { fg = shinjuku.shinjuku8_gui, style = bold },
		markdownH2 = { fg = shinjuku.shinjuku11_gui, style = bold },
		markdownH3 = { fg = shinjuku.shinjuku14_gui, style = bold },
		Error = { fg = shinjuku.shinjuku11_gui, bg = shinjuku.none, style = bold_underline }, -- any erroneous construct with bold
		Comment = { fg = shinjuku.shinjuku3_gui_bright, style = italic }, -- italic comments
		Conditional = { fg = shinjuku.shinjuku9_gui, style = italic }, -- italic if, then, else, endif, switch, etc.
		Function = { fg = shinjuku.shinjuku8_gui, style = italic }, -- italic funtion names
		Identifier = { fg = shinjuku.shinjuku9_gui, style = italic }, -- any variable name
		Keyword = { fg = shinjuku.shinjuku9_gui, style = italic }, -- italic for, do, while, etc.
		Repeat = { fg = shinjuku.shinjuku9_gui, style = italic }, -- italic any other keyword
		String = { fg = shinjuku.shinjuku12_gui, style = italic }, -- any string
	}
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {
		NormalFloat = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float }, -- normal text and background color
		FloatBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float }, -- normal text and background color
		ColorColumn = { fg = shinjuku.none, bg = shinjuku.shinjuku1_gui }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = shinjuku.shinjuku1_gui }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none, style = "reverse" }, -- the character under the cursor
		CursorIM = { fg = shinjuku.shinjuku5_gui, bg = shinjuku.none, style = "reverse" }, -- like Cursor, but used when in IME mode
		Directory = { fg = shinjuku.shinjuku7_gui, bg = shinjuku.none }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = shinjuku.shinjuku1_gui },
		ErrorMsg = { fg = shinjuku.none },
		Folded = { fg = shinjuku.shinjuku3_gui_bright, bg = shinjuku.none, style = italic },
		FoldColumn = { fg = shinjuku.shinjuku7_gui },
		IncSearch = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku11_gui },
		LineNr = { fg = shinjuku.shinjuku3_gui_bright },
		CursorLineNr = { fg = shinjuku.cursorlinefg, bg = shinjuku.cursorlinebg },
		MatchParen = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku11_gui, style = bold },
		ModeMsg = { fg = shinjuku.shinjuku4_gui },
		MoreMsg = { fg = shinjuku.shinjuku4_gui },
		NonText = { fg = shinjuku.shinjuku1_gui },
		Pmenu = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku2_gui },
		PmenuSel = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku10_gui },
		PmenuSbar = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku2_gui },
		PmenuThumb = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku4_gui },
		Question = { fg = shinjuku.shinjuku14_gui },
		QuickFixLine = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none, style = "reverse" },
		qfLineNr = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none, style = "reverse" },
		Search = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku11_gui },
		Substitute = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku12_gui },
		SpecialKey = { fg = shinjuku.shinjuku9_gui },
		SpellBad = { fg = shinjuku.shinjuku11_gui, bg = shinjuku.none, style = italic_undercurl },
		SpellCap = { fg = shinjuku.shinjuku7_gui, bg = shinjuku.none, style = italic_undercurl },
		SpellLocal = { fg = shinjuku.shinjuku8_gui, bg = shinjuku.none, style = italic_undercurl },
		SpellRare = { fg = shinjuku.shinjuku9_gui, bg = shinjuku.none, style = italic_undercurl },
		StatusLine = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku2_gui },
		StatusLineNC = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui },
		StatusLineTerm = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku2_gui },
		StatusLineTermNC = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui },
		TabLineFill = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none },
		TablineSel = { fg = shinjuku.shinjuku1_gui, bg = shinjuku.shinjuku9_gui },
		Tabline = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui },
		Title = { fg = shinjuku.shinjuku14_gui, bg = shinjuku.none, style = bold },
		Visual = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku15_gui },
		VisualNOS = { fg = shinjuku.none, bg = shinjuku.shinjuku2_gui },
		WarningMsg = { fg = shinjuku.shinjuku15_gui },
		WildMenu = { fg = shinjuku.shinjuku12_gui, bg = shinjuku.none, style = bold },
		CursorColumn  = { fg = shinjuku.cursorlinefg, bg = shinjuku.cursorlinebg },
		CursorLine = { fg = shinjuku.cursorlinefg, bg = shinjuku.cursorlinebg },
		ToolbarLine = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui },
		ToolbarButton = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none, style = bold },
		NormalMode = { fg = shinjuku.shinjuku15_gui, bg = shinjuku.none, style = "reverse" },
		InsertMode = { fg = shinjuku.shinjuku14_gui, bg = shinjuku.none, style = "reverse" },
		ReplacelMode = { fg = shinjuku.shinjuku12_gui, bg = shinjuku.none, style = "reverse" },
		VisualMode = { fg = shinjuku.shinjuku11_gui, bg = shinjuku.none, style = "reverse" },
		CommandMode = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none, style = "reverse" },
		Warnings = { fg = shinjuku.shinjuku15_gui },

		healthError = { fg = shinjuku.shinjuku11_gui },
		healthSuccess = { fg = shinjuku.shinjuku14_gui },
		healthWarning = { fg = shinjuku.shinjuku15_gui },

		-- dashboard
		DashboardShortCut = { fg = shinjuku.shinjuku7_gui },
		DashboardHeader = { fg = shinjuku.shinjuku9_gui },
		DashboardCenter = { fg = shinjuku.shinjuku8_gui },
		DashboardFooter = { fg = shinjuku.shinjuku14_gui, style = italic },

		-- Barbar
		BufferTabpageFill = { bg = shinjuku.shinjuku0_gui },

		BufferCurrent = { bg = shinjuku.shinjuku1_gui },
		BufferCurrentMod = { bg = shinjuku.shinjuku1_gui, fg = shinjuku.shinjuku15_gui },
		BufferCurrentIcon = { bg = shinjuku.shinjuku1_gui },
		BufferCurrentSign = { bg = shinjuku.shinjuku1_gui },
		BufferCurrentIndex = { bg = shinjuku.shinjuku1_gui },
		BufferCurrentTarget = { bg = shinjuku.shinjuku1_gui, fg = shinjuku.shinjuku11_gui },

		BufferInactive = { bg = shinjuku.shinjuku0_gui, fg = shinjuku.shinjuku3_gui },
		BufferInactiveMod = { bg = shinjuku.shinjuku0_gui, fg = shinjuku.shinjuku15_gui },
		BufferInactiveIcon = { bg = shinjuku.shinjuku0_gui, fg = shinjuku.shinjuku3_gui },
		BufferInactiveSign = { bg = shinjuku.shinjuku0_gui, fg = shinjuku.shinjuku3_gui },
		BufferInactiveIndex = { bg = shinjuku.shinjuku0_gui, fg = shinjuku.shinjuku3_gui },
		BufferInactiveTarget = { bg = shinjuku.shinjuku0_gui, fg = shinjuku.shinjuku11_gui },

		BufferVisible = { bg = shinjuku.shinjuku2_gui },
		BufferVisibleMod = { bg = shinjuku.shinjuku2_gui, fg = shinjuku.shinjuku15_gui },
		BufferVisibleIcon = { bg = shinjuku.shinjuku2_gui },
		BufferVisibleSign = { bg = shinjuku.shinjuku2_gui },
		BufferVisibleIndex = { bg = shinjuku.shinjuku2_gui },
		BufferVisibleTarget = { bg = shinjuku.shinjuku2_gui, fg = shinjuku.shinjuku11_gui },

		-- nvim-notify
		NotifyDEBUGBorder = { fg = shinjuku.shinjuku3_gui },
		NotifyDEBUGIcon = { fg = shinjuku.shinjuku3_gui },
		NotifyDEBUGTitle = { fg = shinjuku.shinjuku3_gui },
		NotifyERRORBorder = { fg = shinjuku.shinjuku11_gui },
		NotifyERRORIcon = { fg = shinjuku.shinjuku11_gui },
		NotifyERRORTitle = { fg = shinjuku.shinjuku11_gui },
		NotifyINFOBorder = { fg = shinjuku.shinjuku14_gui },
		NotifyINFOIcon = { fg = shinjuku.shinjuku14_gui },
		NotifyINFOTitle = { fg = shinjuku.shinjuku14_gui },
		NotifyTRACEBorder = { fg = shinjuku.shinjuku15_gui },
		NotifyTRACEIcon = { fg = shinjuku.shinjuku15_gui },
		NotifyTRACETitle = { fg = shinjuku.shinjuku15_gui },
		NotifyWARNBorder = { fg = shinjuku.shinjuku13_gui },
		NotifyWARNIcon = { fg = shinjuku.shinjuku13_gui },
		NotifyWARNTitle = { fg = shinjuku.shinjuku13_gui },

		-- leap.nvim
		LeapMatch = { style = "underline,nocombine", fg = shinjuku.shinjuku13_gui },
		LeapLabelPrimary = { style = "nocombine", fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku13_gui },
		LeapLabelSecondary = { style = "nocombine", fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku15_gui },
	}

	-- Options:

	--Set transparent background
	if vim.g.shinjuku_disable_background then
		editor.Normal = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none } -- normal text and background color
		editor.SignColumn = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none }
	else
		editor.Normal = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku0_gui } -- normal text and background color
		editor.SignColumn = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku0_gui }
	end

	-- Remove window split borders
	if vim.g.shinjuku_borders then
		editor.VertSplit = { fg = shinjuku.shinjuku2_gui }
	else
		editor.VertSplit = { fg = shinjuku.shinjuku0_gui }
	end

	if vim.g.shinjuku_uniform_diff_background then
		editor.DiffAdd = { fg = shinjuku.shinjuku14_gui, bg = shinjuku.shinjuku1_gui } -- diff mode: Added line
		editor.DiffChange = { fg = shinjuku.shinjuku13_gui, bg = shinjuku.shinjuku1_gui } -- diff mode: Changed line
		editor.DiffDelete = { fg = shinjuku.shinjuku11_gui, bg = shinjuku.shinjuku1_gui } -- diff mode: Deleted line
		editor.DiffText = { fg = shinjuku.shinjuku15_gui, bg = shinjuku.shinjuku1_gui } -- diff mode: Changed text within a changed line
	else
		editor.DiffAdd = { fg = shinjuku.shinjuku14_gui, bg = shinjuku.none, style = "reverse" } -- diff mode: Added line
		editor.DiffChange = { fg = shinjuku.shinjuku13_gui, bg = shinjuku.none, style = "reverse" } -- diff mode: Changed line
		editor.DiffDelete = { fg = shinjuku.shinjuku11_gui, bg = shinjuku.none, style = "reverse" } -- diff mode: Deleted line
		editor.DiffText = { fg = shinjuku.shinjuku15_gui, bg = shinjuku.none, style = "reverse" } -- diff mode: Changed text within a changed line
	end

	return editor
end

theme.loadTerminal = function()
	vim.g.terminal_color_0 = shinjuku.shinjuku1_gui
	vim.g.terminal_color_1 = shinjuku.shinjuku11_gui
	vim.g.terminal_color_2 = shinjuku.shinjuku14_gui
	vim.g.terminal_color_3 = shinjuku.shinjuku13_gui
	vim.g.terminal_color_4 = shinjuku.shinjuku9_gui
	vim.g.terminal_color_5 = shinjuku.shinjuku15_gui
	vim.g.terminal_color_6 = shinjuku.shinjuku8_gui
	vim.g.terminal_color_7 = shinjuku.shinjuku5_gui
	vim.g.terminal_color_8 = shinjuku.shinjuku3_gui
	vim.g.terminal_color_9 = shinjuku.shinjuku11_gui
	vim.g.terminal_color_10 = shinjuku.shinjuku14_gui
	vim.g.terminal_color_11 = shinjuku.shinjuku13_gui
	vim.g.terminal_color_12 = shinjuku.shinjuku9_gui
	vim.g.terminal_color_13 = shinjuku.shinjuku15_gui
	vim.g.terminal_color_14 = shinjuku.shinjuku7_gui
	vim.g.terminal_color_15 = shinjuku.shinjuku6_gui
end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		TSConstructor = { fg = shinjuku.shinjuku9_gui }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		TSConstant = { fg = shinjuku.shinjuku13_gui }, -- For constants
		TSFloat = { fg = shinjuku.shinjuku15_gui }, -- For floats
		TSNumber = { fg = shinjuku.shinjuku15_gui }, -- For all number
		TSAttribute = { fg = shinjuku.shinjuku15_gui }, -- (unstable) TODO: docs
		TSError = { fg = shinjuku.shinjuku11_gui }, -- For syntax/parser errors.
		TSException = { fg = shinjuku.shinjuku15_gui }, -- For exception related keywords.
		TSFuncMacro = { fg = shinjuku.shinjuku7_gui }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = shinjuku.shinjuku9_gui }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSLabel = { fg = shinjuku.shinjuku15_gui }, -- For labels: `label:` in C and `:label:` in Lua.
		TSOperator = { fg = shinjuku.shinjuku9_gui }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = shinjuku.shinjuku10_gui }, -- For parameters of a function.
		TSParameterReference = { fg = shinjuku.shinjuku10_gui }, -- For references to parameters of a function.
		TSPunctDelimiter = { fg = shinjuku.shinjuku8_gui }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = shinjuku.shinjuku8_gui }, -- For brackets and parens.
		TSPunctSpecial = { fg = shinjuku.shinjuku8_gui }, -- For special punctutation that does not fall in the catagories before.
		TSSymbol = { fg = shinjuku.shinjuku15_gui }, -- For identifiers referring to symbols or atoms.
		TSType = { fg = shinjuku.shinjuku9_gui }, -- For types.
		TSTypeBuiltin = { fg = shinjuku.shinjuku9_gui }, -- For builtin types.
		TSTag = { fg = shinjuku.shinjuku4_gui }, -- Tags like html tag names.
		TSTagDelimiter = { fg = shinjuku.shinjuku2_gui }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = shinjuku.shinjuku4_gui }, -- For strings consideshinjuku11_gui text in a markup language.
		TSTextReference = { fg = shinjuku.shinjuku15_gui }, -- FIXME
		TSEmphasis = { fg = shinjuku.shinjuku10_gui }, -- For text to be represented with emphasis.
		TSUnderline = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none, style = "underline" }, -- For text to be represented with an underline.
		TSLiteral = { fg = shinjuku.shinjuku4_gui }, -- Literal text.
		TSURI = { fg = shinjuku.shinjuku14_gui }, -- Any URI like a link or email.
		TSAnnotation = { fg = shinjuku.shinjuku11_gui }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		["@constructor"] = { fg = shinjuku.shinjuku9_gui },
		["@constant"] = { fg = shinjuku.shinjuku13_gui },
		["@float"] = { fg = shinjuku.shinjuku15_gui },
		["@number"] = { fg = shinjuku.shinjuku15_gui },
		["@attribute"] = { fg = shinjuku.shinjuku15_gui },
		["@error"] = { fg = shinjuku.shinjuku11_gui },
		["@exception"] = { fg = shinjuku.shinjuku15_gui },
		["@funtion.macro"] = { fg = shinjuku.shinjuku7_gui },
		["@include"] = { fg = shinjuku.shinjuku9_gui },
		["@label"] = { fg = shinjuku.shinjuku15_gui },
		["@operator"] = { fg = shinjuku.shinjuku9_gui },
		["@parameter"] = { fg = shinjuku.shinjuku10_gui },
		["@punctuation.delimiter"] = { fg = shinjuku.shinjuku8_gui },
		["@punctuation.bracket"] = { fg = shinjuku.shinjuku8_gui },
		["@punctuation.special"] = { fg = shinjuku.shinjuku8_gui },
		["@symbol"] = { fg = shinjuku.shinjuku15_gui },
		["@type"] = { fg = shinjuku.shinjuku9_gui },
		["@type.builtin"] = { fg = shinjuku.shinjuku9_gui },
		["@tag"] = { fg = shinjuku.shinjuku4_gui },
		["@tag.delimiter"] = { fg = shinjuku.shinjuku2_gui },
		["@text"] = { fg = shinjuku.shinjuku4_gui },
		["@text.reference"] = { fg = shinjuku.shinjuku15_gui, style = bold },
		["@text.emphasis"] = { fg = shinjuku.shinjuku10_gui, style = italic },
		["@text.underline"] = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none, style = "underline" },
		["@text.literal"] = { fg = shinjuku.shinjuku4_gui },
		["@text.uri"] = { fg = shinjuku.shinjuku12_gui, style = "underline" },
		["@text.strike"] = { fg = shinjuku.shinjuku4_gui, style = "strikethrough" },
		["@text.math"] = { fg = shinjuku.shinjuku7_gui },

		-- @todo Missing highlights
		-- @function.call
		-- @method.call
		-- @type.qualifier
		-- @text.math (e.g. for LaTeX math environments)
		-- @text.environment (e.g. for text environments of markup languages)
		-- @text.environment.name (e.g. for the name/the string indicating the type of text environment)
		-- @text.note
		-- @text.warning
		-- @text.danger
		-- @tag.attribute
		-- @string.special
	}

	treesitter.TSVariableBuiltin = { fg = shinjuku.shinjuku4_gui, style = bold }
	treesitter.TSBoolean = { fg = shinjuku.shinjuku9_gui, style = bold }
	treesitter.TSConstBuiltin = { fg = shinjuku.shinjuku7_gui, style = bold }
	treesitter.TSConstMacro = { fg = shinjuku.shinjuku7_gui, style = bold }
	treesitter.TSVariable = { fg = shinjuku.shinjuku4_gui, style = bold }
	treesitter.TSTitle = { fg = shinjuku.shinjuku10_gui, bg = shinjuku.none, style = bold }
	treesitter["@variable"] = { fg = shinjuku.shinjuku4_gui, style = bold }
	treesitter["@variable.builtin"] = { fg = shinjuku.shinjuku4_gui, style = bold }
	treesitter["@variable.global"] = { fg = shinjuku.shinjuku4_gui, style = bold }
	treesitter["@boolean"] = { fg = shinjuku.shinjuku9_gui, style = bold }
	treesitter["@constant.builtin"] = { fg = shinjuku.shinjuku7_gui, style = bold }
	treesitter["@constant.macro"] = { fg = shinjuku.shinjuku7_gui, style = bold }
	treesitter["@text.title"] = { fg = shinjuku.shinjuku10_gui, bg = shinjuku.none, style = bold }
	treesitter["@text.strong"] = { fg = shinjuku.shinjuku10_gui, bg = shinjuku.none, style = bold }
	-- Comments
	treesitter.TSComment = { fg = shinjuku.shinjuku3_gui_bright, style = italic }
	-- Conditionals
	treesitter.TSConditional = { fg = shinjuku.shinjuku9_gui, style = italic } -- For keywords related to conditionnals.
	-- Function names
	treesitter.TSFunction = { fg = shinjuku.shinjuku8_gui, style = italic } -- For fuction (calls and definitions).
	treesitter.TSMethod = { fg = shinjuku.shinjuku7_gui, style = italic } -- For method calls and definitions.
	treesitter.TSFuncBuiltin = { fg = shinjuku.shinjuku8_gui, style = italic }
	-- Namespaces and property accessors
	treesitter.TSNamespace = { fg = shinjuku.shinjuku4_gui, style = italic } -- For identifiers referring to modules and namespaces.
	treesitter.TSField = { fg = shinjuku.shinjuku4_gui, style = italic } -- For fields.
	treesitter.TSProperty = { fg = shinjuku.shinjuku10_gui, style = italic } -- Same as `TSField`, but when accessing, not declaring.
	-- Language keywords
	treesitter.TSKeyword = { fg = shinjuku.shinjuku9_gui, style = italic } -- For keywords that don't fall in other categories.
	treesitter.TSKeywordFunction = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter.TSKeywordReturn = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter.TSKeywordOperator = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter.TSRepeat = { fg = shinjuku.shinjuku9_gui, style = italic } -- For keywords related to loops.
	-- Strings
	treesitter.TSString = { fg = shinjuku.shinjuku12_gui, style = italic } -- For strings.
	treesitter.TSStringRegex = { fg = shinjuku.shinjuku7_gui, style = italic } -- For regexes.
	treesitter.TSStringEscape = { fg = shinjuku.shinjuku15_gui, style = italic } -- For escape characters within a string.
	treesitter.TSCharacter = { fg = shinjuku.shinjuku12_gui, style = italic } -- For characters.

	treesitter["@comment"] = { fg = shinjuku.shinjuku3_gui_bright, style = italic }
	treesitter["@conditional"] = { fg = shinjuku.shinjuku9_gui, style = italic }
	treesitter["@function"] = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter["@method"] = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter["@function.builtin"] = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter["@namespace"] = { fg = shinjuku.shinjuku4_gui, style = italic }
	treesitter["@field"] = { fg = shinjuku.shinjuku4_gui, style = italic }
	treesitter["@property"] = { fg = shinjuku.shinjuku10_gui, style = italic }
	treesitter["@keyword"] = { fg = shinjuku.shinjuku9_gui, style = italic }
	treesitter["@keyword.function"] = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter["@keyword.return"] = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter["@keyword.operator"] = { fg = shinjuku.shinjuku8_gui, style = italic }
	treesitter["@repeat"] = { fg = shinjuku.shinjuku9_gui, style = italic }
	treesitter["@string"] = { fg = shinjuku.shinjuku12_gui, style = italic }
	treesitter["@string.regex"] = { fg = shinjuku.shinjuku7_gui, style = italic }
	treesitter["@string.escape"] = { fg = shinjuku.shinjuku15_gui, style = italic }
	treesitter["@character"] = { fg = shinjuku.shinjuku12_gui, style = italic }

	return treesitter
end

theme.loadFiletypes = function()
	-- Filetype-specific highlight groups

	local ft = {
		-- yaml
		yamlBlockMappingKey = { fg = shinjuku.shinjuku7_gui },
		yamlBool = { link = "Boolean" },
		yamlDocumentStart = { link = "Keyword" },
		yamlTSField = { fg = shinjuku.shinjuku7_gui },
		yamlTSString = { fg = shinjuku.shinjuku4_gui },
		yamlTSPunctSpecial = { link = "Keyword" },
		yamlKey = { fg = shinjuku.shinjuku7_gui }, -- stephpy/vim-yaml
	}

	return ft
end

theme.loadLSP = function()
	-- Lsp highlight groups

	local lsp = {
		LspDiagnosticsDefaultError = { fg = shinjuku.shinjuku11_gui }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = shinjuku.shinjuku11_gui }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = shinjuku.shinjuku11_gui }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = shinjuku.shinjuku11_gui }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = shinjuku.shinjuku11_gui }, -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning = { fg = shinjuku.shinjuku15_gui }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = shinjuku.shinjuku15_gui }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = shinjuku.shinjuku15_gui }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = shinjuku.shinjuku15_gui }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = shinjuku.shinjuku15_gui }, -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation = { fg = shinjuku.shinjuku10_gui }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = shinjuku.shinjuku10_gui }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = shinjuku.shinjuku10_gui }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = shinjuku.shinjuku10_gui }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = shinjuku.shinjuku10_gui }, -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint = { fg = shinjuku.shinjuku9_gui }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = shinjuku.shinjuku9_gui }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = shinjuku.shinjuku9_gui }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = shinjuku.shinjuku9_gui }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = shinjuku.shinjuku10_gui }, -- used to underline "Hint" diagnostics.
		LspReferenceText = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui }, -- used for highlighting "text" references
		LspReferenceRead = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui }, -- used for highlighting "read" references
		LspReferenceWrite = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui }, -- used for highlighting "write" references

		DiagnosticError = { link = "LspDiagnosticsDefaultError" },
		DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
		DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
		DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
		DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
		DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
		DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
		DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
		DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
		DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
		DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
		DiagnosticSignError = { link = "LspDiagnosticsSignError" },
		DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
		DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
		DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
		DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
		DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
		DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
		DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
		DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
	}

	return lsp
end

theme.loadPlugins = function()
	-- Plugins highlight groups

	local plugins = {

		-- LspTrouble
		LspTroubleText = { fg = shinjuku.shinjuku4_gui },
		LspTroubleCount = { fg = shinjuku.shinjuku9_gui, bg = shinjuku.shinjuku10_gui },
		LspTroubleNormal = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.sidebar },

		-- Diff
		diffAdded = { fg = shinjuku.shinjuku14_gui },
		diffRemoved = { fg = shinjuku.shinjuku11_gui },
		diffChanged = { fg = shinjuku.shinjuku15_gui },
		diffOldFile = { fg = shinjuku.yellow },
		diffNewFile = { fg = shinjuku.shinjuku12_gui },
		diffFile = { fg = shinjuku.shinjuku7_gui },
		diffLine = { fg = shinjuku.shinjuku3_gui },
		diffIndexLine = { fg = shinjuku.shinjuku9_gui },

		-- Neogit
		NeogitBranch = { fg = shinjuku.shinjuku10_gui },
		NeogitRemote = { fg = shinjuku.shinjuku9_gui },
		NeogitHunkHeader = { fg = shinjuku.shinjuku8_gui },
		NeogitHunkHeaderHighlight = { fg = shinjuku.shinjuku8_gui, bg = shinjuku.shinjuku1_gui },
		NeogitDiffContextHighlight = { bg = shinjuku.shinjuku1_gui },
		NeogitDiffDeleteHighlight = { fg = shinjuku.shinjuku11_gui, style = "reverse" },
		NeogitDiffAddHighlight = { fg = shinjuku.shinjuku14_gui, style = "reverse" },

		-- GitGutter
		GitGutterAdd = { fg = shinjuku.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = shinjuku.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = shinjuku.shinjuku11_gui }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd = { fg = shinjuku.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr = { fg = shinjuku.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn = { fg = shinjuku.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = shinjuku.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr = { fg = shinjuku.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn = { fg = shinjuku.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = shinjuku.shinjuku11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr = { fg = shinjuku.shinjuku11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn = { fg = shinjuku.shinjuku11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsCurrentLineBlame = { fg = shinjuku.shinjuku3_gui_bright, style = bold },

		-- Telescope
		TelescopePromptBorder = { fg = shinjuku.shinjuku4_gui },
		TelescopeResultsBorder = { fg = shinjuku.shinjuku4_gui },
		TelescopePreviewBorder = { fg = shinjuku.shinjuku4_gui },
		TelescopeSelectionCaret = { fg = shinjuku.shinjuku9_gui },
		TelescopeSelection = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku15_gui },
		TelescopeMatching = { link = 'Search' },

		-- NvimTree
		NvimTreeRootFolder = { fg = shinjuku.shinjuku15_gui },
		NvimTreeSymlink = { fg = shinjuku.shinjuku5_gui },
		NvimTreeFolderName = { fg = shinjuku.shinjuku4_gui },
		NvimTreeFolderIcon = { fg = shinjuku.shinjuku9_gui },
		NvimTreeEmptyFolderName = { fg = shinjuku.shinjuku4_gui },
		NvimTreeOpenedFolderName = { fg = shinjuku.shinjuku5_gui },
		NvimTreeExecFile = { fg = shinjuku.shinjuku4_gui },
		NvimTreeOpenedFile = { fg = shinjuku.shinjuku6_gui },
		NvimTreeSpecialFile = { fg = shinjuku.shinjuku4_gui, style = bold},
		NvimTreeImageFile = { fg = shinjuku.shinjuku4_gui },
		NvimTreeMarkdownFile = { fg = shinjuku.shinjuku4_gui },
		NvimTreeIndentMarker = { fg = shinjuku.shinjuku9_gui },
		NvimTreeGitDirty = { fg = shinjuku.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitStaged = { fg = shinjuku.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitMerge = { fg = shinjuku.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitRenamed = { fg = shinjuku.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitNew = { fg = shinjuku.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		NvimTreeGitDeleted = { fg = shinjuku.shinjuku11_gui },	-- diff mode: Deleted line |diff.txt|
		NvimTreeGitIgnored = { fg = shinjuku.shinjuku3_gui_bright },
		LspDiagnosticsError = { fg = shinjuku.shinjuku12_gui },
		LspDiagnosticsWarning = { fg = shinjuku.shinjuku15_gui },
		LspDiagnosticsInformation = { fg = shinjuku.shinjuku10_gui },
		LspDiagnosticsHint = { fg = shinjuku.shinjuku9_gui },

		-- WhichKey
		WhichKey = { fg = shinjuku.shinjuku8_gui, style = bold },
		WhichKeyGroup = { fg = shinjuku.shinjuku5_gui },
		WhichKeyDesc = { fg = shinjuku.shinjuku7_gui, style = italic },
		WhichKeySeperator = { fg = shinjuku.shinjuku9_gui },
		WhichKeyFloating = { bg = shinjuku.shinjuku1_gui },
		WhichKeyFloat = { bg = shinjuku.shinjuku1_gui },
		WhichKeyValue = { fg = shinjuku.shinjuku7_gui },

		-- LspSaga
		DiagnosticError = { fg = shinjuku.shinjuku12_gui },
		DiagnosticWarning = { fg = shinjuku.shinjuku15_gui },
		DiagnosticInformation = { fg = shinjuku.shinjuku10_gui },
		DiagnosticHint = { fg = shinjuku.shinjuku9_gui },
		DiagnosticTruncateLine = { fg = shinjuku.shinjuku4_gui },
		LspFloatWinBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		LspSagaDefPreviewBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		DefinitionIcon = { fg = shinjuku.shinjuku7_gui },
		TargetWord = { fg = shinjuku.shinjuku6_gui, style = 'bold' },
		-- LspSaga code action
		LspSagaCodeActionTitle = { link = 'Title' },
		LspSagaCodeActionBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		LspSagaCodeActionTrunCateLine = { link = 'LspSagaCodeActionBorder' },
		LspSagaCodeActionContent = { fg = shinjuku.shinjuku4_gui },
		-- LspSag finder
		LspSagaLspFinderBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		LspSagaAutoPreview = { fg = shinjuku.shinjuku4_gui },
		LspSagaFinderSelection = { fg = shinjuku.shinjuku6_gui, bg = shinjuku.shinjuku2_gui },
		TargetFileName = { fg = shinjuku.shinjuku4_gui },
		FinderParam = { fg = shinjuku.shinjuku15_gui, bold = true },
		FinderVirtText = { fg = shinjuku.shinjuku15_gui15 , bg = shinjuku.none },
		DefinitionsIcon = { fg = shinjuku.shinjuku9_gui },
		Definitions = { fg = shinjuku.shinjuku15_gui, bold = true },
		DefinitionCount = { fg = shinjuku.shinjuku10_gui },
		ReferencesIcon = { fg = shinjuku.shinjuku9_gui },
		References = { fg = shinjuku.shinjuku15_gui, bold = true },
		ReferencesCount = { fg = shinjuku.shinjuku10_gui },
		ImplementsIcon = { fg = shinjuku.shinjuku9_gui },
		Implements = { fg = shinjuku.shinjuku15_gui, bold = true },
		ImplementsCount = { fg = shinjuku.shinjuku10_gui },
		-- LspSaga finder spinner
		FinderSpinnerBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		FinderSpinnerTitle = { link = 'Title' },
		FinderSpinner = { fg = shinjuku.shinjuku8_gui, bold = true },
		FinderPreviewSearch = { link = 'Search' },
		-- LspSaga definition
		DefinitionBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		DefinitionArrow = { fg = shinjuku.shinjuku8_gui },
		DefinitionSearch = { link = 'Search' },
		DefinitionFile = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		-- LspSaga hover
		LspSagaHoverBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		LspSagaHoverTrunCateLine = { link = 'LspSagaHoverBorder' },
		-- Lsp rename
		LspSagaRenameBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		LspSagaRenameMatch = { fg = shinjuku.shinjuku6_gui, bg = shinjuku.shinjuku9_gui },
		-- Lsp diagnostic
		LspSagaDiagnosticSource = { link = 'Comment' },
		LspSagaDiagnosticError = { link = 'DiagnosticError' },
		LspSagaDiagnosticWarn = { link = 'DiagnosticWarn' },
		LspSagaDiagnosticInfo = { link = 'DiagnosticInfo' },
		LspSagaDiagnosticHint = { link = 'DiagnosticHint' },
		LspSagaErrorTrunCateLine = { link = 'DiagnosticError' },
		LspSagaWarnTrunCateLine = { link = 'DiagnosticWarn' },
		LspSagaInfoTrunCateLine = { link = 'DiagnosticInfo' },
		LspSagaHintTrunCateLine = { link = 'DiagnosticHint' },
		LspSagaDiagnosticBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		LspSagaDiagnosticHeader = { fg = shinjuku.shinjuku4_gui },
		DiagnosticQuickFix = { fg = shinjuku.shinjuku14_gui, bold = true },
		DiagnosticMap = { fg = shinjuku.shinjuku15_gui },
		DiagnosticLineCol = { fg = shinjuku.shinjuku4_gui },
		LspSagaDiagnosticTruncateLine = { link = 'LspSagaDiagnosticBorder' },
		ColInLineDiagnostic = { link = 'Comment' },
		-- LspSaga signture help
		LspSagaSignatureHelpBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		LspSagaShTrunCateLine = { link = 'LspSagaSignatureHelpBorder' },
		-- Lspsaga lightbulb
		LspSagaLightBulb = { link = 'DiagnosticSignHint' },
		-- LspSaga shadow
		SagaShadow = { fg = 'black' },
		-- LspSaga float
		LspSagaBorderTitle = { link = 'Title' },
		-- LspSaga Outline
		LSOutlinePreviewBorder = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		OutlineIndentEvn = { fg = shinjuku.shinjuku15_gui },
		OutlineIndentOdd = { fg = shinjuku.shinjuku12_gui },
		OutlineFoldPrefix = { fg = shinjuku.shinjuku11_gui },
		OutlineDetail = { fg = shinjuku.shinjuku4_gui },
		-- LspSaga all floatwindow
		LspFloatWinNormal = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.float },
		-- Saga End

		-- Sneak
		Sneak = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku4_gui },
		SneakScope = { bg = shinjuku.shinjuku1_gui },

		-- Cmp
		CmpItemKind = { fg = shinjuku.shinjuku15_gui },
		CmpItemAbbrMatch = { fg = shinjuku.shinjuku5_gui, style = bold },
		CmpItemAbbrMatchFuzzy = { fg = shinjuku.shinjuku5_gui, style = bold },
		CmpItemAbbr = { fg = shinjuku.shinjuku4_gui },
		CmpItemMenu = { fg = shinjuku.shinjuku14_gui },

		-- Indent Blankline
		IndentBlanklineChar = { fg = shinjuku.shinjuku3_gui },
		IndentBlanklineContextChar = { fg = shinjuku.shinjuku10_gui },

		-- headline
		-- bg = (10 * shinjuku0 + fg) / 11
		Headline1 = { fg = shinjuku.shinjuku12_gui, bg = "#3d3c44", bold = true },
		Headline2 = { fg = shinjuku.shinjuku13_gui, bg = "#3f4247", bold = true },
		Headline3 = { fg = shinjuku.shinjuku14_gui, bg = "#394147", bold = true },
		Headline4 = { fg = shinjuku.shinjuku9_gui, bg = "#363e4c", bold = true },
		Headline5 = { fg = shinjuku.shinjuku15_gui, bg = "#3a3c4a", bold = true },
		Headline6 = { fg = shinjuku.shinjuku4_gui, bg = "#3d434f", bold = true },

		Quote = { fg = shinjuku.shinjuku2_gui },
		CodeBlock = { bg = shinjuku.shinjuku1_gui },
		Dash = { shinjuku.shinjuku10_gui, bold = true },

		-- Illuminate
		illuminatedWord = { bg = shinjuku.shinjuku3_gui },
		illuminatedCurWord = { bg = shinjuku.shinjuku3_gui },
		IlluminatedWordText = { bg = shinjuku.shinjuku3_gui },
		IlluminatedWordRead = { bg = shinjuku.shinjuku3_gui },
		IlluminatedWordWrite = { bg = shinjuku.shinjuku3_gui },

		-- nvim-dap
		DapBreakpoint = { fg = shinjuku.shinjuku14_gui },
		DapStopped = { fg = shinjuku.shinjuku15_gui },

		-- nvim-dap-ui
		DapUIVariable = { fg = shinjuku.shinjuku4_gui },
		DapUIScope = { fg = shinjuku.shinjuku8_gui },
		DapUIType = { fg = shinjuku.shinjuku9_gui },
		DapUIValue = { fg = shinjuku.shinjuku4_gui },
		DapUIModifiedValue = { fg = shinjuku.shinjuku8_gui },
		DapUIDecoration = { fg = shinjuku.shinjuku8_gui },
		DapUIThread = { fg = shinjuku.shinjuku8_gui },
		DapUIStoppedThread = { fg = shinjuku.shinjuku8_gui },
		DapUIFrameName = { fg = shinjuku.shinjuku4_gui },
		DapUISource = { fg = shinjuku.shinjuku9_gui },
		DapUILineNumber = { fg = shinjuku.shinjuku8_gui },
		DapUIFloatBorder = { fg = shinjuku.shinjuku8_gui },
		DapUIWatchesEmpty = { fg = shinjuku.shinjuku11_gui },
		DapUIWatchesValue = { fg = shinjuku.shinjuku8_gui },
		DapUIWatchesError = { fg = shinjuku.shinjuku11_gui },
		DapUIBreakpointsPath = { fg = shinjuku.shinjuku8_gui },
		DapUIBreakpointsInfo = { fg = shinjuku.shinjuku8_gui },
		DapUIBreakpointsCurrentLine = { fg = shinjuku.shinjuku8_gui },
		DapUIBreakpointsLine = { fg = shinjuku.shinjuku8_gui },

		-- Hop
		HopNextKey = { fg = shinjuku.shinjuku4_gui, style = bold },
		HopNextKey1 = { fg = shinjuku.shinjuku8_gui, style = bold },
		HopNextKey2 = { fg = shinjuku.shinjuku4_gui },
		HopUnmatched = { fg = shinjuku.shinjuku3_gui },

		-- Fern
		FernBranchText = { fg = shinjuku.shinjuku3_gui_bright },

		-- nvim-ts-rainbow
		rainbowcol1 = { fg = shinjuku.shinjuku15_gui },
		rainbowcol2 = { fg = shinjuku.shinjuku13_gui },
		rainbowcol3 = { fg = shinjuku.shinjuku11_gui },
		rainbowcol4 = { fg = shinjuku.shinjuku7_gui },
		rainbowcol5 = { fg = shinjuku.shinjuku8_gui },
		rainbowcol6 = { fg = shinjuku.shinjuku15_gui },
		rainbowcol7 = { fg = shinjuku.shinjuku13_gui },

		-- lightspeed
		LightspeedLabel = { fg = shinjuku.shinjuku8_gui, style = bold },
		LightspeedLabelOverlapped = { fg = shinjuku.shinjuku8_gui, style = "bold,underline" },
		LightspeedLabelDistant = { fg = shinjuku.shinjuku15_gui, style = bold },
		LightspeedLabelDistantOverlapped = { fg = shinjuku.shinjuku15_gui, style = "bold,underline" },
		LightspeedShortcut = { fg = shinjuku.shinjuku10_gui, style = bold },
		LightspeedShortcutOverlapped = { fg = shinjuku.shinjuku10_gui, style = "bold,underline" },
		LightspeedMaskedChar = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku2_gui, style = bold },
		LightspeedGreyWash = { fg = shinjuku.shinjuku3_gui_bright },
		LightspeedUnlabeledMatch = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui },
		LightspeedOneCharMatch = { fg = shinjuku.shinjuku8_gui, style = "bold,reverse" },
		LightspeedUniqueChar = { style = "bold,underline" },

		-- copilot
		CopilotLabel = { fg = shinjuku.shinjuku3_gui, bg = shinjuku.none },

		-- Statusline
		StatusLineDull = { fg = shinjuku.shinjuku3_gui, bg = shinjuku.shinjuku1_gui },
		StatusLineAccent = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku13_gui },

		-- mini.nvim
		MiniCompletionActiveParameter = { style = "underline" },

		MiniCursorword = { bg = shinjuku.shinjuku3_gui },
		MiniCursorwordCurrent = { bg = shinjuku.shinjuku3_gui },

		MiniIndentscopeSymbol = { fg = shinjuku.shinjuku10_gui },
		MiniIndentscopePrefix = { style = "nocombine" }, -- Make it invisible

		MiniJump = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku4_gui },

		MiniJump2dSpot = { fg = shinjuku.shinjuku12_gui, style = "bold,nocombine" },

		MiniStarterCurrent = { style = "nocombine" },
		MiniStarterFooter = { fg = shinjuku.shinjuku14_gui, style = italic },
		MiniStarterHeader = { fg = shinjuku.shinjuku9_gui },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { fg = shinjuku.shinjuku4_gui },
		MiniStarterItemPrefix = { fg = shinjuku.shinjuku15_gui },
		MiniStarterSection = { fg = shinjuku.shinjuku4_gui },
		MiniStarterQuery = { fg = shinjuku.shinjuku10_gui },

		MiniStatuslineDevinfo = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku2_gui },
		MiniStatuslineFileinfo = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku2_gui },
		MiniStatuslineFilename = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku1_gui },
		MiniStatuslineInactive = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.shinjuku0_gui, style = bold },
		MiniStatuslineModeCommand = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku15_gui, style = bold },
		MiniStatuslineModeInsert = { fg = shinjuku.shinjuku1_gui, bg = shinjuku.shinjuku11_gui, style = bold },
		MiniStatuslineModeNormal = { fg = shinjuku.shinjuku1_gui, bg = shinjuku.shinjuku14_gui, style = bold },
		MiniStatuslineModeOther = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku13_gui, style = bold },
		MiniStatuslineModeReplace = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku12_gui, style = bold },
		MiniStatuslineModeVisual = { fg = shinjuku.shinjuku0_gui, bg = shinjuku.shinjuku7_gui, style = bold },

		MiniSurround = { link = "IncSearch" },

		MiniTablineCurrent = { bg = shinjuku.shinjuku1_gui },
		MiniTablineFill = { link = "TabLineFill" },
		MiniTablineHidden = { bg = shinjuku.shinjuku0_gui, fg = shinjuku.shinjuku3_gui },
		MiniTablineModifiedCurrent = { bg = shinjuku.shinjuku1_gui, fg = shinjuku.shinjuku15_gui },
		MiniTablineModifiedHidden = { bg = shinjuku.shinjuku0_gui, fg = shinjuku.shinjuku15_gui },
		MiniTablineModifiedVisible = { bg = shinjuku.shinjuku2_gui, fg = shinjuku.shinjuku15_gui },
		MiniTablineTabpagesection = { fg = shinjuku.shinjuku10_gui, bg = shinjuku.shinjuku6_gui, style = reverse_bold },
		MiniTablineVisible = { bg = shinjuku.shinjuku2_gui },

		MiniTestEmphasis = { style = bold },
		MiniTestFail = { fg = shinjuku.shinjuku11_gui, style = bold },
		MiniTestPass = { fg = shinjuku.shinjuku14_gui, style = bold },

		MiniTrailspace = { bg = shinjuku.shinjuku11_gui },

		-- Aerail
		AerialLine = { bg = shinjuku.shinjuku2_gui },
		AerialLineNC = { bg = shinjuku.shinjuku2_gui },

		AerialArrayIcon = { fg = shinjuku.shinjuku13_gui },
		AerialBooleanIcon = { fg = shinjuku.shinjuku9_gui, style = bold },
		AerialClassIcon = { fg = shinjuku.shinjuku9_gui },
		AerialConstantIcon = { fg = shinjuku.shinjuku13_gui },
		AerialConstructorIcon = { fg = shinjuku.shinjuku9_gui },
		AerialEnumIcon = { fg = shinjuku.shinjuku9_gui },
		AerialEnumMemberIcon = { fg = shinjuku.shinjuku4_gui },
		AerialEventIcon = { fg = shinjuku.shinjuku9_gui },
		AerialFieldIcon = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic } or { fg = shinjuku.shinjuku4_gui },
		AerialFileIcon = { fg = shinjuku.shinjuku14_gui },
		AerialFunctionIcon = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku8_gui, style = italic } or { fg = shinjuku.shinjuku8_gui },
		AerialInterfaceIcon = { fg = shinjuku.shinjuku9_gui },
		AerialKeyIcon = { fg = shinjuku.shinjuku9_gui },
		AerialMethodIcon = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku7_gui, style = italic } or { fg = shinjuku.shinjuku7_gui },
		AerialModuleIcon = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic } or { fg = shinjuku.shinjuku4_gui },
		AerialNamespaceIcon = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic }
			or { fg = shinjuku.shinjuku4_gui },
		AerialNullIcon = { fg = shinjuku.shinjuku9_gui },
		AerialNumberIcon = { fg = shinjuku.shinjuku15_gui },
		AerialObjectIcon = { fg = shinjuku.shinjuku9_gui },
		AerialOperatorIcon = { fg = shinjuku.shinjuku9_gui },
		AerialPackageIcon = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic } or { fg = shinjuku.shinjuku4_gui },
		AerialPropertyIcon = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic }
			or { fg = shinjuku.shinjuku10_gui },
		AerialStringIcon = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku14_gui, style = italic } or { fg = shinjuku.shinjuku14_gui },
		AerialStructIcon = { fg = shinjuku.shinjuku9_gui },
		AerialTypeParameterIcon = { fg = shinjuku.shinjuku10_gui },
		AerialVariableIcon = { fg = shinjuku.shinjuku4_gui, style = bold },

		AerialArray = { fg = shinjuku.shinjuku13_gui },
		AerialBoolean = { fg = shinjuku.shinjuku9_gui, style = bold },
		AerialClass = { fg = shinjuku.shinjuku9_gui },
		AerialConstant = { fg = shinjuku.shinjuku13_gui },
		AerialConstructor = { fg = shinjuku.shinjuku9_gui },
		AerialEnum = { fg = shinjuku.shinjuku9_gui },
		AerialEnumMember = { fg = shinjuku.shinjuku4_gui },
		AerialEvent = { fg = shinjuku.shinjuku9_gui },
		AerialField = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic } or { fg = shinjuku.shinjuku4_gui },
		AerialFile = { fg = shinjuku.shinjuku14_gui },
		AerialFunction = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku8_gui, style = italic } or { fg = shinjuku.shinjuku8_gui },
		AerialInterface = { fg = shinjuku.shinjuku9_gui },
		AerialKey = { fg = shinjuku.shinjuku9_gui },
		AerialMethod = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku7_gui, style = italic } or { fg = shinjuku.shinjuku7_gui },
		AerialModule = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic } or { fg = shinjuku.shinjuku4_gui },
		AerialNamespace = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic } or { fg = shinjuku.shinjuku4_gui },
		AerialNull = { fg = shinjuku.shinjuku9_gui },
		AerialNumber = { fg = shinjuku.shinjuku15_gui },
		AerialObject = { fg = shinjuku.shinjuku9_gui },
		AerialOperator = { fg = shinjuku.shinjuku9_gui },
		AerialPackage = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic } or { fg = shinjuku.shinjuku4_gui },
		AerialProperty = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku4_gui, style = italic } or { fg = shinjuku.shinjuku10_gui },
		AerialString = vim.g.shinjuku_italic and { fg = shinjuku.shinjuku14_gui, style = italic } or { fg = shinjuku.shinjuku14_gui },
		AerialStruct = { fg = shinjuku.shinjuku9_gui },
		AerialTypeParameter = { fg = shinjuku.shinjuku10_gui },
		AerialVariable = { fg = shinjuku.shinjuku4_gui, style = bold },

		-- nvim-navic
		NavicIconsArray = { fg = shinjuku.shinjuku13_gui },
		NavicIconsBoolean = { fg = shinjuku.shinjuku9_gui, style = bold },
		NavicIconsClass = { fg = shinjuku.shinjuku9_gui },
		NavicIconsConstant = { fg = shinjuku.shinjuku13_gui },
		NavicIconsConstructor = { fg = shinjuku.shinjuku9_gui },
		NavicIconsEnum = { fg = shinjuku.shinjuku9_gui },
		NavicIconsEnumMember = { fg = shinjuku.shinjuku4_gui },
		NavicIconsEvent = { fg = shinjuku.shinjuku9_gui },
		NavicIconsField = { fg = shinjuku.shinjuku4_gui, style = italic },
		NavicIconsFile = { fg = shinjuku.shinjuku14_gui },
		NavicIconsFunction = { fg = shinjuku.shinjuku8_gui, style = italic },
		NavicIconsInterface = { fg = shinjuku.shinjuku9_gui },
		NavicIconsKey = { fg = shinjuku.shinjuku9_gui },
		NavicIconsMethod = { fg = shinjuku.shinjuku7_gui, style = italic },
		NavicIconsModule = { fg = shinjuku.shinjuku4_gui, style = italic },
		NavicIconsNamespace = { fg = shinjuku.shinjuku4_gui, style = italic },
		NavicIconsNull = { fg = shinjuku.shinjuku9_gui },
		NavicIconsNumber = { fg = shinjuku.shinjuku15_gui },
		NavicIconsObject = { fg = shinjuku.shinjuku9_gui },
		NavicIconsOperator = { fg = shinjuku.shinjuku9_gui },
		NavicIconsPackage = { fg = shinjuku.shinjuku4_gui, style = italic },
		NavicIconsProperty = { fg = shinjuku.shinjuku4_gui, style = italic },
		NavicIconsString = { fg = shinjuku.shinjuku14_gui, style = italic },
		NavicIconsStruct = { fg = shinjuku.shinjuku9_gui },
		NavicIconsTypeParameter = { fg = shinjuku.shinjuku10_gui },
		NavicIconsVariable = { fg = shinjuku.shinjuku4_gui, style = bold },
		NavicText = { fg = shinjuku.shinjuku4_gui },
		NavicSeparator = { fg = shinjuku.shinjuku4_gui },
	}
	-- Options:

	-- Disable nvim-tree background
	if vim.g.shinjuku_disable_background then
		plugins.NvimTreeNormal = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none }
	else
		plugins.NvimTreeNormal = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.sidebar }
	end

	if vim.g.shinjuku_enable_sidebar_background then
		plugins.NvimTreeNormal = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.sidebar }
	else
		plugins.NvimTreeNormal = { fg = shinjuku.shinjuku4_gui, bg = shinjuku.none }
	end

	return plugins
end

return theme
