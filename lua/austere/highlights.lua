local M = {}

---@param pallet Palette
---@return table
function M.get(pallet)
  local color = pallet
  local ret = {

    Normal = { fg = color.text, bg = color.bg }, -- Normal text
    Comment = { fg = color.faded_text, italic = true }, -- Any comment
    Constant = { fg = color.beige }, -- (*) Any constant
    String = { fg = color.green }, --   A string constant: "this is a string"
    Character = { fg = color.teal }, --   A character constant: 'c', '\n'
    Number = { fg = color.yellow }, --   A number constant: 234, 0xff
    Boolean = { fg = color.red }, --   A boolean constant: TRUE, false
    Float = { fg = color.yellow }, --   A floating point constant: 2.3e10
    Identifier = { fg = color.beige }, -- (*) Any variable name
    Function = { fg = color.orange }, --   Function name (also: methods for classes)
    Statement = { fg = color.purple }, -- (*) Any statement
    Conditional = { fg = color.purple }, --   if, then, else, endif, switch, etc.
    Repeat = { fg = color.cambridge_blue }, --   for, do, while, etc.
    Label = { fg = color.magenta }, --   case, default, etc.
    Operator = { fg = color.text }, --   "sizeof", "+", "*", etc.
    Keyword = { fg = color.purple }, --   any other keyword
    Exception = { fg = color.purple }, --   try, catch, throw

    PreProc = { fg = color.magenta }, -- (*) Generic Preprocessor
    Include = { fg = color.blue, bold = true }, --   Preprocessor #include
    Define = { fg = color.brightBlue }, --   Preprocessor #define
    Macro = { fg = color.orange }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type = { fg = color.cyan }, -- (*) int, long, char, etc.
    Typedef = { link = "Type" }, --   A typedef
    StorageClass = { fg = color.orange }, --   static, register, volatile, etc.
    Structure = { fg = color.orange }, --   struct, union, enum, etc.

    Special = { fg = color.silver }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined = { underline = true }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    Conceal = { fg = color.faded_text }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { reverse = true }, -- Character under the cursor
    -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn = { bg = Normal.bg.lighten(20) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine = { bg = Normal.bg.lighten(6) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    IblIndent = { fg = color.thin_line },
    VirtColumn = { fg = color.thin_line },
    ColorColumn = { fg = color.thin_line }, -- Columns set with 'colorcolumn'
    Directory = { fg = color.text }, -- Directory names (and other special names in listings)

    -- Tree-Sitter syntax groups.
    --
    -- ["@comment"] = { link = "Comment" }, -- Comment
    -- ["@comment.hint"] = { fg = color.silver },
    -- ["@comment.info"] = { fg = color.silver },
    -- ["@comment.note"] = { fg = color.teal },
    -- ["@comment.todo"] = { fg = color.cyan },
    -- ["@comment.warning"] = { fg = color.yellow },
    -- ["@constant"] = { link = "Constant" }, -- Constant
    -- ["@macro"] = { link = "Macro" }, -- Macro
    -- ["@string"] = { link = "String" }, -- String
    -- ["@markup.emphasis"] = { italic = true },
    -- ["@markup.environment"] = { link = "Macro" },
    -- ["@markup.environment.name"] = { link = "Type" },
    -- ["@markup.heading"] = { link = "Title" },
    -- ["@markup.italic"] = { italic = true },
    -- ["@markup.link"] = { fg = color.teal },
    -- ["@markup.link.label"] = { link = "SpecialChar" },
    -- ["@markup.link.label.symbol"] = { link = "Identifier" },
    -- ["@markup.link.url"] = { link = "Underlined" },
    -- ["@markup.list"] = { fg = color.blue }, -- For special punctutation that does not fall in the categories before.
    -- ["@markup.list.checked"] = { fg = color.green }, -- For brackets and parens.
    -- ["@markup.list.markdown"] = { fg = color.orange, bold = true },
    -- ["@markup.list.unchecked"] = { fg = color.blue }, -- For brackets and parens.
    -- ["@markup.math"] = { link = "Special" },
    -- ["@markup.raw"] = { link = "String" },
    -- ["@markup.raw.markdown_inline"] = { bg = color.float_bg, fg = color.blue },
    -- ["@constructor"] = { link = "Special" }, -- Special
    -- ["@operator"] = { link = "Operator" }, -- Operator
    -- ["@keyword"] = { link = "Keyword" }, -- Keyword
    ["@variable"] = { link = "Identifier" }, -- Identifier
    -- ["@tag"] = { link = "Label" },
    -- ["@type"] = { link = "Type" }, -- Type
    ["@type.definition"] = { link = "Typedef" }, -- Typedef
    -- ["@structure"] = { link = "Structure" }, -- Structure
    -- ["@include"] = { link = "Include" }, -- Include

    --
    -- Git
    GitAdded = { fg = color.green },
    GitChanged = { fg = color.blue },
    GitDeleted = { fg = color.red },

    diffAdded = { link = "GitAdded" },
    diffChanged = { link = "GitChanged" },
    diffDeleted = { link = "GitDeleted" },

    DiffAdd = { bg = color.diff_add_bg }, -- Diff mode: Added line |diff.txt|
    DiffChange = { bg = color.blue }, -- Diff mode: Changed line |diff.txt|
    DiffDelete = { fg = color.faded_text, bg = color.bg }, -- Diff mode: Deleted line |diff.txt|
    DiffText = { bg = color.cyan }, -- Diff mode: Changed text within a changed line |diff.txt|

    -- Diffview
    DiffviewDiffAdd = { bg = color.diff_add_bg },
    DiffviewDiffAddText = { bg = color.diff_add_bg },
    DiffviewDiffDelete = { bg = color.diff_delete_bg },
    DiffviewDiffDeleteText = { bg = color.diff_delete_bg },
    DiffviewDiffFill = { fg = color.faded_text, bg = color.bg },

    -- Gitsigns
    GitSignsAdd = { link = "GitAdded" },
    GitSignsChange = { link = "GitChanged" },
    GitSignsDelete = { link = "GitDeleted" },
    GitSignsAddPreview = { link = "DiffviewDiffAdd" },
    GitSignsDeletePreview = { link = "DiffviewDiffDelete" },
    GitSignsAddInline = { link = "DiffviewDiffAddText" },
    GitSignsDeleteInline = { link = "DiffviewDiffDeleteText" },

    -- EndOfBuffer  { }, -- Filler lines ~ after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    -- ErrorMsg     { }, -- Error messages on the command line
    -- VertSplit    { }, -- Column separating vertically split windows
    Folded = { fg = color.bg, bg = color.charcoal }, -- Line used for closed folds
    FoldColumn = { fg = color.charcoal, bg = color.bg }, -- 'foldcolumn'
    SignColumn = { fg = color.text, bg = color.bg }, -- Column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr = { fg = color.strong_faded_text }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = color.strong_faded_text, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = color.white, bg = color.cyan }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    MsgArea = { fg = color.strong_text }, -- Area for messages and cmdline
    ModeMsg = { link = "MsgArea" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    NonText = { fg = color.cyan }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat = { fg = color.text, bg = color.float_bg }, -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu = { fg = color.text, bg = color.float_bg }, -- Popup menu: Normal item.
    -- PmenuSel = { Pmenu, bg = Pmenu.bg.lighten(10) }, -- Popup menu: Selected item.
    -- PmenuSbar = { bg = Pmenu.bg.lighten(5) }, -- Popup menu: Scrollbar.d
    -- PmenuThumb = { bg = Pmenu.bg.lighten(15) }, -- Popup menu: Thumb of the scrollbar.
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { fg = color.bg, bg = color.cyan }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey = { fg = color.faded_text }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine = { bg = color.bar_bg }, -- Status line of current window
    StatusLineNC = { bg = color.bar_bg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = color.bar_bg }, -- Tab pages line, not active tab page label
    TabLineFill = { bg = color.bar_bg }, -- Tab pages line, where there are no labels
    TabLineSel = { bg = color.bar_bg }, -- Tab pages line, active tab page label
    Title = { fg = color.magenta, bold = true }, -- Titles for output from ":set all", ":autocmd" etc.
    -- NB!: VertSplit is dynamic. See functions below.
    VertSplit = { fg = color.bg }, -- Vertical split line
    Visual = { bg = color.english_violet, fg = color.silver }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg   { }, -- Warning messages
    Whitespace = { fg = color.faded_text }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator = { link = "VertSplit" }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu     { }, -- Current match in 'wildmenu' completion
    Winbar = { bg = color.bar_bg },
    WinbarNC = { bg = color.bar_bg },
    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    LspReferenceText = { underline = true }, -- Used for highlighting "text" references
    LspReferenceRead = { link = "LspReferenceText" }, -- Used for highlighting "read" references
    LspReferenceWrite = { link = "LspReferenceText" }, -- Used for highlighting "write" references
    LspInlayHint = { link = "Comment", bold = true },
    LspCodeLens = { link = "LspInlayHint" }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError = { fg = color.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn = { fg = color.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo = { fg = color.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint = { fg = color.silver }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError = { link = "DiagnosticError", undercurl = true }, -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn = { link = "DiagnosticWarn", undercurl = true }, -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo = { link = "DiagnosticInfo", undercurl = true }, -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint = { link = "DiagnosticHint", undercurl = true }, -- Used to underline "Hint" diagnostics.
    DiagnosticFloatingErrorLabel = { fg = color.float_bg, bg = color.red },
    DiagnosticFloatingWarnLabel = { fg = color.float_bg, bg = color.yellow },
    DiagnosticFloatingInfoLabel = { fg = color.float_bg, bg = color.blue },
    DiagnosticFloatingHintLabel = { fg = color.float_bg, bg = color.silver },
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    StatusBarSegmentNormal = { fg = color.bar_text, bg = color.bar_bg },
    StatusBarSegmentFaded = { fg = color.bar_faded_text, bg = color.bar_bg },
    StatusBarDiagnosticError = { fg = color.red, bg = color.bar_bg },
    StatusBarDiagnosticWarn = { fg = color.yellow, bg = color.bar_bg },
    StatusBarDiagnosticInfo = { fg = color.blue, bg = color.bar_bg },
    StatusBarDiagnosticHint = { fg = color.silver, bg = color.bar_bg },
    FloatTitle = { fg = color.bg, bg = color.cyan, bold = true },
    IndentBlanklineChar = { fg = color.thin_line },
    IndentBlanklineContextChar = { fg = color.thin_line },
    TodoComment = { fg = color.purple },
    FixmeComment = { fg = color.purple },
    HackComment = { fg = color.yellow },
    PriorityComment = { fg = color.orange },
    MiniStarterSection = { fg = color.text, bg = color.bg, bold = true },
    MiniStarterFooter = { link = "Comment" },
    NoiceCmdline = { bg = color.bar_bg },
    NoiceLspProgressTitle = { fg = color.bar_faded_text, bg = color.bar_bg },
    NoiceLspProgressClient = { fg = color.charcoal, bg = color.bar_bg },
    NoiceLspProgressSpinner = { fg = color.yellow, bg = color.bar_bg },
    ZenBg = { fg = color.text, bg = color.bg },
    WinShiftMove = { bg = color.bg },
    TabsVsSpaces = { fg = color.faded_text, underline = true },
    FlashCurrent = { fg = color.bg, bg = color.green, bold = true },
    FlashMatch = { fg = color.bg, bg = color.cyan },
    FlashLabel = { fg = color.bg, bg = color.purple, bold = true },
    FlashPrompt = { bg = color.bar_bg },
    FlashPromptIcon = { bg = color.bar_bg },
    MiniCursorword = { bg = color.bg },
    NvimSurroundHighlight = { fg = color.bg, bg = color.cyan },
    TelescopeNormal = { bg = color.float_bg },
    TelescopeMatching = { fg = color.charcoal },
    TelescopeSelection = { bg = color.bg },
    TelescopeBorder = { fg = color.faded_text, bg = color.float_bg }, -- this is used for telescope titles
    TelescopeResultsDiffAdd = { link = "GitAdded" },
    TelescopeResultsDiffChange = { link = "GitChanged" },
    TelescopeResultsDiffDelete = { link = "GitDeleted" },
    TelescopePromptCounter = { link = "Comment" },

    NeoTreeRootName = { fg = color.strong_text, bold = true },
    NeoTreeDirectoryIcon = { fg = color.faded_text },
    NeoTreeFileIcon = { fg = color.faded_text },
    NeoTreeIndentMarker = { link = "IndentBlanklineChar" },
    NeoTreeGitAdded = { fg = color.green },
    NeoTreeGitUntracked = { fg = color.green },
    NeoTreeGitModified = { fg = color.blue },
    NeoTreeGitStaged = { fg = color.green },
    NeoTreeGitIgnored = { fg = color.faded_text },

    NotifyINFOIcon = { fg = color.blue },
    NotifyINFOTitle = { fg = color.blue },
    NotifyINFOBody = { fg = color.text, bg = color.float_bg },
    NotifyINFOBorder = { fg = color.float_bg, bg = color.float_bg },
    NotifyWARNIcon = { fg = color.yellow },
    NotifyWARNTitle = { fg = color.yellow },
    NotifyWARNBody = { fg = color.text, bg = color.float_bg },
    NotifyWARNBorder = { fg = color.float_bg, bg = color.float_bg },
    NotifyERRORIcon = { fg = color.red },
    NotifyERRORTitle = { fg = color.red },
    NotifyERRORBody = { fg = color.red, bg = color.float_bg },
    NotifyERRORBorder = { fg = color.float_bg, bg = color.float_bg },

    --- Cmp
    CmpItemMenu = { fg = color.blue },
    CmpItemAbbrMatch = { fg = color.orange, bold = true, force = true },
    CmpItemKindFunction = { link = "Function", force = true },
    CmpItemKindMethod = { link = "Function" },
    CmpItemKindClass = { link = "Type", force = true },
    CmpItemKindSnippet = { link = "Normal" },
    CmpItemKindConstant = { link = "Constant" },
    CmpItemKindEnum = { link = "Constant" },
    CmpItemKindVariable = { link = "Variable" },
    CmpItemKindKeyword = { link = "Keyword" },
    CmpItemKindFolder = { link = "Directory" },
  }

  return ret
end

return M