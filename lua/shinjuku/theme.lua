local colors = require("shinjuku.colors")

local theme = {}

local italic = vim.g.shinjuku_italic == false and colors.none or "italic"
local italic_undercurl = vim.g.shinjuku_italic == false and "undercurl" or "italic,undercurl"
local bold = vim.g.shinjuku_bold == false and colors.none or "bold"
local reverse_bold = vim.g.shinjuku_bold == false and "reverse" or "reverse,bold"
local bold_underline = vim.g.shinjuku_bold == false and "underline" or "bold,underline"
local bold_italic;
if vim.g.shinjuku_bold == false then
	bold_italic = vim.g.shinjuku_italic == false and colors.none or "italic"
elseif vim.g.shinjuku_italic == false then
	bold_italic = "bold"
else
	bold_italic = "bold,italic"
end

theme.loadSyntax = function()
	-- Syntax highlight groups
	return {
		Type = { fg = colors.shinjuku9_gui }, -- int, long, char, etc.
		StorageClass = { fg = colors.shinjuku13_gui }, -- static, register, volatile, etc.
		Structure = { fg = colors.shinjuku13_gui }, -- struct, union, enum, etc.
		Constant = { fg = colors.shinjuku4_gui }, -- any constant
		Character = { fg = colors.shinjuku11_gui }, -- any character constant: 'c', '\n'
		Number = { fg = colors.shinjuku13_gui }, -- a number constant: 5
		Boolean = { fg = colors.shinjuku13_gui }, -- a boolean constant: TRUE, false
		Float = { fg = colors.shinjuku13_gui }, -- a floating point constant: 2.3e10
		Statement = { fg = colors.shinjuku9_gui }, -- any statement
		Label = { fg = colors.shinjuku9_gui }, -- case, default, etc.
		Operator = { fg = colors.shinjuku9_gui }, -- sizeof", "+", "*", etc.
		Exception = { fg = colors.shinjuku9_gui }, -- try, catch, throw
		PreProc = { fg = colors.shinjuku9_gui }, -- generic Preprocessor
		Include = { fg = colors.shinjuku9_gui }, -- preprocessor #include
		Define = { fg = colors.shinjuku9_gui }, -- preprocessor #define
		Macro = { fg = colors.shinjuku9_gui }, -- same as Define
		Typedef = { fg = colors.shinjuku9_gui }, -- A typedef
		PreCondit = { fg = colors.shinjuku13_gui }, -- preprocessor #if, #else, #endif, etc.
		Special = { fg = colors.shinjuku4_gui }, -- any special symbol
		SpecialChar = { fg = colors.shinjuku13_gui }, -- special character in a constant
		Tag = { fg = colors.shinjuku4_gui }, -- you can use CTRL-] on this
		Delimiter = { fg = colors.shinjuku6_gui }, -- character that needs attention like , or .
		SpecialComment = { fg = colors.shinjuku8_gui }, -- special things inside a comment
		Debug = { fg = colors.shinjuku11_gui }, -- debugging statements
		Underlined = { fg = colors.shinjuku14_gui, bg = colors.none, style = "underline" }, -- text that stands out, HTML links
		Ignore = { fg = colors.shinjuku1_gui }, -- left blank, hidden
		Todo = { fg = colors.shinjuku13_gui, bg = colors.none, style = bold_italic }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Conceal = { fg = colors.none, bg = colors.background },
		htmlLink = { fg = colors.shinjuku14_gui, style = "underline" },
		markdownH1Delimiter = { fg = colors.shinjuku8_gui },
		markdownH2Delimiter = { fg = colors.shinjuku11_gui },
		markdownH3Delimiter = { fg = colors.shinjuku14_gui },
		htmlH1 = { fg = colors.shinjuku8_gui, style = bold },
		htmlH2 = { fg = colors.shinjuku11_gui, style = bold },
		htmlH3 = { fg = colors.shinjuku14_gui, style = bold },
		htmlH4 = { fg = colors.shinjuku15_gui, style = bold },
		htmlH5 = { fg = colors.shinjuku9_gui, style = bold },
		markdownH1 = { fg = colors.shinjuku8_gui, style = bold },
		markdownH2 = { fg = colors.shinjuku11_gui, style = bold },
		markdownH3 = { fg = colors.shinjuku14_gui, style = bold },
		Error = { fg = colors.shinjuku_error, bg = colors.none, style = bold_underline }, -- any erroneous construct with bold
		Comment = { fg = colors.shinjuku3_gui_bright, style = italic }, -- italic comments
		Conditional = { fg = colors.shinjuku9_gui, style = italic }, -- italic if, then, else, endif, switch, etc.
		Function = { fg = colors.shinjuku8_gui, style = italic }, -- italic funtion names
		Identifier = { fg = colors.shinjuku9_gui, style = italic }, -- any variable name
		Keyword = { fg = colors.shinjuku9_gui, style = italic }, -- italic for, do, while, etc.
		Repeat = { fg = colors.shinjuku9_gui, style = italic }, -- italic any other keyword
		String = { fg = colors.shinjuku11_gui, style = italic }, -- any string
	}
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {
		NormalFloat = { fg = colors.shinjuku4_gui, bg = colors.float }, -- normal text and background color
		FloatBorder = { fg = colors.shinjuku4_gui, bg = colors.float }, -- normal text and background color
		ColorColumn = { fg = colors.none, bg = colors.shinjuku1_gui }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = colors.shinjuku1_gui }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = colors.shinjuku4_gui, bg = colors.none, style = "reverse" }, -- the character under the cursor
		CursorIM = { fg = colors.text, bg = colors.none, style = "reverse" }, -- like Cursor, but used when in IME mode
		Directory = { fg = colors.shinjuku7_gui, bg = colors.none }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = colors.shinjuku1_gui },
		ErrorMsg = { fg = colors.none },
		Folded = { fg = colors.shinjuku3_gui_bright, bg = colors.none, style = italic },
		FoldColumn = { fg = colors.shinjuku7_gui },
		IncSearch = { fg = colors.background, bg = colors.shinjuku14_gui },
		LineNr = { fg = colors.shinjuku3_gui_bright },
		CursorLineNr = { fg = colors.cursorlinefg, bg = colors.cursorlinebg },
		MatchParen = { fg = colors.background, bg = colors.shinjuku15_gui, style = bold },
		ModeMsg = { fg = colors.shinjuku4_gui },
		MoreMsg = { fg = colors.shinjuku4_gui },
		NonText = { fg = colors.shinjuku1_gui },
		Pmenu = { fg = colors.background, bg = colors.special },
		PmenuSel = { fg = colors.background, bg = colors.shinjuku11_gui },
		PmenuSbar = { fg = colors.shinjuku4_gui, bg = colors.background },
		PmenuThumb = { fg = colors.shinjuku4_gui, bg = colors.shinjuku14_gui },
		Question = { fg = colors.shinjuku14_gui },
		QuickFixLine = { fg = colors.shinjuku4_gui, bg = colors.none, style = "reverse" },
		qfLineNr = { fg = colors.shinjuku4_gui, bg = colors.none, style = "reverse" },
		Search = { fg = colors.background, bg = colors.shinjuku14_gui },
		Substitute = { fg = colors.background, bg = colors.shinjuku12_gui },
		SpecialKey = { fg = colors.shinjuku9_gui },
		SpellBad = { fg = colors.shinjuku11_gui, bg = colors.none, style = italic_undercurl },
		SpellCap = { fg = colors.shinjuku7_gui, bg = colors.none, style = italic_undercurl },
		SpellLocal = { fg = colors.shinjuku8_gui, bg = colors.none, style = italic_undercurl },
		SpellRare = { fg = colors.shinjuku9_gui, bg = colors.none, style = italic_undercurl },
		StatusLine = { fg = colors.shinjuku4_gui, bg = colors.shinjuku2_gui },
		StatusLineNC = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui },
		StatusLineTerm = { fg = colors.shinjuku4_gui, bg = colors.shinjuku2_gui },
		StatusLineTermNC = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui },
		TabLineFill = { fg = colors.shinjuku4_gui, bg = colors.none },
		TablineSel = { fg = colors.shinjuku1_gui, bg = colors.shinjuku9_gui },
		Tabline = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui },
		Title = { fg = colors.shinjuku14_gui, bg = colors.none, style = bold },
		Visual = { fg = colors.background, bg = colors.shinjuku15_gui },
		VisualNOS = { fg = colors.none, bg = colors.shinjuku2_gui },
		WarningMsg = { fg = colors.shinjuku15_gui },
		WildMenu = { fg = colors.shinjuku12_gui, bg = colors.none, style = bold },
		CursorColumn  = { fg = colors.cursorlinefg, bg = colors.cursorlinebg },
		CursorLine = { fg = colors.cursorlinefg, bg = colors.cursorlinebg },
		ToolbarLine = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui },
		ToolbarButton = { fg = colors.shinjuku4_gui, bg = colors.none, style = bold },
		NormalMode = { fg = colors.shinjuku15_gui, bg = colors.none, style = "reverse" },
		InsertMode = { fg = colors.shinjuku14_gui, bg = colors.none, style = "reverse" },
		ReplacelMode = { fg = colors.shinjuku12_gui, bg = colors.none, style = "reverse" },
		VisualMode = { fg = colors.shinjuku11_gui, bg = colors.none, style = "reverse" },
		CommandMode = { fg = colors.shinjuku4_gui, bg = colors.none, style = "reverse" },
		Warnings = { fg = colors.shinjuku15_gui },

		healthError = { fg = colors.shinjuku11_gui },
		healthSuccess = { fg = colors.shinjuku14_gui },
		healthWarning = { fg = colors.shinjuku15_gui },

		-- dashboard
		DashboardShortCut = { fg = colors.shinjuku7_gui },
		DashboardHeader = { fg = colors.shinjuku9_gui },
		DashboardCenter = { fg = colors.shinjuku8_gui },
		DashboardFooter = { fg = colors.shinjuku14_gui, style = italic },

		-- Barbar
		BufferTabpageFill = { bg = colors.background },

		BufferCurrent = { bg = colors.shinjuku1_gui },
		BufferCurrentMod = { bg = colors.shinjuku1_gui, fg = colors.shinjuku15_gui },
		BufferCurrentIcon = { bg = colors.shinjuku1_gui },
		BufferCurrentSign = { bg = colors.shinjuku1_gui },
		BufferCurrentIndex = { bg = colors.shinjuku1_gui },
		BufferCurrentTarget = { bg = colors.shinjuku1_gui, fg = colors.shinjuku11_gui },

		BufferInactive = { bg = colors.background, fg = colors.shinjuku3_gui },
		BufferInactiveMod = { bg = colors.background, fg = colors.shinjuku15_gui },
		BufferInactiveIcon = { bg = colors.background, fg = colors.shinjuku3_gui },
		BufferInactiveSign = { bg = colors.background, fg = colors.shinjuku3_gui },
		BufferInactiveIndex = { bg = colors.background, fg = colors.shinjuku3_gui },
		BufferInactiveTarget = { bg = colors.background, fg = colors.shinjuku11_gui },

		BufferVisible = { bg = colors.shinjuku2_gui },
		BufferVisibleMod = { bg = colors.shinjuku2_gui, fg = colors.shinjuku15_gui },
		BufferVisibleIcon = { bg = colors.shinjuku2_gui },
		BufferVisibleSign = { bg = colors.shinjuku2_gui },
		BufferVisibleIndex = { bg = colors.shinjuku2_gui },
		BufferVisibleTarget = { bg = colors.shinjuku2_gui, fg = colors.shinjuku11_gui },

		-- nvim-notify
		NotifyDEBUGBorder = { fg = colors.shinjuku3_gui },
		NotifyDEBUGIcon = { fg = colors.shinjuku3_gui },
		NotifyDEBUGTitle = { fg = colors.shinjuku3_gui },
		NotifyERRORBorder = { fg = colors.shinjuku11_gui },
		NotifyERRORIcon = { fg = colors.shinjuku11_gui },
		NotifyERRORTitle = { fg = colors.shinjuku11_gui },
		NotifyINFOBorder = { fg = colors.shinjuku14_gui },
		NotifyINFOIcon = { fg = colors.shinjuku14_gui },
		NotifyINFOTitle = { fg = colors.shinjuku14_gui },
		NotifyTRACEBorder = { fg = colors.shinjuku15_gui },
		NotifyTRACEIcon = { fg = colors.shinjuku15_gui },
		NotifyTRACETitle = { fg = colors.shinjuku15_gui },
		NotifyWARNBorder = { fg = colors.shinjuku13_gui },
		NotifyWARNIcon = { fg = colors.shinjuku13_gui },
		NotifyWARNTitle = { fg = colors.shinjuku13_gui },

		-- leap.nvim
		LeapMatch = { style = "underline,nocombine", fg = colors.shinjuku13_gui },
		LeapLabelPrimary = { style = "nocombine", fg = colors.background, bg = colors.shinjuku13_gui },
		LeapLabelSecondary = { style = "nocombine", fg = colors.background, bg = colors.shinjuku15_gui },
	}

	-- Options:

	--Set transparent background
	if vim.g.shinjuku_disable_background then
		editor.Normal = { fg = colors.shinjuku4_gui, bg = colors.none } -- normal text and background color
		editor.SignColumn = { fg = colors.shinjuku4_gui, bg = colors.none }
	else
		editor.Normal = { fg = colors.shinjuku4_gui, bg = colors.background } -- normal text and background color
		editor.SignColumn = { fg = colors.shinjuku4_gui, bg = colors.background }
	end

	-- Remove window split borders
	if vim.g.shinjuku_borders then
		editor.VertSplit = { fg = colors.shinjuku2_gui }
	else
		editor.VertSplit = { fg = colors.background }
	end

	if vim.g.shinjuku_uniform_diff_background then
		editor.DiffAdd = { fg = colors.shinjuku14_gui, bg = colors.shinjuku1_gui } -- diff mode: Added line
		editor.DiffChange = { fg = colors.shinjuku13_gui, bg = colors.shinjuku1_gui } -- diff mode: Changed line
		editor.DiffDelete = { fg = colors.shinjuku11_gui, bg = colors.shinjuku1_gui } -- diff mode: Deleted line
		editor.DiffText = { fg = colors.shinjuku15_gui, bg = colors.shinjuku1_gui } -- diff mode: Changed text within a changed line
	else
		editor.DiffAdd = { fg = colors.shinjuku14_gui, bg = colors.none, style = "reverse" } -- diff mode: Added line
		editor.DiffChange = { fg = colors.shinjuku13_gui, bg = colors.none, style = "reverse" } -- diff mode: Changed line
		editor.DiffDelete = { fg = colors.shinjuku11_gui, bg = colors.none, style = "reverse" } -- diff mode: Deleted line
		editor.DiffText = { fg = colors.shinjuku15_gui, bg = colors.none, style = "reverse" } -- diff mode: Changed text within a changed line
	end

	return editor
