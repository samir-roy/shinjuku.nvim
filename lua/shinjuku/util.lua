local util = {}
local theme = require("shinjuku.theme")

-- Go trough the table and highlight the group with the color values
util.highlight = function(group, color)
  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
  local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
  local sp = color.sp and "guisp=" .. color.sp or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  vim.cmd(hl)
  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  end
end

-- Only define shinjuku if it's the active colorscheme
function util.onColorScheme()
  if vim.g.colors_name ~= "shinjuku" then
    vim.cmd([[autocmd! shinjuku]])
    vim.cmd([[augroup! shinjuku]])
  end
end

-- Change the background for the terminal, packer and qf windows
util.contrast = function()
  vim.cmd([[augroup shinjuku]])
  vim.cmd([[  autocmd!]])
  vim.cmd([[  autocmd ColorScheme * lua require("shinjuku.util").onColorScheme()]])
  vim.cmd([[  autocmd TermOpen * setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]])
  vim.cmd([[  autocmd FileType packer setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]])
  vim.cmd([[  autocmd FileType qf setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]])
  vim.cmd([[augroup end]])
end
-- Loads the colors from the dictionary Object (colorSet)
function util.loadColorSet(colorSet)
  for group, colors in pairs(colorSet) do
    util.highlight(group, colors)
  end
end

-- Load the theme
function util.load()
  -- Set the theme environment
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  -- vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "shinjuku"

  -- load the most importaint parts of the theme
  local editor = theme.loadEditor()
  local syntax = theme.loadSyntax()
  local treesitter = theme.loadTreeSitter()
  local filetypes = theme.loadFiletypes()

  -- load editor highlights
  util.loadColorSet(editor)

  -- load syntax highlights
  util.loadColorSet(syntax)

  -- load treesitter highlights
  util.loadColorSet(treesitter)

  -- load filetype-specific highlights
  util.loadColorSet(filetypes)

  theme.loadTerminal()

  -- imort tables for plugins and lsp
  local plugins = theme.loadPlugins()
  local lsp = theme.loadLSP()

  -- load plugin highlights
  util.loadColorSet(plugins)

  -- load lsp highlights
  util.loadColorSet(lsp)

  -- if contrast is enabled, apply it to sidebars and floating windows
  if vim.g.shinjuku_contrast == true then
    util.contrast()
  end

  util.dynamicCursorLine()
end

-- Sets autocommand to change cursorline in insert mode
function util.dynamicCursorLine()
  if not vim.g.shinjuku_cursorline_transparent then
    local colors = require("shinjuku.colors")

    function ShinjukuEnterInsertMode()
      vim.cmd("highlight CursorLine guibg=BLACK guifg=NONE")
      vim.cmd("highlight CursorLineNr guibg=BLACK guifg=NONE")
    end

    function ShinjukuLeaveInsertMode()
      vim.cmd("highlight CursorLine guibg=" .. colors.shinjuku11_gui .. " guifg=BLACK")
      vim.cmd("highlight CursorLineNr guibg=" .. colors.shinjuku11_gui .. " guifg=BLACK")
    end

    vim.cmd("autocmd InsertEnter * lua ShinjukuEnterInsertMode()")
    vim.cmd("autocmd InsertLeave * lua ShinjukuLeaveInsertMode()")
  end
end

return util
