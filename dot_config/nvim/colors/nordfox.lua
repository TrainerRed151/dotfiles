-- Minimal Nordfox-inspired colorscheme (no dependencies)

vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "nordfox"

-- Nord-like palette
local c = {
  bg      = "#2e3440",
  bg2     = "#3b4252",
  fg      = "#d8dee9",
  comment = "#7b88a1",

  red     = "#bf616a",
  orange  = "#d08770",
  yellow  = "#ebcb8b",
  green   = "#a3be8c",
  cyan    = "#88c0d0",
  blue    = "#81a1c1",
  purple  = "#b48ead",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- UI
hl("Normal",        { fg = c.fg, bg = c.bg })
hl("NormalFloat",   { fg = c.fg, bg = c.bg2 })
hl("FloatBorder",   { fg = c.bg2, bg = c.bg })

hl("CursorLine",    { bg = c.bg2 })
hl("Visual",        { bg = c.bg2 })

hl("LineNr",        { fg = c.comment })
hl("CursorLineNr",  { fg = c.yellow })

hl("StatusLine",    { fg = c.fg, bg = c.bg2 })
hl("VertSplit",     { fg = c.bg2 })

-- Syntax (basic but usable)
hl("Comment",   { fg = c.comment, italic = true })
hl("Keyword",   { fg = c.purple, bold = true })
hl("String",    { fg = c.green })
hl("Number",    { fg = c.orange })
hl("Boolean",   { fg = c.orange })

hl("Function",  { fg = c.blue })
hl("Identifier",{ fg = c.fg })
hl("Type",      { fg = c.cyan })

hl("Error",     { fg = c.red })
hl("Todo",      { fg = c.yellow, bold = true })

-- Diagnostics (LSP)
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn",  { fg = c.yellow })
hl("DiagnosticInfo",  { fg = c.blue })
hl("DiagnosticHint",  { fg = c.comment })

-- Optional: links for Treesitter
hl("@comment",   { link = "Comment" })
hl("@string",    { link = "String" })
hl("@keyword",   { link = "Keyword" })
hl("@function",  { link = "Function" })
hl("@type",      { link = "Type" })