end

theme.loadTerminal = function()
	-- vim.g.terminal_color_0 = colors.shinjuku1_gui
	-- vim.g.terminal_color_1 = colors.shinjuku11_gui
	-- vim.g.terminal_color_2 = colors.shinjuku14_gui
	-- vim.g.terminal_color_3 = colors.shinjuku13_gui
	-- vim.g.terminal_color_4 = colors.shinjuku9_gui
	-- vim.g.terminal_color_5 = colors.shinjuku15_gui
	-- vim.g.terminal_color_6 = colors.shinjuku8_gui
	-- vim.g.terminal_color_7 = colors.text
	-- vim.g.terminal_color_8 = colors.shinjuku3_gui
	-- vim.g.terminal_color_9 = colors.shinjuku11_gui
	-- vim.g.terminal_color_10 = colors.shinjuku14_gui
	-- vim.g.terminal_color_11 = colors.shinjuku13_gui
	-- vim.g.terminal_color_12 = colors.shinjuku9_gui
	-- vim.g.terminal_color_13 = colors.shinjuku15_gui
	-- vim.g.terminal_color_14 = colors.shinjuku7_gui
	-- vim.g.terminal_color_15 = colors.shinjuku6_gui
end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		TSConstructor = { fg = colors.shinjuku9_gui }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		TSConstant = { fg = colors.shinjuku13_gui }, -- For constants
		TSFloat = { fg = colors.shinjuku13_gui }, -- For floats
		TSNumber = { fg = colors.shinjuku13_gui }, -- For all number
		TSAttribute = { fg = colors.shinjuku15_gui }, -- (unstable) TODO: docs
		TSError = { fg = colors.shinjuku_error }, -- For syntax/parser errors.
		TSException = { fg = colors.shinjuku15_gui }, -- For exception related keywords.
		TSFuncMacro = { fg = colors.shinjuku7_gui }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = colors.shinjuku9_gui }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSLabel = { fg = colors.shinjuku15_gui }, -- For labels: `label:` in C and `:label:` in Lua.
		TSOperator = { fg = colors.shinjuku9_gui }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = colors.shinjuku10_gui }, -- For parameters of a function.
		TSParameterReference = { fg = colors.shinjuku10_gui }, -- For references to parameters of a function.
		TSPunctDelimiter = { fg = colors.shinjuku8_gui }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = colors.shinjuku_bracket }, -- For brackets and parens.
		TSPunctSpecial = { fg = colors.shinjuku8_gui }, -- For special punctutation that does not fall in the catagories before.
		TSSymbol = { fg = colors.shinjuku13_gui }, -- For identifiers referring to symbols or atoms.
		TSType = { fg = colors.shinjuku9_gui }, -- For types.
		TSTypeBuiltin = { fg = colors.shinjuku9_gui }, -- For builtin types.
		TSTag = { fg = colors.shinjuku4_gui }, -- Tags like html tag names.
		TSTagDelimiter = { fg = colors.shinjuku2_gui }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = colors.shinjuku4_gui }, -- For strings consideshinjuku11_gui text in a markup language.
		TSTextReference = { fg = colors.shinjuku15_gui }, -- FIXME
		TSEmphasis = { fg = colors.shinjuku10_gui }, -- For text to be represented with emphasis.
		TSUnderline = { fg = colors.shinjuku4_gui, bg = colors.none, style = "underline" }, -- For text to be represented with an underline.
		TSLiteral = { fg = colors.shinjuku13_gui }, -- Literal text.
		TSURI = { fg = colors.shinjuku14_gui }, -- Any URI like a link or email.
		TSAnnotation = { fg = colors.shinjuku11_gui }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		["@constructor"] = { fg = colors.shinjuku9_gui },
		["@constant"] = { fg = colors.shinjuku13_gui },
		["@float"] = { fg = colors.shinjuku13_gui },
		["@number"] = { fg = colors.shinjuku13_gui },
		["@attribute"] = { fg = colors.shinjuku15_gui },
		["@error"] = { fg = colors.shinjuku_error },
		["@exception"] = { fg = colors.shinjuku15_gui },
		["@funtion.macro"] = { fg = colors.shinjuku7_gui },
		["@include"] = { fg = colors.shinjuku9_gui },
		["@label"] = { fg = colors.shinjuku15_gui },
		["@operator"] = { fg = colors.shinjuku9_gui },
		["@parameter"] = { fg = colors.shinjuku10_gui },
		["@punctuation.delimiter"] = { fg = colors.shinjuku8_gui },
		["@punctuation.bracket"] = { fg = colors.shinjuku_bracket },
		["@punctuation.special"] = { fg = colors.shinjuku8_gui },
		["@symbol"] = { fg = colors.shinjuku13_gui },
		["@type"] = { fg = colors.shinjuku9_gui },
		["@type.builtin"] = { fg = colors.shinjuku9_gui },
		["@tag"] = { fg = colors.shinjuku4_gui },
		["@tag.delimiter"] = { fg = colors.shinjuku2_gui },
		["@text"] = { fg = colors.shinjuku4_gui },
		["@text.reference"] = { fg = colors.shinjuku15_gui, style = bold },
		["@text.emphasis"] = { fg = colors.shinjuku10_gui, style = italic },
		["@text.underline"] = { fg = colors.shinjuku4_gui, bg = colors.none, style = "underline" },
		["@text.literal"] = { fg = colors.shinjuku13_gui },
		["@text.uri"] = { fg = colors.shinjuku12_gui, style = "underline" },
		["@text.strike"] = { fg = colors.shinjuku4_gui, style = "strikethrough" },
		["@text.math"] = { fg = colors.shinjuku7_gui },

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

	treesitter.TSVariableBuiltin = { fg = colors.shinjuku4_gui, style = bold }
	treesitter.TSBoolean = { fg = colors.shinjuku13_gui, style = bold }
	treesitter.TSConstBuiltin = { fg = colors.shinjuku13_gui, style = bold }
	treesitter.TSConstMacro = { fg = colors.shinjuku7_gui, style = bold }
	treesitter.TSVariable = { fg = colors.shinjuku4_gui, style = bold }
	treesitter.TSTitle = { fg = colors.shinjuku10_gui, bg = colors.none, style = bold }
	treesitter["@variable"] = { fg = colors.shinjuku4_gui, style = bold }
	treesitter["@variable.builtin"] = { fg = colors.shinjuku4_gui, style = bold }
	treesitter["@variable.global"] = { fg = colors.shinjuku4_gui, style = bold }
	treesitter["@boolean"] = { fg = colors.shinjuku13_gui, style = bold }
	treesitter["@constant.builtin"] = { fg = colors.shinjuku13_gui, style = bold }
	treesitter["@constant.macro"] = { fg = colors.shinjuku7_gui, style = bold }
	treesitter["@text.title"] = { fg = colors.shinjuku10_gui, bg = colors.none, style = bold }
	treesitter["@text.strong"] = { fg = colors.shinjuku10_gui, bg = colors.none, style = bold }
	-- Comments
	treesitter.TSComment = { fg = colors.shinjuku3_gui_bright, style = italic }
	-- Conditionals
	treesitter.TSConditional = { fg = colors.shinjuku9_gui, style = italic } -- For keywords related to conditionnals.
	-- Function names
	treesitter.TSFunction = { fg = colors.shinjuku8_gui, style = italic } -- For fuction (calls and definitions).
	treesitter.TSMethod = { fg = colors.shinjuku7_gui, style = italic } -- For method calls and definitions.
	treesitter.TSFuncBuiltin = { fg = colors.shinjuku8_gui, style = italic }
	-- Namespaces and property accessors
	treesitter.TSNamespace = { fg = colors.shinjuku4_gui, style = italic } -- For identifiers referring to modules and namespaces.
	treesitter.TSField = { fg = colors.shinjuku4_gui, style = italic } -- For fields.
	treesitter.TSProperty = { fg = colors.shinjuku10_gui, style = italic } -- Same as `TSField`, but when accessing, not declaring.
	-- Language keywords
	treesitter.TSKeyword = { fg = colors.shinjuku9_gui, style = italic } -- For keywords that don't fall in other categories.
	treesitter.TSKeywordFunction = { fg = colors.shinjuku8_gui, style = italic }
	treesitter.TSKeywordReturn = { fg = colors.shinjuku14_gui, style = italic }
	treesitter.TSKeywordOperator = { fg = colors.shinjuku8_gui, style = italic }
	treesitter.TSRepeat = { fg = colors.shinjuku9_gui, style = italic } -- For keywords related to loops.
	-- Strings
	treesitter.TSString = { fg = colors.shinjuku11_gui, style = italic } -- For strings.
	treesitter.TSStringRegex = { fg = colors.shinjuku11_gui, style = italic } -- For regexes.
	treesitter.TSStringEscape = { fg = colors.shinjuku13_gui, style = italic } -- For escape characters within a string.
	treesitter.TSCharacter = { fg = colors.shinjuku11_gui, style = italic } -- For characters.

	treesitter["@comment"] = { fg = colors.shinjuku3_gui_bright, style = italic }
	treesitter["@conditional"] = { fg = colors.shinjuku9_gui, style = italic }
	treesitter["@function"] = { fg = colors.shinjuku8_gui, style = italic }
	treesitter["@method"] = { fg = colors.shinjuku8_gui, style = italic }
	treesitter["@function.builtin"] = { fg = colors.shinjuku8_gui, style = italic }
	treesitter["@namespace"] = { fg = colors.shinjuku4_gui, style = italic }
	treesitter["@field"] = { fg = colors.shinjuku4_gui, style = italic }
	treesitter["@property"] = { fg = colors.shinjuku10_gui, style = italic }
	treesitter["@keyword"] = { fg = colors.shinjuku9_gui, style = italic }
	treesitter["@keyword.function"] = { fg = colors.shinjuku8_gui, style = italic }
	treesitter["@keyword.return"] = { fg = colors.shinjuku8_gui, style = italic }
	treesitter["@keyword.operator"] = { fg = colors.shinjuku8_gui, style = italic }
	treesitter["@repeat"] = { fg = colors.shinjuku9_gui, style = italic }
	treesitter["@string"] = { fg = colors.shinjuku11_gui, style = italic }
	treesitter["@string.regex"] = { fg = colors.shinjuku11_gui, style = italic }
	treesitter["@string.escape"] = { fg = colors.shinjuku13_gui, style = italic }
	treesitter["@character"] = { fg = colors.shinjuku11_gui, style = italic }

	return treesitter
