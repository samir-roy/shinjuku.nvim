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
		Type = { fg = colors.syntax_default }, -- int, long, char, etc.
		StorageClass = { fg = colors.constant }, -- static, register, volatile, etc.
		Structure = { fg = colors.constant }, -- struct, union, enum, etc.
		Constant = { fg = colors.constant }, -- any constant
		Character = { fg = colors.string }, -- any character constant: 'c', '\n'
		Number = { fg = colors.constant }, -- a number constant: 5
		Boolean = { fg = colors.constant }, -- a boolean constant: TRUE, false
		Float = { fg = colors.constant }, -- a floating point constant: 2.3e10
		Statement = { fg = colors.syntax_default }, -- any statement
		Label = { fg = colors.syntax_default }, -- case, default, etc.
		Operator = { fg = colors.syntax_default }, -- sizeof", "+", "*", etc.
		Exception = { fg = colors.syntax_default }, -- try, catch, throw
		PreProc = { fg = colors.syntax_default }, -- generic Preprocessor
		Include = { fg = colors.syntax_default }, -- preprocessor #include
		Define = { fg = colors.syntax_default }, -- preprocessor #define
		Macro = { fg = colors.syntax_default }, -- same as Define
		Typedef = { fg = colors.syntax_default }, -- A typedef
		PreCondit = { fg = colors.constant }, -- preprocessor #if, #else, #endif, etc.
		Special = { fg = colors.darkest_text }, -- any special symbol
		SpecialChar = { fg = colors.constant }, -- special character in a constant
		Tag = { fg = colors.darkest_text }, -- you can use CTRL-] on this
		Delimiter = { fg = colors.syntax_function }, -- character that needs attention like , or .
		SpecialComment = { fg = colors.syntax_keyword }, -- special things inside a comment
		Debug = { fg = colors.string }, -- debugging statements
		Underlined = { fg = colors.highlight, bg = colors.none, style = "underline" }, -- text that stands out, HTML links
		Ignore = { fg = colors.dark_background }, -- left blank, hidden
		Todo = { fg = colors.constant, bg = colors.none, style = bold_italic }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Conceal = { fg = colors.none, bg = colors.background },
		htmlLink = { fg = colors.highlight, style = "underline" },
		markdownH1Delimiter = { fg = colors.syntax_keyword },
		markdownH2Delimiter = { fg = colors.string },
		markdownH3Delimiter = { fg = colors.success },
		htmlH1 = { fg = colors.syntax_keyword, style = bold },
		htmlH2 = { fg = colors.string, style = bold },
		htmlH3 = { fg = colors.success, style = bold },
		htmlH4 = { fg = colors.warning, style = bold },
		htmlH5 = { fg = colors.syntax_default, style = bold },
		markdownH1 = { fg = colors.syntax_keyword, style = bold },
		markdownH2 = { fg = colors.string, style = bold },
		markdownH3 = { fg = colors.success, style = bold },
		Error = { fg = colors.error, bg = colors.none, style = bold_underline }, -- any erroneous construct with bold
		Comment = { fg = colors.comment, style = italic }, -- italic comments
		Conditional = { fg = colors.syntax_default, style = italic }, -- italic if, then, else, endif, switch, etc.
		Function = { fg = colors.syntax_keyword, style = italic }, -- italic funtion names
		Identifier = { fg = colors.syntax_default, style = italic }, -- any variable name
		Keyword = { fg = colors.syntax_default, style = italic }, -- italic for, do, while, etc.
		Repeat = { fg = colors.syntax_default, style = italic }, -- italic any other keyword
		String = { fg = colors.string, style = italic }, -- any string
	}
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {
		NormalFloat = { fg = colors.darkest_text, bg = colors.float }, -- normal text and background color
		FloatBorder = { fg = colors.darkest_text, bg = colors.float }, -- normal text and background color
		ColorColumn = { fg = colors.none, bg = colors.dark_background }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = colors.dark_background }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = colors.darkest_text, bg = colors.none, style = "reverse" }, -- the character under the cursor
		CursorIM = { fg = colors.dark_text, bg = colors.none, style = "reverse" }, -- like Cursor, but used when in IME mode
		Directory = { fg = colors.syntax_function, bg = colors.none }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = colors.dark_background },
		ErrorMsg = { fg = colors.none },
		Folded = { fg = colors.comment, bg = colors.none, style = italic },
		FoldColumn = { fg = colors.syntax_function },
		IncSearch = { fg = colors.background, bg = colors.highlight },
		LineNr = { fg = colors.comment },
		CursorLineNr = { fg = colors.cursorlinefg, bg = colors.cursorlinebg },
		MatchParen = { fg = colors.background, bg = colors.warning, style = bold },
		ModeMsg = { fg = colors.darkest_text },
		MoreMsg = { fg = colors.darkest_text },
		NonText = { fg = colors.dark_background },
		Pmenu = { fg = colors.background, bg = colors.special },
		PmenuSel = { fg = colors.background, bg = colors.string },
		PmenuSbar = { fg = colors.darkest_text, bg = colors.background },
		PmenuThumb = { fg = colors.darkest_text, bg = colors.success },
		Question = { fg = colors.success },
		QuickFixLine = { fg = colors.darkest_text, bg = colors.none, style = "reverse" },
		qfLineNr = { fg = colors.darkest_text, bg = colors.none, style = "reverse" },
		Search = { fg = colors.background, bg = colors.highlight },
		Substitute = { fg = colors.background, bg = colors.substitute },
		SpecialKey = { fg = colors.syntax_default },
		SpellBad = { fg = colors.string, bg = colors.none, style = italic_undercurl },
		SpellCap = { fg = colors.syntax_function, bg = colors.none, style = italic_undercurl },
		SpellLocal = { fg = colors.syntax_keyword, bg = colors.none, style = italic_undercurl },
		SpellRare = { fg = colors.syntax_default, bg = colors.none, style = italic_undercurl },
		StatusLine = { fg = colors.darkest_text, bg = colors.light_background },
		StatusLineNC = { fg = colors.darkest_text, bg = colors.dark_background },
		StatusLineTerm = { fg = colors.darkest_text, bg = colors.light_background },
		StatusLineTermNC = { fg = colors.darkest_text, bg = colors.dark_background },
		TabLineFill = { fg = colors.darkest_text, bg = colors.none },
		TablineSel = { fg = colors.dark_background, bg = colors.syntax_default },
		Tabline = { fg = colors.darkest_text, bg = colors.dark_background },
		Title = { fg = colors.success, bg = colors.none, style = bold },
		Visual = { fg = colors.background, bg = colors.warning },
		VisualNOS = { fg = colors.none, bg = colors.light_background },
		WarningMsg = { fg = colors.warning },
		WildMenu = { fg = colors.substitute, bg = colors.none, style = bold },
		CursorColumn  = { fg = colors.cursorlinefg, bg = colors.cursorlinebg },
		CursorLine = { fg = colors.cursorlinefg, bg = colors.cursorlinebg },
		ToolbarLine = { fg = colors.darkest_text, bg = colors.dark_background },
		ToolbarButton = { fg = colors.darkest_text, bg = colors.none, style = bold },
		NormalMode = { fg = colors.warning, bg = colors.none, style = "reverse" },
		InsertMode = { fg = colors.success, bg = colors.none, style = "reverse" },
		ReplacelMode = { fg = colors.substitute, bg = colors.none, style = "reverse" },
		VisualMode = { fg = colors.string, bg = colors.none, style = "reverse" },
		CommandMode = { fg = colors.darkest_text, bg = colors.none, style = "reverse" },
		Warnings = { fg = colors.warning },

		healthError = { fg = colors.string },
		healthSuccess = { fg = colors.success },
		healthWarning = { fg = colors.warning },

		-- dashboard
		DashboardShortCut = { fg = colors.syntax_function },
		DashboardHeader = { fg = colors.syntax_default },
		DashboardCenter = { fg = colors.syntax_keyword },
		DashboardFooter = { fg = colors.success, style = italic },

		-- Barbar
		BufferTabpageFill = { bg = colors.background },

		BufferCurrent = { bg = colors.dark_background },
		BufferCurrentMod = { bg = colors.dark_background, fg = colors.warning },
		BufferCurrentIcon = { bg = colors.dark_background },
		BufferCurrentSign = { bg = colors.dark_background },
		BufferCurrentIndex = { bg = colors.dark_background },
		BufferCurrentTarget = { bg = colors.dark_background, fg = colors.string },

		BufferInactive = { bg = colors.background, fg = colors.inactive_text },
		BufferInactiveMod = { bg = colors.background, fg = colors.warning },
		BufferInactiveIcon = { bg = colors.background, fg = colors.inactive_text },
		BufferInactiveSign = { bg = colors.background, fg = colors.inactive_text },
		BufferInactiveIndex = { bg = colors.background, fg = colors.inactive_text },
		BufferInactiveTarget = { bg = colors.background, fg = colors.string },

		BufferVisible = { bg = colors.light_background },
		BufferVisibleMod = { bg = colors.light_background, fg = colors.warning },
		BufferVisibleIcon = { bg = colors.light_background },
		BufferVisibleSign = { bg = colors.light_background },
		BufferVisibleIndex = { bg = colors.light_background },
		BufferVisibleTarget = { bg = colors.light_background, fg = colors.string },

		-- nvim-notify
		NotifyDEBUGBorder = { fg = colors.inactive_text },
		NotifyDEBUGIcon = { fg = colors.inactive_text },
		NotifyDEBUGTitle = { fg = colors.inactive_text },
		NotifyERRORBorder = { fg = colors.string },
		NotifyERRORIcon = { fg = colors.string },
		NotifyERRORTitle = { fg = colors.string },
		NotifyINFOBorder = { fg = colors.success },
		NotifyINFOIcon = { fg = colors.success },
		NotifyINFOTitle = { fg = colors.success },
		NotifyTRACEBorder = { fg = colors.warning },
		NotifyTRACEIcon = { fg = colors.warning },
		NotifyTRACETitle = { fg = colors.warning },
		NotifyWARNBorder = { fg = colors.constant },
		NotifyWARNIcon = { fg = colors.constant },
		NotifyWARNTitle = { fg = colors.constant },

		-- leap.nvim
		LeapMatch = { style = "underline,nocombine", fg = colors.constant },
		LeapLabelPrimary = { style = "nocombine", fg = colors.background, bg = colors.constant },
		LeapLabelSecondary = { style = "nocombine", fg = colors.background, bg = colors.warning },
	}

	-- Options:

	--Set transparent background
	if vim.g.shinjuku_disable_background then
		editor.Normal = { fg = colors.darkest_text, bg = colors.none } -- normal text and background color
		editor.SignColumn = { fg = colors.darkest_text, bg = colors.none }
	else
		editor.Normal = { fg = colors.darkest_text, bg = colors.background } -- normal text and background color
		editor.SignColumn = { fg = colors.darkest_text, bg = colors.background }
	end

	-- Remove window split borders
	if vim.g.shinjuku_borders then
		editor.VertSplit = { fg = colors.light_background }
	else
		editor.VertSplit = { fg = colors.background }
	end

	if vim.g.shinjuku_uniform_diff_background then
		editor.DiffAdd = { fg = colors.success, bg = colors.dark_background } -- diff mode: Added line
		editor.DiffChange = { fg = colors.constant, bg = colors.dark_background } -- diff mode: Changed line
		editor.DiffDelete = { fg = colors.string, bg = colors.dark_background } -- diff mode: Deleted line
		editor.DiffText = { fg = colors.warning, bg = colors.dark_background } -- diff mode: Changed text within a changed line
	else
		editor.DiffAdd = { fg = colors.success, bg = colors.none, style = "reverse" } -- diff mode: Added line
		editor.DiffChange = { fg = colors.constant, bg = colors.none, style = "reverse" } -- diff mode: Changed line
		editor.DiffDelete = { fg = colors.string, bg = colors.none, style = "reverse" } -- diff mode: Deleted line
		editor.DiffText = { fg = colors.warning, bg = colors.none, style = "reverse" } -- diff mode: Changed text within a changed line
	end

	return editor