end

theme.loadFiletypes = function()
	-- Filetype-specific highlight groups

	local ft = {
		-- yaml
		yamlBlockMappingKey = { fg = colors.shinjuku7_gui },
		yamlBool = { link = "Boolean" },
		yamlDocumentStart = { link = "Keyword" },
		yamlTSField = { fg = colors.shinjuku7_gui },
		yamlTSString = { fg = colors.shinjuku4_gui },
		yamlTSPunctSpecial = { link = "Keyword" },
		yamlKey = { fg = colors.shinjuku7_gui }, -- stephpy/vim-yaml
	}

	return ft
end

theme.loadLSP = function()
	-- Lsp highlight groups

	local lsp = {
		LspDiagnosticsDefaultError = { fg = colors.shinjuku_error }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = colors.background, bg = colors.shinjuku_error }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = colors.shinjuku11_gui }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = colors.shinjuku11_gui }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = colors.shinjuku11_gui }, -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning = { fg = colors.shinjuku15_gui }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = colors.shinjuku15_gui }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = colors.shinjuku15_gui }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = colors.shinjuku15_gui }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = colors.shinjuku15_gui }, -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation = { fg = colors.shinjuku10_gui }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = colors.shinjuku10_gui }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = colors.shinjuku10_gui }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = colors.shinjuku10_gui }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = colors.shinjuku10_gui }, -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint = { fg = colors.shinjuku9_gui }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = colors.shinjuku9_gui }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = colors.shinjuku9_gui }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = colors.shinjuku9_gui }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = colors.shinjuku10_gui }, -- used to underline "Hint" diagnostics.
		LspReferenceText = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui }, -- used for highlighting "text" references
		LspReferenceRead = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui }, -- used for highlighting "read" references
		LspReferenceWrite = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui }, -- used for highlighting "write" references

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
		LspTroubleText = { fg = colors.shinjuku4_gui },
		LspTroubleCount = { fg = colors.shinjuku9_gui, bg = colors.shinjuku10_gui },
		LspTroubleNormal = { fg = colors.shinjuku4_gui, bg = colors.sidebar },

		-- Diff
		diffAdded = { fg = colors.shinjuku14_gui },
		diffRemoved = { fg = colors.shinjuku11_gui },
		diffChanged = { fg = colors.shinjuku15_gui },
		diffOldFile = { fg = colors.yellow },
		diffNewFile = { fg = colors.shinjuku12_gui },
		diffFile = { fg = colors.shinjuku7_gui },
		diffLine = { fg = colors.shinjuku3_gui },
		diffIndexLine = { fg = colors.shinjuku9_gui },

		-- Neogit
		NeogitBranch = { fg = colors.shinjuku10_gui },
		NeogitRemote = { fg = colors.shinjuku9_gui },
		NeogitHunkHeader = { fg = colors.shinjuku8_gui },
		NeogitHunkHeaderHighlight = { fg = colors.shinjuku8_gui, bg = colors.shinjuku1_gui },
		NeogitDiffContextHighlight = { bg = colors.shinjuku1_gui },
		NeogitDiffDeleteHighlight = { fg = colors.shinjuku11_gui, style = "reverse" },
		NeogitDiffAddHighlight = { fg = colors.shinjuku14_gui, style = "reverse" },

		-- GitGutter
		GitGutterAdd = { fg = colors.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = colors.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = colors.shinjuku11_gui }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd = { fg = colors.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr = { fg = colors.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn = { fg = colors.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = colors.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr = { fg = colors.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn = { fg = colors.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = colors.shinjuku11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr = { fg = colors.shinjuku11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn = { fg = colors.shinjuku11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsCurrentLineBlame = { fg = colors.shinjuku3_gui_bright, style = bold },

		-- Telescope
		TelescopePromptBorder = { fg = colors.shinjuku4_gui },
		TelescopeResultsBorder = { fg = colors.shinjuku4_gui },
		TelescopePreviewBorder = { fg = colors.shinjuku4_gui },
		TelescopeSelectionCaret = { fg = colors.shinjuku9_gui },
		TelescopeSelection = { fg = colors.background, bg = colors.shinjuku15_gui },
		TelescopeMatching = { link = 'Search' },

		-- NvimTree
		NvimTreeRootFolder = { fg = colors.shinjuku15_gui },
		NvimTreeSymlink = { fg = colors.text },
		NvimTreeFolderName = { fg = colors.shinjuku4_gui },
		NvimTreeFolderIcon = { fg = colors.shinjuku9_gui },
		NvimTreeEmptyFolderName = { fg = colors.shinjuku4_gui },
		NvimTreeOpenedFolderName = { fg = colors.text },
		NvimTreeExecFile = { fg = colors.shinjuku4_gui },
		NvimTreeOpenedFile = { fg = colors.shinjuku6_gui },
		NvimTreeSpecialFile = { fg = colors.shinjuku4_gui, style = bold},
		NvimTreeImageFile = { fg = colors.shinjuku4_gui },
		NvimTreeMarkdownFile = { fg = colors.shinjuku4_gui },
		NvimTreeIndentMarker = { fg = colors.shinjuku9_gui },
		NvimTreeGitDirty = { fg = colors.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitStaged = { fg = colors.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitMerge = { fg = colors.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitRenamed = { fg = colors.shinjuku13_gui }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitNew = { fg = colors.shinjuku14_gui }, -- diff mode: Added line |diff.txt|
		NvimTreeGitDeleted = { fg = colors.shinjuku11_gui },	-- diff mode: Deleted line |diff.txt|
		NvimTreeGitIgnored = { fg = colors.shinjuku3_gui_bright },
		LspDiagnosticsError = { fg = colors.shinjuku12_gui },
		LspDiagnosticsWarning = { fg = colors.shinjuku15_gui },
		LspDiagnosticsInformation = { fg = colors.shinjuku10_gui },
		LspDiagnosticsHint = { fg = colors.shinjuku9_gui },

		-- WhichKey
		WhichKey = { fg = colors.shinjuku8_gui, style = bold },
		WhichKeyGroup = { fg = colors.text },
		WhichKeyDesc = { fg = colors.shinjuku7_gui, style = italic },
		WhichKeySeperator = { fg = colors.shinjuku9_gui },
		WhichKeyFloating = { bg = colors.shinjuku1_gui },
		WhichKeyFloat = { bg = colors.shinjuku1_gui },
		WhichKeyValue = { fg = colors.shinjuku7_gui },

		-- LspSaga
		DiagnosticError = { fg = colors.shinjuku12_gui },
		DiagnosticWarning = { fg = colors.shinjuku15_gui },
		DiagnosticInformation = { fg = colors.shinjuku10_gui },
		DiagnosticHint = { fg = colors.shinjuku9_gui },
		DiagnosticTruncateLine = { fg = colors.shinjuku4_gui },
		LspFloatWinBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		LspSagaDefPreviewBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		DefinitionIcon = { fg = colors.shinjuku7_gui },
		TargetWord = { fg = colors.shinjuku6_gui, style = 'bold' },
		-- LspSaga code action
		LspSagaCodeActionTitle = { link = 'Title' },
		LspSagaCodeActionBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		LspSagaCodeActionTrunCateLine = { link = 'LspSagaCodeActionBorder' },
		LspSagaCodeActionContent = { fg = colors.shinjuku4_gui },
		-- LspSag finder
		LspSagaLspFinderBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		LspSagaAutoPreview = { fg = colors.shinjuku4_gui },
		LspSagaFinderSelection = { fg = colors.shinjuku6_gui, bg = colors.shinjuku2_gui },
		TargetFileName = { fg = colors.shinjuku4_gui },
		FinderParam = { fg = colors.shinjuku15_gui, bold = true },
		FinderVirtText = { fg = colors.shinjuku15_gui15 , bg = colors.none },
		DefinitionsIcon = { fg = colors.shinjuku9_gui },
		Definitions = { fg = colors.shinjuku15_gui, bold = true },
		DefinitionCount = { fg = colors.shinjuku10_gui },
		ReferencesIcon = { fg = colors.shinjuku9_gui },
		References = { fg = colors.shinjuku15_gui, bold = true },
		ReferencesCount = { fg = colors.shinjuku10_gui },
		ImplementsIcon = { fg = colors.shinjuku9_gui },
		Implements = { fg = colors.shinjuku15_gui, bold = true },
		ImplementsCount = { fg = colors.shinjuku10_gui },
		-- LspSaga finder spinner
		FinderSpinnerBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		FinderSpinnerTitle = { link = 'Title' },
		FinderSpinner = { fg = colors.shinjuku8_gui, bold = true },
		FinderPreviewSearch = { link = 'Search' },
		-- LspSaga definition
		DefinitionBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		DefinitionArrow = { fg = colors.shinjuku8_gui },
		DefinitionSearch = { link = 'Search' },
		DefinitionFile = { fg = colors.shinjuku4_gui, bg = colors.float },
		-- LspSaga hover
		LspSagaHoverBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		LspSagaHoverTrunCateLine = { link = 'LspSagaHoverBorder' },
		-- Lsp rename
		LspSagaRenameBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		LspSagaRenameMatch = { fg = colors.shinjuku6_gui, bg = colors.shinjuku9_gui },
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
		LspSagaDiagnosticBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		LspSagaDiagnosticHeader = { fg = colors.shinjuku4_gui },
		DiagnosticQuickFix = { fg = colors.shinjuku14_gui, bold = true },
		DiagnosticMap = { fg = colors.shinjuku15_gui },
		DiagnosticLineCol = { fg = colors.shinjuku4_gui },
		LspSagaDiagnosticTruncateLine = { link = 'LspSagaDiagnosticBorder' },
		ColInLineDiagnostic = { link = 'Comment' },
		-- LspSaga signture help
		LspSagaSignatureHelpBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		LspSagaShTrunCateLine = { link = 'LspSagaSignatureHelpBorder' },
		-- Lspsaga lightbulb
		LspSagaLightBulb = { link = 'DiagnosticSignHint' },
		-- LspSaga shadow
		SagaShadow = { fg = colors.black },
		-- LspSaga float
		LspSagaBorderTitle = { link = 'Title' },
		-- LspSaga Outline
		LSOutlinePreviewBorder = { fg = colors.shinjuku4_gui, bg = colors.float },
		OutlineIndentEvn = { fg = colors.shinjuku15_gui },
		OutlineIndentOdd = { fg = colors.shinjuku12_gui },
		OutlineFoldPrefix = { fg = colors.shinjuku11_gui },
		OutlineDetail = { fg = colors.shinjuku4_gui },
		-- LspSaga all floatwindow
		LspFloatWinNormal = { fg = colors.shinjuku4_gui, bg = colors.float },
		-- Saga End

		-- Sneak
		Sneak = { fg = colors.background, bg = colors.shinjuku4_gui },
		SneakScope = { bg = colors.shinjuku1_gui },

		-- Cmp
		CmpItemKind = { fg = colors.shinjuku15_gui },
		CmpItemAbbrMatch = { fg = colors.text, style = bold },
		CmpItemAbbrMatchFuzzy = { fg = colors.text, style = bold },
		CmpItemAbbr = { fg = colors.shinjuku4_gui },
		CmpItemMenu = { fg = colors.shinjuku14_gui },

		-- Indent Blankline
		IndentBlanklineIndentChar = { fg = colors.darkest },
		IndentBlanklineScopeChar = { fg = colors.highlight },

		-- headline
		-- bg = (10 * shinjuku0 + fg) / 11
		Headline1 = { fg = colors.shinjuku12_gui, bg = "#3d3c44", bold = true },
		Headline2 = { fg = colors.shinjuku13_gui, bg = "#3f4247", bold = true },
		Headline3 = { fg = colors.shinjuku14_gui, bg = "#394147", bold = true },
		Headline4 = { fg = colors.shinjuku9_gui, bg = "#363e4c", bold = true },
		Headline5 = { fg = colors.shinjuku15_gui, bg = "#3a3c4a", bold = true },
		Headline6 = { fg = colors.shinjuku4_gui, bg = "#3d434f", bold = true },

		Quote = { fg = colors.shinjuku2_gui },
		CodeBlock = { bg = colors.shinjuku1_gui },
		Dash = { colors.shinjuku10_gui, bold = true },

		-- Illuminate
		illuminatedWord = { bg = colors.shinjuku3_gui },
		illuminatedCurWord = { bg = colors.shinjuku3_gui },
		IlluminatedWordText = { bg = colors.shinjuku3_gui },
		IlluminatedWordRead = { bg = colors.shinjuku3_gui },
		IlluminatedWordWrite = { bg = colors.shinjuku3_gui },

		-- nvim-dap
		DapBreakpoint = { fg = colors.shinjuku14_gui },
		DapStopped = { fg = colors.shinjuku15_gui },

		-- nvim-dap-ui
		DapUIVariable = { fg = colors.shinjuku4_gui },
		DapUIScope = { fg = colors.shinjuku8_gui },
		DapUIType = { fg = colors.shinjuku9_gui },
		DapUIValue = { fg = colors.shinjuku4_gui },
		DapUIModifiedValue = { fg = colors.shinjuku8_gui },
		DapUIDecoration = { fg = colors.shinjuku8_gui },
		DapUIThread = { fg = colors.shinjuku8_gui },
		DapUIStoppedThread = { fg = colors.shinjuku8_gui },
		DapUIFrameName = { fg = colors.shinjuku4_gui },
		DapUISource = { fg = colors.shinjuku9_gui },
		DapUILineNumber = { fg = colors.shinjuku8_gui },
		DapUIFloatBorder = { fg = colors.shinjuku8_gui },
		DapUIWatchesEmpty = { fg = colors.shinjuku11_gui },
		DapUIWatchesValue = { fg = colors.shinjuku8_gui },
		DapUIWatchesError = { fg = colors.shinjuku11_gui },
		DapUIBreakpointsPath = { fg = colors.shinjuku8_gui },
		DapUIBreakpointsInfo = { fg = colors.shinjuku8_gui },
		DapUIBreakpointsCurrentLine = { fg = colors.shinjuku8_gui },
		DapUIBreakpointsLine = { fg = colors.shinjuku8_gui },

		-- Hop
		HopNextKey = { fg = colors.shinjuku4_gui, style = bold },
		HopNextKey1 = { fg = colors.shinjuku8_gui, style = bold },
		HopNextKey2 = { fg = colors.shinjuku4_gui },
		HopUnmatched = { fg = colors.shinjuku3_gui },

		-- Fern
		FernBranchText = { fg = colors.shinjuku3_gui_bright },

		-- nvim-ts-rainbow
		rainbowcol1 = { fg = colors.shinjuku15_gui },
		rainbowcol2 = { fg = colors.shinjuku13_gui },
		rainbowcol3 = { fg = colors.shinjuku11_gui },
		rainbowcol4 = { fg = colors.shinjuku7_gui },
		rainbowcol5 = { fg = colors.shinjuku8_gui },
		rainbowcol6 = { fg = colors.shinjuku15_gui },
		rainbowcol7 = { fg = colors.shinjuku13_gui },

		-- lightspeed
		LightspeedLabel = { fg = colors.shinjuku8_gui, style = bold },
		LightspeedLabelOverlapped = { fg = colors.shinjuku8_gui, style = "bold,underline" },
		LightspeedLabelDistant = { fg = colors.shinjuku15_gui, style = bold },
		LightspeedLabelDistantOverlapped = { fg = colors.shinjuku15_gui, style = "bold,underline" },
		LightspeedShortcut = { fg = colors.shinjuku10_gui, style = bold },
		LightspeedShortcutOverlapped = { fg = colors.shinjuku10_gui, style = "bold,underline" },
		LightspeedMaskedChar = { fg = colors.shinjuku4_gui, bg = colors.shinjuku2_gui, style = bold },
		LightspeedGreyWash = { fg = colors.shinjuku3_gui_bright },
		LightspeedUnlabeledMatch = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui },
		LightspeedOneCharMatch = { fg = colors.shinjuku8_gui, style = "bold,reverse" },
		LightspeedUniqueChar = { style = "bold,underline" },

		-- copilot
		CopilotLabel = { fg = colors.shinjuku3_gui, bg = colors.none },

		-- Statusline
		StatusLineDull = { fg = colors.shinjuku3_gui, bg = colors.shinjuku1_gui },
		StatusLineAccent = { fg = colors.background, bg = colors.shinjuku13_gui },

		-- mini.nvim
		MiniCompletionActiveParameter = { style = "underline" },

		MiniCursorword = { bg = colors.shinjuku3_gui },
		MiniCursorwordCurrent = { bg = colors.shinjuku3_gui },

		MiniIndentscopeSymbol = { fg = colors.shinjuku10_gui },
		MiniIndentscopePrefix = { style = "nocombine" }, -- Make it invisible

		MiniJump = { fg = colors.background, bg = colors.shinjuku4_gui },

		MiniJump2dSpot = { fg = colors.shinjuku12_gui, style = "bold,nocombine" },

		MiniStarterCurrent = { style = "nocombine" },
		MiniStarterFooter = { fg = colors.shinjuku14_gui, style = italic },
		MiniStarterHeader = { fg = colors.shinjuku9_gui },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { fg = colors.shinjuku4_gui },
		MiniStarterItemPrefix = { fg = colors.shinjuku15_gui },
		MiniStarterSection = { fg = colors.shinjuku4_gui },
		MiniStarterQuery = { fg = colors.shinjuku10_gui },

		MiniStatuslineDevinfo = { fg = colors.shinjuku4_gui, bg = colors.shinjuku2_gui },
		MiniStatuslineFileinfo = { fg = colors.shinjuku4_gui, bg = colors.shinjuku2_gui },
		MiniStatuslineFilename = { fg = colors.shinjuku4_gui, bg = colors.shinjuku1_gui },
		MiniStatuslineInactive = { fg = colors.shinjuku4_gui, bg = colors.background, style = bold },
		MiniStatuslineModeCommand = { fg = colors.background, bg = colors.shinjuku15_gui, style = bold },
		MiniStatuslineModeInsert = { fg = colors.shinjuku1_gui, bg = colors.shinjuku11_gui, style = bold },
		MiniStatuslineModeNormal = { fg = colors.shinjuku1_gui, bg = colors.shinjuku14_gui, style = bold },
		MiniStatuslineModeOther = { fg = colors.background, bg = colors.shinjuku13_gui, style = bold },
		MiniStatuslineModeReplace = { fg = colors.background, bg = colors.shinjuku12_gui, style = bold },
		MiniStatuslineModeVisual = { fg = colors.background, bg = colors.shinjuku7_gui, style = bold },

		MiniSurround = { link = "IncSearch" },

		MiniTablineCurrent = { bg = colors.shinjuku1_gui },
		MiniTablineFill = { link = "TabLineFill" },
		MiniTablineHidden = { bg = colors.background, fg = colors.shinjuku3_gui },
		MiniTablineModifiedCurrent = { bg = colors.shinjuku1_gui, fg = colors.shinjuku15_gui },
		MiniTablineModifiedHidden = { bg = colors.background, fg = colors.shinjuku15_gui },
		MiniTablineModifiedVisible = { bg = colors.shinjuku2_gui, fg = colors.shinjuku15_gui },
		MiniTablineTabpagesection = { fg = colors.shinjuku10_gui, bg = colors.shinjuku6_gui, style = reverse_bold },
		MiniTablineVisible = { bg = colors.shinjuku2_gui },

		MiniTestEmphasis = { style = bold },
		MiniTestFail = { fg = colors.shinjuku11_gui, style = bold },
		MiniTestPass = { fg = colors.shinjuku14_gui, style = bold },

		MiniTrailspace = { bg = colors.shinjuku11_gui },

		-- Aerail
		AerialLine = { bg = colors.shinjuku2_gui },
		AerialLineNC = { bg = colors.shinjuku2_gui },

		AerialArrayIcon = { fg = colors.shinjuku13_gui },
		AerialBooleanIcon = { fg = colors.shinjuku9_gui, style = bold },
		AerialClassIcon = { fg = colors.shinjuku9_gui },
		AerialConstantIcon = { fg = colors.shinjuku13_gui },
		AerialConstructorIcon = { fg = colors.shinjuku9_gui },
		AerialEnumIcon = { fg = colors.shinjuku9_gui },
		AerialEnumMemberIcon = { fg = colors.shinjuku4_gui },
		AerialEventIcon = { fg = colors.shinjuku9_gui },
		AerialFieldIcon = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic } or { fg = colors.shinjuku4_gui },
		AerialFileIcon = { fg = colors.shinjuku14_gui },
		AerialFunctionIcon = vim.g.shinjuku_italic and { fg = colors.shinjuku8_gui, style = italic } or { fg = colors.shinjuku8_gui },
		AerialInterfaceIcon = { fg = colors.shinjuku9_gui },
		AerialKeyIcon = { fg = colors.shinjuku9_gui },
		AerialMethodIcon = vim.g.shinjuku_italic and { fg = colors.shinjuku7_gui, style = italic } or { fg = colors.shinjuku7_gui },
		AerialModuleIcon = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic } or { fg = colors.shinjuku4_gui },
		AerialNamespaceIcon = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic }
			or { fg = colors.shinjuku4_gui },
		AerialNullIcon = { fg = colors.shinjuku9_gui },
		AerialNumberIcon = { fg = colors.shinjuku15_gui },
		AerialObjectIcon = { fg = colors.shinjuku9_gui },
		AerialOperatorIcon = { fg = colors.shinjuku9_gui },
		AerialPackageIcon = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic } or { fg = colors.shinjuku4_gui },
		AerialPropertyIcon = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic }
			or { fg = colors.shinjuku10_gui },
		AerialStringIcon = vim.g.shinjuku_italic and { fg = colors.shinjuku14_gui, style = italic } or { fg = colors.shinjuku14_gui },
		AerialStructIcon = { fg = colors.shinjuku9_gui },
		AerialTypeParameterIcon = { fg = colors.shinjuku10_gui },
		AerialVariableIcon = { fg = colors.shinjuku4_gui, style = bold },

		AerialArray = { fg = colors.shinjuku13_gui },
		AerialBoolean = { fg = colors.shinjuku9_gui, style = bold },
		AerialClass = { fg = colors.shinjuku9_gui },
		AerialConstant = { fg = colors.shinjuku13_gui },
		AerialConstructor = { fg = colors.shinjuku9_gui },
		AerialEnum = { fg = colors.shinjuku9_gui },
		AerialEnumMember = { fg = colors.shinjuku4_gui },
		AerialEvent = { fg = colors.shinjuku9_gui },
		AerialField = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic } or { fg = colors.shinjuku4_gui },
		AerialFile = { fg = colors.shinjuku14_gui },
		AerialFunction = vim.g.shinjuku_italic and { fg = colors.shinjuku8_gui, style = italic } or { fg = colors.shinjuku8_gui },
		AerialInterface = { fg = colors.shinjuku9_gui },
		AerialKey = { fg = colors.shinjuku9_gui },
		AerialMethod = vim.g.shinjuku_italic and { fg = colors.shinjuku7_gui, style = italic } or { fg = colors.shinjuku7_gui },
		AerialModule = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic } or { fg = colors.shinjuku4_gui },
		AerialNamespace = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic } or { fg = colors.shinjuku4_gui },
		AerialNull = { fg = colors.shinjuku9_gui },
		AerialNumber = { fg = colors.shinjuku15_gui },
		AerialObject = { fg = colors.shinjuku9_gui },
		AerialOperator = { fg = colors.shinjuku9_gui },
		AerialPackage = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic } or { fg = colors.shinjuku4_gui },
		AerialProperty = vim.g.shinjuku_italic and { fg = colors.shinjuku4_gui, style = italic } or { fg = colors.shinjuku10_gui },
		AerialString = vim.g.shinjuku_italic and { fg = colors.shinjuku14_gui, style = italic } or { fg = colors.shinjuku14_gui },
		AerialStruct = { fg = colors.shinjuku9_gui },
		AerialTypeParameter = { fg = colors.shinjuku10_gui },
		AerialVariable = { fg = colors.shinjuku4_gui, style = bold },

		-- nvim-navic
		NavicIconsArray = { fg = colors.shinjuku13_gui },
		NavicIconsBoolean = { fg = colors.shinjuku9_gui, style = bold },
		NavicIconsClass = { fg = colors.shinjuku9_gui },
		NavicIconsConstant = { fg = colors.shinjuku13_gui },
		NavicIconsConstructor = { fg = colors.shinjuku9_gui },
		NavicIconsEnum = { fg = colors.shinjuku9_gui },
		NavicIconsEnumMember = { fg = colors.shinjuku4_gui },
		NavicIconsEvent = { fg = colors.shinjuku9_gui },
		NavicIconsField = { fg = colors.shinjuku4_gui, style = italic },
		NavicIconsFile = { fg = colors.shinjuku14_gui },
		NavicIconsFunction = { fg = colors.shinjuku8_gui, style = italic },
		NavicIconsInterface = { fg = colors.shinjuku9_gui },
		NavicIconsKey = { fg = colors.shinjuku9_gui },
		NavicIconsMethod = { fg = colors.shinjuku7_gui, style = italic },
		NavicIconsModule = { fg = colors.shinjuku4_gui, style = italic },
		NavicIconsNamespace = { fg = colors.shinjuku4_gui, style = italic },
		NavicIconsNull = { fg = colors.shinjuku9_gui },
		NavicIconsNumber = { fg = colors.shinjuku15_gui },
		NavicIconsObject = { fg = colors.shinjuku9_gui },
		NavicIconsOperator = { fg = colors.shinjuku9_gui },
		NavicIconsPackage = { fg = colors.shinjuku4_gui, style = italic },
		NavicIconsProperty = { fg = colors.shinjuku4_gui, style = italic },
		NavicIconsString = { fg = colors.shinjuku14_gui, style = italic },
		NavicIconsStruct = { fg = colors.shinjuku9_gui },
		NavicIconsTypeParameter = { fg = colors.shinjuku10_gui },
		NavicIconsVariable = { fg = colors.shinjuku4_gui, style = bold },
		NavicText = { fg = colors.shinjuku4_gui },
		NavicSeparator = { fg = colors.shinjuku4_gui },
	}
	-- Options:

	-- Disable nvim-tree background
	if vim.g.shinjuku_disable_background then
		plugins.NvimTreeNormal = { fg = colors.shinjuku4_gui, bg = colors.none }
	else
		plugins.NvimTreeNormal = { fg = colors.shinjuku4_gui, bg = colors.sidebar }
	end

	if vim.g.shinjuku_enable_sidebar_background then
		plugins.NvimTreeNormal = { fg = colors.shinjuku4_gui, bg = colors.sidebar }
	else
		plugins.NvimTreeNormal = { fg = colors.shinjuku4_gui, bg = colors.none }
	end

	return plugins
end

return theme