end

-- theme.loadTerminal = function()
	-- vim.g.terminal_color_0 = colors.dark_background
	-- vim.g.terminal_color_1 = colors.string
	-- vim.g.terminal_color_2 = colors.success
	-- vim.g.terminal_color_3 = colors.constant
	-- vim.g.terminal_color_4 = colors.syntax_default
	-- vim.g.terminal_color_5 = colors.warning
	-- vim.g.terminal_color_6 = colors.syntax_keyword
	-- vim.g.terminal_color_7 = colors.dark_text
	-- vim.g.terminal_color_8 = colors.inactive_text
	-- vim.g.terminal_color_9 = colors.string
	-- vim.g.terminal_color_10 = colors.success
	-- vim.g.terminal_color_11 = colors.constant
	-- vim.g.terminal_color_12 = colors.syntax_default
	-- vim.g.terminal_color_13 = colors.warning
	-- vim.g.terminal_color_14 = colors.syntax_function
	-- vim.g.terminal_color_15 = colors.syntax_function
-- end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		TSConstructor = { fg = colors.syntax_default }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		TSConstant = { fg = colors.constant }, -- For constants
		TSFloat = { fg = colors.constant }, -- For floats
		TSNumber = { fg = colors.constant }, -- For all number
		TSAttribute = { fg = colors.warning }, -- (unstable) TODO: docs
		TSError = { fg = colors.error }, -- For syntax/parser errors.
		TSException = { fg = colors.warning }, -- For exception related keywords.
		TSFuncMacro = { fg = colors.syntax_function }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = colors.syntax_default }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSLabel = { fg = colors.warning }, -- For labels: `label:` in C and `:label:` in Lua.
		TSOperator = { fg = colors.syntax_default }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = colors.syntax_param }, -- For parameters of a function.
		TSParameterReference = { fg = colors.syntax_param }, -- For references to parameters of a function.
		TSPunctDelimiter = { fg = colors.syntax_keyword }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = colors.bracket }, -- For brackets and parens.
		TSPunctSpecial = { fg = colors.syntax_keyword }, -- For special punctutation that does not fall in the catagories before.
		TSSymbol = { fg = colors.constant }, -- For identifiers referring to symbols or atoms.
		TSType = { fg = colors.syntax_default }, -- For types.
		TSTypeBuiltin = { fg = colors.syntax_default }, -- For builtin types.
		TSTag = { fg = colors.darkest_text }, -- Tags like html tag names.
		TSTagDelimiter = { fg = colors.light_background }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = colors.darkest_text }, -- For strings considestring text in a markup language.
		TSTextReference = { fg = colors.highlight }, -- FIXME
		TSEmphasis = { fg = colors.syntax_param }, -- For text to be represented with emphasis.
		TSUnderline = { fg = colors.darkest_text, bg = colors.none, style = "underline" }, -- For text to be represented with an underline.
		TSLiteral = { fg = colors.constant }, -- Literal text.
		TSURI = { fg = colors.highlight }, -- Any URI like a link or email.
		TSAnnotation = { fg = colors.string }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		["@constructor"] = { fg = colors.syntax_default },
		["@constant"] = { fg = colors.constant },
		["@float"] = { fg = colors.constant },
		["@number"] = { fg = colors.constant },
		["@attribute"] = { fg = colors.warning },
		["@error"] = { fg = colors.error },
		["@exception"] = { fg = colors.warning },
		["@funtion.macro"] = { fg = colors.syntax_function },
		["@include"] = { fg = colors.syntax_param },
		["@label"] = { fg = colors.warning },
		["@operator"] = { fg = colors.syntax_keyword },
		["@parameter"] = { fg = colors.syntax_param },
		["@punctuation.delimiter"] = { fg = colors.syntax_keyword },
		["@punctuation.bracket"] = { fg = colors.bracket },
		["@punctuation.special"] = { fg = colors.syntax_keyword },
		["@symbol"] = { fg = colors.constant },
		["@type"] = { fg = colors.syntax_param },
		["@type.builtin"] = { fg = colors.syntax_param },
		["@tag"] = { fg = colors.syntax_tag },
		["@tag.tsx"] = { fg = colors.syntax_tag },
		["@tag.delimiter"] = { fg = colors.light_background },
		["@text"] = { fg = colors.darkest_text },
		["@text.reference"] = { fg = colors.highlight, style = bold },
		["@text.emphasis"] = { fg = colors.syntax_param, style = italic },
		["@text.underline"] = { fg = colors.darkest_text, bg = colors.none, style = "underline" },
		["@text.literal"] = { fg = colors.constant },
		["@text.uri"] = { fg = colors.highlight, style = "underline" },
		["@text.strike"] = { fg = colors.darkest_text, style = "strikethrough" },
		["@text.math"] = { fg = colors.syntax_function },

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

	treesitter.TSVariableBuiltin = { fg = colors.darkest_text, style = bold }
	treesitter.TSBoolean = { fg = colors.constant, style = bold }
	treesitter.TSConstBuiltin = { fg = colors.constant, style = bold }
	treesitter.TSConstMacro = { fg = colors.syntax_function, style = bold }
	treesitter.TSVariable = { fg = colors.darkest_text, style = bold }
	treesitter.TSTitle = { fg = colors.syntax_param, bg = colors.none, style = bold }
	treesitter["@variable"] = { fg = colors.darkest_text, style = bold }
	treesitter["@variable.builtin"] = { fg = colors.darkest_text, style = bold }
	treesitter["@variable.global"] = { fg = colors.darkest_text, style = bold }
	treesitter["@boolean"] = { fg = colors.constant, style = bold }
	treesitter["@constant.builtin"] = { fg = colors.constant, style = bold }
	treesitter["@constant.macro"] = { fg = colors.syntax_function, style = bold }
	treesitter["@text.title"] = { fg = colors.syntax_param, bg = colors.none, style = bold }
	treesitter["@text.strong"] = { fg = colors.syntax_param, bg = colors.none, style = bold }
	-- Comments
	treesitter.TSComment = { fg = colors.comment, style = italic }
	-- Conditionals
	treesitter.TSConditional = { fg = colors.syntax_default, style = italic } -- For keywords related to conditionnals.
	-- Function names
	treesitter.TSFunction = { fg = colors.syntax_function, style = italic } -- For fuction (calls and definitions).
	treesitter.TSMethod = { fg = colors.syntax_function, style = italic } -- For method calls and definitions.
	treesitter.TSFuncBuiltin = { fg = colors.syntax_keyword, style = italic }
	-- Namespaces and property accessors
	treesitter.TSNamespace = { fg = colors.darkest_text, style = italic } -- For identifiers referring to modules and namespaces.
	treesitter.TSField = { fg = colors.darkest_text, style = italic } -- For fields.
	treesitter.TSProperty = { fg = colors.syntax_param, style = italic } -- Same as `TSField`, but when accessing, not declaring.
	-- Language keywords
	treesitter.TSKeyword = { fg = colors.syntax_default, style = italic } -- For keywords that don't fall in other categories.
	treesitter.TSKeywordFunction = { fg = colors.syntax_keyword, style = italic }
	treesitter.TSKeywordReturn = { fg = colors.success, style = italic }
	treesitter.TSKeywordOperator = { fg = colors.syntax_keyword, style = italic }
	treesitter.TSRepeat = { fg = colors.syntax_default, style = italic } -- For keywords related to loops.
	-- Strings
	treesitter.TSString = { fg = colors.string, style = italic } -- For strings.
	treesitter.TSStringRegex = { fg = colors.string, style = italic } -- For regexes.
	treesitter.TSStringEscape = { fg = colors.constant, style = italic } -- For escape characters within a string.
	treesitter.TSCharacter = { fg = colors.string, style = italic } -- For characters.

	treesitter["@comment"] = { fg = colors.comment, style = italic }
	treesitter["@conditional"] = { fg = colors.highlight, style = italic }
	treesitter["@function"] = { fg = colors.syntax_function, style = italic }
	treesitter["@method"] = { fg = colors.syntax_function, style = italic }
	treesitter["@function.builtin"] = { fg = colors.syntax_keyword, style = italic }
	treesitter["@namespace"] = { fg = colors.darkest_text, style = italic }
	treesitter["@field"] = { fg = colors.darkest_text, style = italic }
	treesitter["@property"] = { fg = colors.syntax_param, style = italic }
	treesitter["@keyword"] = { fg = colors.syntax_keyword, style = italic }
	treesitter["@keyword.function"] = { fg = colors.syntax_keyword, style = italic }
	treesitter["@keyword.return"] = { fg = colors.syntax_keyword, style = italic }
	treesitter["@keyword.operator"] = { fg = colors.syntax_keyword, style = italic }
	treesitter["@repeat"] = { fg = colors.syntax_default, style = italic }
	treesitter["@string"] = { fg = colors.string, style = italic }
	treesitter["@string.regex"] = { fg = colors.string, style = italic }
	treesitter["@string.escape"] = { fg = colors.constant, style = italic }
	treesitter["@character"] = { fg = colors.string, style = italic }

	return treesitter
end

theme.loadFiletypes = function()
	-- Filetype-specific highlight groups

	local ft = {
		-- yaml
		yamlBlockMappingKey = { fg = colors.syntax_function },
		yamlBool = { link = "Boolean" },
		yamlDocumentStart = { link = "Keyword" },
		yamlTSField = { fg = colors.syntax_function },
		yamlTSString = { fg = colors.darkest_text },
		yamlTSPunctSpecial = { link = "Keyword" },
		yamlKey = { fg = colors.syntax_function }, -- stephpy/vim-yaml
	}

	return ft
end

theme.loadLSP = function()
	-- Lsp highlight groups

	local lsp = {
		LspDiagnosticsDefaultError = { fg = colors.error }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = colors.background, bg = colors.error }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = colors.string }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = colors.string }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = colors.string }, -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning = { fg = colors.warning }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = colors.warning }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = colors.warning }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = colors.warning }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = colors.warning }, -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation = { fg = colors.syntax_param }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = colors.syntax_param }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = colors.syntax_param }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = colors.syntax_param }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = colors.syntax_param }, -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint = { fg = colors.syntax_default }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = colors.syntax_default }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = colors.syntax_default }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = colors.syntax_default }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = colors.syntax_param }, -- used to underline "Hint" diagnostics.
		LspReferenceText = { fg = colors.darkest_text, bg = colors.dark_background }, -- used for highlighting "text" references
		LspReferenceRead = { fg = colors.darkest_text, bg = colors.dark_background }, -- used for highlighting "read" references
		LspReferenceWrite = { fg = colors.darkest_text, bg = colors.dark_background }, -- used for highlighting "write" references

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
		LspTroubleText = { fg = colors.darkest_text },
		LspTroubleCount = { fg = colors.syntax_default, bg = colors.syntax_param },
		LspTroubleNormal = { fg = colors.darkest_text, bg = colors.sidebar },

		-- Diff
		diffAdded = { fg = colors.success },
		diffRemoved = { fg = colors.string },
		diffChanged = { fg = colors.warning },
		diffOldFile = { fg = colors.yellow },
		diffNewFile = { fg = colors.substitute },
		diffFile = { fg = colors.syntax_function },
		diffLine = { fg = colors.inactive_text },
		diffIndexLine = { fg = colors.syntax_default },

		-- Neogit
		NeogitBranch = { fg = colors.syntax_param },
		NeogitRemote = { fg = colors.syntax_default },
		NeogitHunkHeader = { fg = colors.syntax_keyword },
		NeogitHunkHeaderHighlight = { fg = colors.syntax_keyword, bg = colors.dark_background },
		NeogitDiffContextHighlight = { bg = colors.dark_background },
		NeogitDiffDeleteHighlight = { fg = colors.string, style = "reverse" },
		NeogitDiffAddHighlight = { fg = colors.success, style = "reverse" },

		-- GitGutter
		GitGutterAdd = { fg = colors.success }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = colors.constant }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = colors.string }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd = { fg = colors.success }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr = { fg = colors.success }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn = { fg = colors.success }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = colors.constant }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr = { fg = colors.constant }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn = { fg = colors.constant }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = colors.string }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr = { fg = colors.string }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn = { fg = colors.string }, -- diff mode: Deleted line |diff.txt|
		GitSignsCurrentLineBlame = { fg = colors.comment, style = bold },

		-- Telescope
		TelescopePromptBorder = { fg = colors.darkest_text },
		TelescopeResultsBorder = { fg = colors.darkest_text },
		TelescopePreviewBorder = { fg = colors.darkest_text },
		TelescopeSelectionCaret = { fg = colors.syntax_default },
		TelescopeSelection = { fg = colors.background, bg = colors.warning },
		TelescopeMatching = { link = 'Search' },

		-- NvimTree
		NvimTreeRootFolder = { fg = colors.warning },
		NvimTreeSymlink = { fg = colors.dark_text },
		NvimTreeFolderName = { fg = colors.darkest_text },
		NvimTreeFolderIcon = { fg = colors.syntax_default },
		NvimTreeEmptyFolderName = { fg = colors.darkest_text },
		NvimTreeOpenedFolderName = { fg = colors.dark_text },
		NvimTreeExecFile = { fg = colors.darkest_text },
		NvimTreeOpenedFile = { fg = colors.syntax_function },
		NvimTreeSpecialFile = { fg = colors.darkest_text, style = bold},
		NvimTreeImageFile = { fg = colors.darkest_text },
		NvimTreeMarkdownFile = { fg = colors.darkest_text },
		NvimTreeIndentMarker = { fg = colors.syntax_default },
		NvimTreeGitDirty = { fg = colors.constant }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitStaged = { fg = colors.constant }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitMerge = { fg = colors.constant }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitRenamed = { fg = colors.constant }, -- diff mode: Changed line |diff.txt|
		NvimTreeGitNew = { fg = colors.success }, -- diff mode: Added line |diff.txt|
		NvimTreeGitDeleted = { fg = colors.string },	-- diff mode: Deleted line |diff.txt|
		NvimTreeGitIgnored = { fg = colors.comment },
		LspDiagnosticsError = { fg = colors.error },
		LspDiagnosticsWarning = { fg = colors.warning },
		LspDiagnosticsInformation = { fg = colors.syntax_param },
		LspDiagnosticsHint = { fg = colors.syntax_default },

		-- WhichKey
		WhichKey = { fg = colors.syntax_keyword, style = bold },
		WhichKeyGroup = { fg = colors.dark_text },
		WhichKeyDesc = { fg = colors.syntax_function, style = italic },
		WhichKeySeperator = { fg = colors.syntax_default },
		WhichKeyFloating = { bg = colors.dark_background },
		WhichKeyFloat = { bg = colors.dark_background },
		WhichKeyValue = { fg = colors.syntax_function },

		-- LspSaga
		DiagnosticError = { fg = colors.error },
		DiagnosticWarning = { fg = colors.warning },
		DiagnosticInformation = { fg = colors.syntax_param },
		DiagnosticHint = { fg = colors.syntax_default },
		DiagnosticTruncateLine = { fg = colors.darkest_text },
		LspFloatWinBorder = { fg = colors.darkest_text, bg = colors.float },
		LspSagaDefPreviewBorder = { fg = colors.darkest_text, bg = colors.float },
		DefinitionIcon = { fg = colors.syntax_function },
		TargetWord = { fg = colors.syntax_function, style = 'bold' },
		-- LspSaga code action
		LspSagaCodeActionTitle = { link = 'Title' },
		LspSagaCodeActionBorder = { fg = colors.darkest_text, bg = colors.float },
		LspSagaCodeActionTrunCateLine = { link = 'LspSagaCodeActionBorder' },
		LspSagaCodeActionContent = { fg = colors.darkest_text },
		-- LspSag finder
		LspSagaLspFinderBorder = { fg = colors.darkest_text, bg = colors.float },
		LspSagaAutoPreview = { fg = colors.darkest_text },
		LspSagaFinderSelection = { fg = colors.syntax_function, bg = colors.light_background },
		TargetFileName = { fg = colors.darkest_text },
		FinderParam = { fg = colors.warning, bold = true },
		FinderVirtText = { fg = colors.warning15 , bg = colors.none },
		DefinitionsIcon = { fg = colors.syntax_default },
		Definitions = { fg = colors.warning, bold = true },
		DefinitionCount = { fg = colors.syntax_param },
		ReferencesIcon = { fg = colors.syntax_default },
		References = { fg = colors.warning, bold = true },
		ReferencesCount = { fg = colors.syntax_param },
		ImplementsIcon = { fg = colors.syntax_default },
		Implements = { fg = colors.warning, bold = true },
		ImplementsCount = { fg = colors.syntax_param },
		-- LspSaga finder spinner
		FinderSpinnerBorder = { fg = colors.darkest_text, bg = colors.float },
		FinderSpinnerTitle = { link = 'Title' },
		FinderSpinner = { fg = colors.syntax_keyword, bold = true },
		FinderPreviewSearch = { link = 'Search' },
		-- LspSaga definition
		DefinitionBorder = { fg = colors.darkest_text, bg = colors.float },
		DefinitionArrow = { fg = colors.syntax_keyword },
		DefinitionSearch = { link = 'Search' },
		DefinitionFile = { fg = colors.darkest_text, bg = colors.float },
		-- LspSaga hover
		LspSagaHoverBorder = { fg = colors.darkest_text, bg = colors.float },
		LspSagaHoverTrunCateLine = { link = 'LspSagaHoverBorder' },
		-- Lsp rename
		LspSagaRenameBorder = { fg = colors.darkest_text, bg = colors.float },
		LspSagaRenameMatch = { fg = colors.syntax_function, bg = colors.syntax_default },
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
		LspSagaDiagnosticBorder = { fg = colors.darkest_text, bg = colors.float },
		LspSagaDiagnosticHeader = { fg = colors.darkest_text },
		DiagnosticQuickFix = { fg = colors.success, bold = true },
		DiagnosticMap = { fg = colors.warning },
		DiagnosticLineCol = { fg = colors.darkest_text },
		LspSagaDiagnosticTruncateLine = { link = 'LspSagaDiagnosticBorder' },
		ColInLineDiagnostic = { link = 'Comment' },
		-- LspSaga signture help
		LspSagaSignatureHelpBorder = { fg = colors.darkest_text, bg = colors.float },
		LspSagaShTrunCateLine = { link = 'LspSagaSignatureHelpBorder' },
		-- Lspsaga lightbulb
		LspSagaLightBulb = { link = 'DiagnosticSignHint' },
		-- LspSaga shadow
		SagaShadow = { fg = colors.black },
		-- LspSaga float
		LspSagaBorderTitle = { link = 'Title' },
		-- LspSaga Outline
		LSOutlinePreviewBorder = { fg = colors.darkest_text, bg = colors.float },
		OutlineIndentEvn = { fg = colors.warning },
		OutlineIndentOdd = { fg = colors.substitute },
		OutlineFoldPrefix = { fg = colors.string },
		OutlineDetail = { fg = colors.darkest_text },
		-- LspSaga all floatwindow
		LspFloatWinNormal = { fg = colors.darkest_text, bg = colors.float },
		-- Saga End

		-- Sneak
		Sneak = { fg = colors.background, bg = colors.darkest_text },
		SneakScope = { bg = colors.dark_background },

		-- Cmp
		CmpItemKind = { fg = colors.warning },
		CmpItemAbbrMatch = { fg = colors.dark_text, style = bold },
		CmpItemAbbrMatchFuzzy = { fg = colors.dark_text, style = bold },
		CmpItemAbbr = { fg = colors.darkest_text },
		CmpItemMenu = { fg = colors.success },

		-- Indent Blankline
		IndentBlanklineIndentChar = { fg = colors.darkest },
		IndentBlanklineScopeChar = { fg = colors.highlight },

		-- headline
		-- bg = (10 * shinjuku0 + fg) / 11
		Headline1 = { fg = colors.substitute, bg = "#3d3c44", bold = true },
		Headline2 = { fg = colors.constant, bg = "#3f4247", bold = true },
		Headline3 = { fg = colors.success, bg = "#394147", bold = true },
		Headline4 = { fg = colors.syntax_default, bg = "#363e4c", bold = true },
		Headline5 = { fg = colors.warning, bg = "#3a3c4a", bold = true },
		Headline6 = { fg = colors.darkest_text, bg = "#3d434f", bold = true },

		Quote = { fg = colors.light_background },
		CodeBlock = { bg = colors.dark_background },
		Dash = { colors.syntax_param, bold = true },

		-- Illuminate
		illuminatedWord = { bg = colors.inactive_text },
		illuminatedCurWord = { bg = colors.inactive_text },
		IlluminatedWordText = { bg = colors.inactive_text },
		IlluminatedWordRead = { bg = colors.inactive_text },
		IlluminatedWordWrite = { bg = colors.inactive_text },

		-- nvim-dap
		DapBreakpoint = { fg = colors.success },
		DapStopped = { fg = colors.warning },

		-- nvim-dap-ui
		DapUIVariable = { fg = colors.darkest_text },
		DapUIScope = { fg = colors.syntax_keyword },
		DapUIType = { fg = colors.syntax_default },
		DapUIValue = { fg = colors.darkest_text },
		DapUIModifiedValue = { fg = colors.syntax_keyword },
		DapUIDecoration = { fg = colors.syntax_keyword },
		DapUIThread = { fg = colors.syntax_keyword },
		DapUIStoppedThread = { fg = colors.syntax_keyword },
		DapUIFrameName = { fg = colors.darkest_text },
		DapUISource = { fg = colors.syntax_default },
		DapUILineNumber = { fg = colors.syntax_keyword },
		DapUIFloatBorder = { fg = colors.syntax_keyword },
		DapUIWatchesEmpty = { fg = colors.string },
		DapUIWatchesValue = { fg = colors.syntax_keyword },
		DapUIWatchesError = { fg = colors.string },
		DapUIBreakpointsPath = { fg = colors.syntax_keyword },
		DapUIBreakpointsInfo = { fg = colors.syntax_keyword },
		DapUIBreakpointsCurrentLine = { fg = colors.syntax_keyword },
		DapUIBreakpointsLine = { fg = colors.syntax_keyword },

		-- Hop
		HopNextKey = { fg = colors.darkest_text, style = bold },
		HopNextKey1 = { fg = colors.syntax_keyword, style = bold },
		HopNextKey2 = { fg = colors.darkest_text },
		HopUnmatched = { fg = colors.inactive_text },

		-- Fern
		FernBranchText = { fg = colors.comment },

		-- nvim-ts-rainbow
		rainbowcol1 = { fg = colors.warning },
		rainbowcol2 = { fg = colors.constant },
		rainbowcol3 = { fg = colors.string },
		rainbowcol4 = { fg = colors.syntax_function },
		rainbowcol5 = { fg = colors.syntax_keyword },
		rainbowcol6 = { fg = colors.warning },
		rainbowcol7 = { fg = colors.constant },

		-- lightspeed
		LightspeedLabel = { fg = colors.syntax_keyword, style = bold },
		LightspeedLabelOverlapped = { fg = colors.syntax_keyword, style = "bold,underline" },
		LightspeedLabelDistant = { fg = colors.warning, style = bold },
		LightspeedLabelDistantOverlapped = { fg = colors.warning, style = "bold,underline" },
		LightspeedShortcut = { fg = colors.syntax_param, style = bold },
		LightspeedShortcutOverlapped = { fg = colors.syntax_param, style = "bold,underline" },
		LightspeedMaskedChar = { fg = colors.darkest_text, bg = colors.light_background, style = bold },
		LightspeedGreyWash = { fg = colors.comment },
		LightspeedUnlabeledMatch = { fg = colors.darkest_text, bg = colors.dark_background },
		LightspeedOneCharMatch = { fg = colors.syntax_keyword, style = "bold,reverse" },
		LightspeedUniqueChar = { style = "bold,underline" },

		-- copilot
		CopilotLabel = { fg = colors.inactive_text, bg = colors.none },

		-- Statusline
		StatusLineDull = { fg = colors.inactive_text, bg = colors.dark_background },
		StatusLineAccent = { fg = colors.background, bg = colors.constant },

		-- mini.nvim
		MiniCompletionActiveParameter = { style = "underline" },

		MiniCursorword = { bg = colors.inactive_text },
		MiniCursorwordCurrent = { bg = colors.inactive_text },

		MiniIndentscopeSymbol = { fg = colors.syntax_param },
		MiniIndentscopePrefix = { style = "nocombine" }, -- Make it invisible

		MiniJump = { fg = colors.background, bg = colors.darkest_text },

		MiniJump2dSpot = { fg = colors.substitute, style = "bold,nocombine" },

		MiniStarterCurrent = { style = "nocombine" },
		MiniStarterFooter = { fg = colors.success, style = italic },
		MiniStarterHeader = { fg = colors.syntax_default },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { fg = colors.darkest_text },
		MiniStarterItemPrefix = { fg = colors.warning },
		MiniStarterSection = { fg = colors.darkest_text },
		MiniStarterQuery = { fg = colors.syntax_param },

		MiniStatuslineDevinfo = { fg = colors.darkest_text, bg = colors.light_background },
		MiniStatuslineFileinfo = { fg = colors.darkest_text, bg = colors.light_background },
		MiniStatuslineFilename = { fg = colors.darkest_text, bg = colors.dark_background },
		MiniStatuslineInactive = { fg = colors.darkest_text, bg = colors.background, style = bold },
		MiniStatuslineModeCommand = { fg = colors.background, bg = colors.warning, style = bold },
		MiniStatuslineModeInsert = { fg = colors.dark_background, bg = colors.string, style = bold },
		MiniStatuslineModeNormal = { fg = colors.dark_background, bg = colors.success, style = bold },
		MiniStatuslineModeOther = { fg = colors.background, bg = colors.constant, style = bold },
		MiniStatuslineModeReplace = { fg = colors.background, bg = colors.substitute, style = bold },
		MiniStatuslineModeVisual = { fg = colors.background, bg = colors.syntax_function, style = bold },

		MiniSurround = { link = "IncSearch" },

		MiniTablineCurrent = { bg = colors.dark_background },
		MiniTablineFill = { link = "TabLineFill" },
		MiniTablineHidden = { bg = colors.background, fg = colors.inactive_text },
		MiniTablineModifiedCurrent = { bg = colors.dark_background, fg = colors.warning },
		MiniTablineModifiedHidden = { bg = colors.background, fg = colors.warning },
		MiniTablineModifiedVisible = { bg = colors.light_background, fg = colors.warning },
		MiniTablineTabpagesection = { fg = colors.syntax_param, bg = colors.syntax_function, style = reverse_bold },
		MiniTablineVisible = { bg = colors.light_background },

		MiniTestEmphasis = { style = bold },
		MiniTestFail = { fg = colors.string, style = bold },
		MiniTestPass = { fg = colors.success, style = bold },

		MiniTrailspace = { bg = colors.string },

		-- Aerail
		AerialLine = { bg = colors.light_background },
		AerialLineNC = { bg = colors.light_background },

		AerialArrayIcon = { fg = colors.constant },
		AerialBooleanIcon = { fg = colors.syntax_default, style = bold },
		AerialClassIcon = { fg = colors.syntax_default },
		AerialConstantIcon = { fg = colors.constant },
		AerialConstructorIcon = { fg = colors.syntax_default },
		AerialEnumIcon = { fg = colors.syntax_default },
		AerialEnumMemberIcon = { fg = colors.darkest_text },
		AerialEventIcon = { fg = colors.syntax_default },
		AerialFieldIcon = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic } or { fg = colors.darkest_text },
		AerialFileIcon = { fg = colors.success },
		AerialFunctionIcon = vim.g.shinjuku_italic and { fg = colors.syntax_keyword, style = italic } or { fg = colors.syntax_keyword },
		AerialInterfaceIcon = { fg = colors.syntax_default },
		AerialKeyIcon = { fg = colors.syntax_default },
		AerialMethodIcon = vim.g.shinjuku_italic and { fg = colors.syntax_function, style = italic } or { fg = colors.syntax_function },
		AerialModuleIcon = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic } or { fg = colors.darkest_text },
		AerialNamespaceIcon = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic }
			or { fg = colors.darkest_text },
		AerialNullIcon = { fg = colors.syntax_default },
		AerialNumberIcon = { fg = colors.warning },
		AerialObjectIcon = { fg = colors.syntax_default },
		AerialOperatorIcon = { fg = colors.syntax_default },
		AerialPackageIcon = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic } or { fg = colors.darkest_text },
		AerialPropertyIcon = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic }
			or { fg = colors.syntax_param },
		AerialStringIcon = vim.g.shinjuku_italic and { fg = colors.success, style = italic } or { fg = colors.success },
		AerialStructIcon = { fg = colors.syntax_default },
		AerialTypeParameterIcon = { fg = colors.syntax_param },
		AerialVariableIcon = { fg = colors.darkest_text, style = bold },

		AerialArray = { fg = colors.constant },
		AerialBoolean = { fg = colors.syntax_default, style = bold },
		AerialClass = { fg = colors.syntax_default },
		AerialConstant = { fg = colors.constant },
		AerialConstructor = { fg = colors.syntax_default },
		AerialEnum = { fg = colors.syntax_default },
		AerialEnumMember = { fg = colors.darkest_text },
		AerialEvent = { fg = colors.syntax_default },
		AerialField = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic } or { fg = colors.darkest_text },
		AerialFile = { fg = colors.success },
		AerialFunction = vim.g.shinjuku_italic and { fg = colors.syntax_keyword, style = italic } or { fg = colors.syntax_keyword },
		AerialInterface = { fg = colors.syntax_default },
		AerialKey = { fg = colors.syntax_default },
		AerialMethod = vim.g.shinjuku_italic and { fg = colors.syntax_function, style = italic } or { fg = colors.syntax_function },
		AerialModule = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic } or { fg = colors.darkest_text },
		AerialNamespace = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic } or { fg = colors.darkest_text },
		AerialNull = { fg = colors.syntax_default },
		AerialNumber = { fg = colors.warning },
		AerialObject = { fg = colors.syntax_default },
		AerialOperator = { fg = colors.syntax_default },
		AerialPackage = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic } or { fg = colors.darkest_text },
		AerialProperty = vim.g.shinjuku_italic and { fg = colors.darkest_text, style = italic } or { fg = colors.syntax_param },
		AerialString = vim.g.shinjuku_italic and { fg = colors.success, style = italic } or { fg = colors.success },
		AerialStruct = { fg = colors.syntax_default },
		AerialTypeParameter = { fg = colors.syntax_param },
		AerialVariable = { fg = colors.darkest_text, style = bold },

		-- nvim-navic
		NavicIconsArray = { fg = colors.constant },
		NavicIconsBoolean = { fg = colors.syntax_default, style = bold },
		NavicIconsClass = { fg = colors.syntax_default },
		NavicIconsConstant = { fg = colors.constant },
		NavicIconsConstructor = { fg = colors.syntax_default },
		NavicIconsEnum = { fg = colors.syntax_default },
		NavicIconsEnumMember = { fg = colors.darkest_text },
		NavicIconsEvent = { fg = colors.syntax_default },
		NavicIconsField = { fg = colors.darkest_text, style = italic },
		NavicIconsFile = { fg = colors.success },
		NavicIconsFunction = { fg = colors.syntax_keyword, style = italic },
		NavicIconsInterface = { fg = colors.syntax_default },
		NavicIconsKey = { fg = colors.syntax_default },
		NavicIconsMethod = { fg = colors.syntax_function, style = italic },
		NavicIconsModule = { fg = colors.darkest_text, style = italic },
		NavicIconsNamespace = { fg = colors.darkest_text, style = italic },
		NavicIconsNull = { fg = colors.syntax_default },
		NavicIconsNumber = { fg = colors.warning },
		NavicIconsObject = { fg = colors.syntax_default },
		NavicIconsOperator = { fg = colors.syntax_default },
		NavicIconsPackage = { fg = colors.darkest_text, style = italic },
		NavicIconsProperty = { fg = colors.darkest_text, style = italic },
		NavicIconsString = { fg = colors.success, style = italic },
		NavicIconsStruct = { fg = colors.syntax_default },
		NavicIconsTypeParameter = { fg = colors.syntax_param },
		NavicIconsVariable = { fg = colors.darkest_text, style = bold },
		NavicText = { fg = colors.darkest_text },
		NavicSeparator = { fg = colors.darkest_text },
	}
	-- Options:

	-- Disable nvim-tree background
	if vim.g.shinjuku_disable_background then
		plugins.NvimTreeNormal = { fg = colors.darkest_text, bg = colors.none }
	else
		plugins.NvimTreeNormal = { fg = colors.darkest_text, bg = colors.sidebar }
	end

	if vim.g.shinjuku_enable_sidebar_background then
		plugins.NvimTreeNormal = { fg = colors.darkest_text, bg = colors.sidebar }
	else
		plugins.NvimTreeNormal = { fg = colors.darkest_text, bg = colors.none }
	end

	return plugins
end

return theme
