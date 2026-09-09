" Vim color scheme
" Name:         kanagawa.vim
" Maintainer:   Vim port based on Kanagawa theme
" License:      MIT
" Version:      1.0.0
" URL:          https://github.com/cellsummer/vim-colorschemes
" Credits:      Original Kanagawa theme by rebelot
"               https://github.com/rebelot/kanagawa.nvim
"               Inspired by "The Great Wave off Kanagawa" by Katsushika Hokusai

" Vim 9.1 color scheme for Kanagawa
" Supports: SQL, Python, Markdown, VBNET, and nvim-coc

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "kanagawa"

" Kanagawa Color Palette
let s:fujiWhite      = '#DCD7BA'
let s:oldWhite       = '#C8C093'
let s:sumiInk0       = '#16161D'
let s:sumiInk1       = '#1F1F28'
let s:sumiInk2       = '#2A2A37'
let s:sumiInk3       = '#363646'
let s:sumiInk4       = '#54546D'
let s:waveBlue1      = '#223249'
let s:waveBlue2      = '#2D4F67'
let s:winterGreen    = '#2B3328'
let s:winterYellow   = '#49443C'
let s:winterRed      = '#43242B'
let s:winterBlue     = '#252535'
let s:autumnGreen    = '#76946A'
let s:autumnRed      = '#C34043'
let s:autumnYellow   = '#DCA561'
let s:samuraiRed     = '#E82424'
let s:roninYellow    = '#FF9E3B'
let s:waveAqua1      = '#6A9589'
let s:dragonBlue     = '#658594'
let s:fujiGray       = '#727169'
let s:crystalBlue    = '#7E9CD8'
let s:springBlue     = '#7FB4CA'
let s:lightBlue      = '#A3D4D5'
let s:waveAqua2      = '#7AA89F'
let s:springGreen    = '#98BB6C'
let s:boatYellow1    = '#938056'
let s:boatYellow2    = '#C0A36E'
let s:carpYellow     = '#E6C384'
let s:sakuraPink     = '#D27E99'
let s:waveRed        = '#E46876'
let s:peachRed       = '#FF5D62'
let s:surimiOrange   = '#FFA066'
let s:katanaGray     = '#717C7C'
let s:none           = 'NONE'

" Helper function to set highlights
" Set g:kanagawa_disable_italic = 1 to disable all italic formatting
function! s:Hi(group, fg, bg, attr)
  let l:attr = a:attr
  if get(g:, 'kanagawa_disable_italic', 0)
    let l:attr = substitute(l:attr, ',\?italic,\?', '', 'g')
    let l:attr = substitute(l:attr, '^,\|,$', '', 'g')
    if l:attr == ''
      let l:attr = 'NONE'
    endif
  endif
  let l:cmd = 'highlight ' . a:group
  if a:fg != ''
    let l:cmd .= ' guifg=' . a:fg
  endif
  if a:bg != ''
    let l:cmd .= ' guibg=' . a:bg
  endif
  if l:attr != ''
    let l:cmd .= ' gui=' . l:attr
  endif
  execute l:cmd
endfunction

" Editor UI
call s:Hi('Normal', s:fujiWhite, s:sumiInk1, s:none)
call s:Hi('Cursor', s:sumiInk1, s:crystalBlue, s:none)
call s:Hi('CursorLine', '', s:sumiInk3, s:none)
call s:Hi('CursorLineNr', s:crystalBlue, s:sumiInk3, s:none)
call s:Hi('LineNr', s:sumiInk4, '', s:none)
call s:Hi('Visual', '', s:waveBlue1, s:none)
call s:Hi('VisualNOS', '', s:waveBlue2, s:none)
call s:Hi('Search', s:sumiInk1, s:autumnYellow, s:none)
call s:Hi('IncSearch', s:sumiInk1, s:roninYellow, 'bold')
call s:Hi('MatchParen', s:roninYellow, '', 'bold')
call s:Hi('Pmenu', s:fujiWhite, s:sumiInk0, s:none)
call s:Hi('PmenuSel', s:sumiInk1, s:waveBlue2, s:none)
call s:Hi('PmenuSbar', '', s:sumiInk2, s:none)
call s:Hi('PmenuThumb', '', s:sumiInk4, s:none)
call s:Hi('StatusLine', s:fujiWhite, s:sumiInk0, s:none)
call s:Hi('StatusLineNC', s:oldWhite, s:sumiInk0, s:none)
call s:Hi('VertSplit', s:sumiInk4, s:sumiInk1, s:none)
call s:Hi('TabLine', s:oldWhite, s:sumiInk0, s:none)
call s:Hi('TabLineFill', '', s:sumiInk0, s:none)
call s:Hi('TabLineSel', s:fujiWhite, s:sumiInk2, 'bold')
call s:Hi('Folded', s:fujiGray, s:sumiInk2, s:none)
call s:Hi('FoldColumn', s:sumiInk4, s:sumiInk1, s:none)
call s:Hi('SignColumn', '', s:sumiInk1, s:none)
call s:Hi('ColorColumn', '', s:sumiInk2, s:none)
call s:Hi('NonText', s:sumiInk4, '', s:none)
call s:Hi('SpecialKey', s:sumiInk4, '', s:none)
call s:Hi('Directory', s:crystalBlue, '', s:none)
call s:Hi('Title', s:crystalBlue, '', 'bold')
call s:Hi('Question', s:springGreen, '', s:none)
call s:Hi('MoreMsg', s:springGreen, '', s:none)
call s:Hi('WarningMsg', s:roninYellow, '', s:none)
call s:Hi('ErrorMsg', s:samuraiRed, s:fujiGray, 'bold')
call s:Hi('Error', s:samuraiRed, s:fujiGray, 'bold')
call s:Hi('Todo', s:roninYellow, s:sumiInk2, 'bold,italic')
call s:Hi('Underlined', s:crystalBlue, '', 'underline')
call s:Hi('Ignore', s:sumiInk4, '', s:none)

" Diff
call s:Hi('DiffAdd', s:autumnGreen, s:sumiInk2, s:none)
call s:Hi('DiffChange', s:autumnYellow, s:sumiInk2, s:none)
call s:Hi('DiffDelete', s:autumnRed, s:sumiInk2, s:none)
call s:Hi('DiffText', s:springBlue, s:sumiInk3, s:none)

" Spell
call s:Hi('SpellBad', s:samuraiRed, '', 'undercurl')
call s:Hi('SpellCap', s:crystalBlue, '', 'undercurl')
call s:Hi('SpellLocal', s:waveAqua1, '', 'undercurl')
call s:Hi('SpellRare', s:sakuraPink, '', 'undercurl')

" Standard Syntax Highlighting
call s:Hi('Comment', s:fujiGray, '', 'italic')
call s:Hi('Constant', s:surimiOrange, '', s:none)
call s:Hi('String', s:springGreen, '', s:none)
call s:Hi('Character', s:springGreen, '', s:none)
call s:Hi('Number', s:sakuraPink, '', s:none)
call s:Hi('Boolean', s:surimiOrange, '', s:none)
call s:Hi('Float', s:sakuraPink, '', s:none)
call s:Hi('Identifier', s:carpYellow, '', s:none)
call s:Hi('Function', s:crystalBlue, '', s:none)
call s:Hi('Statement', s:roninYellow, '', s:none)
call s:Hi('Conditional', s:roninYellow, '', 'italic')
call s:Hi('Repeat', s:roninYellow, '', s:none)
call s:Hi('Label', s:roninYellow, '', s:none)
call s:Hi('Operator', s:boatYellow2, '', s:none)
call s:Hi('Keyword', s:roninYellow, '', s:none)
call s:Hi('Exception', s:peachRed, '', s:none)
call s:Hi('PreProc', s:waveRed, '', s:none)
call s:Hi('Include', s:surimiOrange, '', s:none)
call s:Hi('Define', s:waveRed, '', 'italic')
call s:Hi('Macro', s:crystalBlue, '', s:none)
call s:Hi('PreCondit', s:waveRed, '', s:none)
call s:Hi('Type', s:waveAqua2, '', 'italic')
call s:Hi('StorageClass', s:roninYellow, '', 'italic')
call s:Hi('Structure', s:waveAqua2, '', 'italic')
call s:Hi('Typedef', s:waveAqua2, '', 'italic')
call s:Hi('Special', s:springBlue, '', s:none)
call s:Hi('SpecialChar', s:sakuraPink, '', s:none)
call s:Hi('Tag', s:roninYellow, '', s:none)
call s:Hi('Delimiter', s:carpYellow, '', s:none)
call s:Hi('SpecialComment', s:autumnYellow, '', 'italic')
call s:Hi('Debug', s:samuraiRed, '', s:none)

" Python Specific
call s:Hi('pythonInclude', s:surimiOrange, '', s:none)
call s:Hi('pythonImport', s:surimiOrange, '', s:none)
call s:Hi('pythonStatement', s:roninYellow, '', s:none)
call s:Hi('pythonConditional', s:roninYellow, '', 'italic')
call s:Hi('pythonRepeat', s:roninYellow, '', s:none)
call s:Hi('pythonException', s:peachRed, '', s:none)
call s:Hi('pythonFunction', s:crystalBlue, '', s:none)
call s:Hi('pythonDecorator', s:waveRed, '', 'italic')
call s:Hi('pythonDecoratorName', s:waveRed, '', 'italic')
call s:Hi('pythonBuiltin', s:springBlue, '', 'italic')
call s:Hi('pythonBuiltinObj', s:springBlue, '', 'italic')
call s:Hi('pythonBuiltinFunc', s:springBlue, '', 'italic')
call s:Hi('pythonString', s:springGreen, '', s:none)
call s:Hi('pythonRawString', s:springGreen, '', s:none)
call s:Hi('pythonEscape', s:sakuraPink, '', s:none)
call s:Hi('pythonNumber', s:sakuraPink, '', s:none)
call s:Hi('pythonBoolean', s:surimiOrange, '', s:none)
call s:Hi('pythonOperator', s:boatYellow2, '', s:none)
call s:Hi('pythonComment', s:fujiGray, '', 'italic')
call s:Hi('pythonDocstring', s:fujiGray, '', 'italic')
call s:Hi('pythonSelf', s:waveRed, '', 'italic')
call s:Hi('pythonClass', s:crystalBlue, '', s:none)
call s:Hi('pythonClassVar', s:carpYellow, '', s:none)

" SQL Specific
call s:Hi('sqlStatement', s:roninYellow, '', s:none)
call s:Hi('sqlKeyword', s:roninYellow, '', s:none)
call s:Hi('sqlConditional', s:roninYellow, '', 'italic')
call s:Hi('sqlOperator', s:boatYellow2, '', s:none)
call s:Hi('sqlSpecial', s:springBlue, '', s:none)
call s:Hi('sqlFunction', s:crystalBlue, '', 'italic')
call s:Hi('sqlString', s:springGreen, '', s:none)
call s:Hi('sqlNumber', s:sakuraPink, '', s:none)
call s:Hi('sqlType', s:waveAqua2, '', 'italic')
call s:Hi('sqlComment', s:fujiGray, '', 'italic')
call s:Hi('sqlTodo', s:roninYellow, s:sumiInk2, 'bold,italic')
call s:Hi('sqlTable', s:carpYellow, '', s:none)
call s:Hi('sqlColumn', s:carpYellow, '', s:none)
call s:Hi('sqlConstant', s:surimiOrange, '', s:none)
call s:Hi('sqlKeywordCommand', s:roninYellow, '', s:none)
call s:Hi('sqlKeywordCreate', s:roninYellow, '', s:none)
call s:Hi('sqlKeywordSelect', s:roninYellow, '', s:none)
call s:Hi('sqlKeywordInsert', s:roninYellow, '', s:none)
call s:Hi('sqlKeywordUpdate', s:roninYellow, '', s:none)
call s:Hi('sqlKeywordDelete', s:roninYellow, '', s:none)

" Markdown Specific
call s:Hi('markdownH1', s:crystalBlue, '', 'bold')
call s:Hi('markdownH2', s:crystalBlue, '', 'bold')
call s:Hi('markdownH3', s:crystalBlue, '', 'bold')
call s:Hi('markdownH4', s:springBlue, '', 'bold')
call s:Hi('markdownH5', s:springBlue, '', 'bold')
call s:Hi('markdownH6', s:springBlue, '', 'bold')
call s:Hi('markdownHeadingDelimiter', s:crystalBlue, '', 'bold')
call s:Hi('markdownHeadingRule', s:crystalBlue, '', 'bold')
call s:Hi('markdownBold', s:fujiWhite, '', 'bold')
call s:Hi('markdownItalic', s:fujiWhite, '', 'italic')
call s:Hi('markdownBoldItalic', s:fujiWhite, '', 'bold,italic')
call s:Hi('markdownCode', s:springGreen, '', s:none)
call s:Hi('markdownCodeBlock', s:springGreen, '', s:none)
call s:Hi('markdownCodeDelimiter', s:autumnGreen, '', s:none)
call s:Hi('markdownBlockquote', s:fujiGray, '', 'italic')
call s:Hi('markdownListMarker', s:roninYellow, '', s:none)
call s:Hi('markdownOrderedListMarker', s:roninYellow, '', s:none)
call s:Hi('markdownRule', s:sumiInk4, '', s:none)
call s:Hi('markdownUrl', s:springBlue, '', 'underline')
call s:Hi('markdownLink', s:waveAqua1, '', s:none)
call s:Hi('markdownLinkText', s:waveAqua1, '', s:none)
call s:Hi('markdownLinkDelimiter', s:carpYellow, '', s:none)
call s:Hi('markdownLinkTextDelimiter', s:carpYellow, '', s:none)
call s:Hi('markdownIdDeclaration', s:springBlue, '', s:none)
call s:Hi('markdownId', s:springBlue, '', s:none)
call s:Hi('markdownAutomaticLink', s:springBlue, '', 'underline')
call s:Hi('markdownError', s:samuraiRed, '', s:none)

" VBNET Specific
call s:Hi('vbStatement', s:roninYellow, '', s:none)
call s:Hi('vbConditional', s:roninYellow, '', 'italic')
call s:Hi('vbRepeat', s:roninYellow, '', s:none)
call s:Hi('vbOperator', s:boatYellow2, '', s:none)
call s:Hi('vbKeyword', s:roninYellow, '', s:none)
call s:Hi('vbFunction', s:crystalBlue, '', s:none)
call s:Hi('vbMethods', s:crystalBlue, '', s:none)
call s:Hi('vbBoolean', s:surimiOrange, '', s:none)
call s:Hi('vbConst', s:surimiOrange, '', s:none)
call s:Hi('vbNumber', s:sakuraPink, '', s:none)
call s:Hi('vbString', s:springGreen, '', s:none)
call s:Hi('vbComment', s:fujiGray, '', 'italic')
call s:Hi('vbLineNumber', s:sumiInk4, '', s:none)
call s:Hi('vbTypeSpecifier', s:waveAqua2, '', 'italic')
call s:Hi('vbType', s:waveAqua2, '', 'italic')
call s:Hi('vbDefine', s:waveRed, '', 'italic')
call s:Hi('vbEvents', s:roninYellow, '', s:none)
call s:Hi('vbIdentifier', s:carpYellow, '', s:none)
call s:Hi('vbTodo', s:roninYellow, s:sumiInk2, 'bold,italic')
call s:Hi('vbLabel', s:roninYellow, '', s:none)
call s:Hi('vbException', s:peachRed, '', s:none)

" nvim-coc (Conquer of Completion) Highlight Groups
" Diagnostic Signs
call s:Hi('CocErrorSign', s:samuraiRed, s:sumiInk1, s:none)
call s:Hi('CocWarningSign', s:roninYellow, s:sumiInk1, s:none)
call s:Hi('CocInfoSign', s:waveAqua1, s:sumiInk1, s:none)
call s:Hi('CocHintSign', s:dragonBlue, s:sumiInk1, s:none)

" Diagnostic Virtual Text
call s:Hi('CocErrorVirtualText', s:samuraiRed, '', s:none)
call s:Hi('CocWarningVirtualText', s:roninYellow, '', s:none)
call s:Hi('CocInfoVirtualText', s:waveAqua1, '', s:none)
call s:Hi('CocHintVirtualText', s:dragonBlue, '', s:none)

" Diagnostic Highlighting
call s:Hi('CocErrorHighlight', '', '', 'undercurl')
call s:Hi('CocWarningHighlight', '', '', 'undercurl')
call s:Hi('CocInfoHighlight', '', '', 'undercurl')
call s:Hi('CocHintHighlight', '', '', 'undercurl')

" Diagnostic Float
call s:Hi('CocErrorFloat', s:samuraiRed, s:sumiInk0, s:none)
call s:Hi('CocWarningFloat', s:roninYellow, s:sumiInk0, s:none)
call s:Hi('CocInfoFloat', s:waveAqua1, s:sumiInk0, s:none)
call s:Hi('CocHintFloat', s:dragonBlue, s:sumiInk0, s:none)

" Float Windows
call s:Hi('CocFloating', s:fujiWhite, s:sumiInk0, s:none)
call s:Hi('CocFloatBorder', s:sumiInk4, s:sumiInk0, s:none)
call s:Hi('CocFloatDividingLine', s:sumiInk4, s:sumiInk0, s:none)

" Menu
call s:Hi('CocMenuSel', s:sumiInk1, s:lightBlue, s:none)
call s:Hi('CocSelectedText', s:lightBlue, '', s:none)

" Completion
call s:Hi('CocPumMenu', s:fujiWhite, s:sumiInk0, s:none)
call s:Hi('CocPumShortcut', s:oldWhite, s:sumiInk0, s:none)
call s:Hi('CocPumDetail', s:autumnYellow, s:sumiInk0, s:none)
call s:Hi('CocPumVirtualText', s:fujiGray, s:sumiInk0, s:none)

" Highlight (references, document highlight)
call s:Hi('CocHighlightText', '', s:waveBlue1, s:none)
call s:Hi('CocHighlightRead', '', s:waveBlue1, s:none)
call s:Hi('CocHighlightWrite', '', s:waveBlue1, 'underline')

" Cursor
call s:Hi('CocCursorRange', '', s:waveBlue2, s:none)

" Code Lens
call s:Hi('CocCodeLens', s:fujiGray, '', 'italic')

" Semantic Highlighting
call s:Hi('CocSem_namespace', s:springBlue, '', s:none)
call s:Hi('CocSem_type', s:waveAqua2, '', 'italic')
call s:Hi('CocSem_class', s:waveAqua2, '', 'italic')
call s:Hi('CocSem_enum', s:waveAqua2, '', 'italic')
call s:Hi('CocSem_interface', s:waveAqua2, '', 'italic')
call s:Hi('CocSem_struct', s:waveAqua2, '', 'italic')
call s:Hi('CocSem_typeParameter', s:waveAqua2, '', 'italic')
call s:Hi('CocSem_parameter', s:carpYellow, '', s:none)
call s:Hi('CocSem_variable', s:carpYellow, '', s:none)
call s:Hi('CocSem_property', s:carpYellow, '', s:none)
call s:Hi('CocSem_enumMember', s:surimiOrange, '', s:none)
call s:Hi('CocSem_event', s:roninYellow, '', s:none)
call s:Hi('CocSem_function', s:crystalBlue, '', s:none)
call s:Hi('CocSem_method', s:crystalBlue, '', s:none)
call s:Hi('CocSem_macro', s:crystalBlue, '', s:none)
call s:Hi('CocSem_keyword', s:roninYellow, '', s:none)
call s:Hi('CocSem_modifier', s:roninYellow, '', s:none)
call s:Hi('CocSem_comment', s:fujiGray, '', 'italic')
call s:Hi('CocSem_string', s:springGreen, '', s:none)
call s:Hi('CocSem_number', s:sakuraPink, '', s:none)
call s:Hi('CocSem_regexp', s:boatYellow2, '', s:none)
call s:Hi('CocSem_operator', s:boatYellow2, '', s:none)
call s:Hi('CocSem_decorator', s:waveRed, '', 'italic')

" Deprecated/Unused
call s:Hi('CocDeprecatedHighlight', '', '', 'strikethrough')
call s:Hi('CocUnusedHighlight', s:katanaGray, '', 'italic')

" Symbols
call s:Hi('CocSymbolDefault', s:fujiWhite, '', s:none)
call s:Hi('CocSymbolFile', s:fujiWhite, '', s:none)
call s:Hi('CocSymbolModule', s:springBlue, '', s:none)
call s:Hi('CocSymbolNamespace', s:springBlue, '', s:none)
call s:Hi('CocSymbolPackage', s:springBlue, '', s:none)
call s:Hi('CocSymbolClass', s:waveAqua2, '', s:none)
call s:Hi('CocSymbolMethod', s:crystalBlue, '', s:none)
call s:Hi('CocSymbolProperty', s:carpYellow, '', s:none)
call s:Hi('CocSymbolField', s:carpYellow, '', s:none)
call s:Hi('CocSymbolConstructor', s:crystalBlue, '', s:none)
call s:Hi('CocSymbolEnum', s:waveAqua2, '', s:none)
call s:Hi('CocSymbolInterface', s:waveAqua2, '', s:none)
call s:Hi('CocSymbolFunction', s:crystalBlue, '', s:none)
call s:Hi('CocSymbolVariable', s:carpYellow, '', s:none)
call s:Hi('CocSymbolConstant', s:surimiOrange, '', s:none)
call s:Hi('CocSymbolString', s:springGreen, '', s:none)
call s:Hi('CocSymbolNumber', s:sakuraPink, '', s:none)
call s:Hi('CocSymbolBoolean', s:surimiOrange, '', s:none)
call s:Hi('CocSymbolArray', s:carpYellow, '', s:none)
call s:Hi('CocSymbolObject', s:carpYellow, '', s:none)
call s:Hi('CocSymbolKey', s:roninYellow, '', s:none)
call s:Hi('CocSymbolNull', s:surimiOrange, '', s:none)
call s:Hi('CocSymbolEnumMember', s:surimiOrange, '', s:none)
call s:Hi('CocSymbolStruct', s:waveAqua2, '', s:none)
call s:Hi('CocSymbolEvent', s:roninYellow, '', s:none)
call s:Hi('CocSymbolOperator', s:boatYellow2, '', s:none)
call s:Hi('CocSymbolTypeParameter', s:waveAqua2, '', s:none)

" Git Gutter Integration
call s:Hi('GitGutterAdd', s:autumnGreen, s:sumiInk1, s:none)
call s:Hi('GitGutterChange', s:autumnYellow, s:sumiInk1, s:none)
call s:Hi('GitGutterDelete', s:autumnRed, s:sumiInk1, s:none)
call s:Hi('GitGutterChangeDelete', s:peachRed, s:sumiInk1, s:none)

" Terminal Colors (for :terminal)
if has('nvim')
  let g:terminal_color_0  = s:sumiInk0
  let g:terminal_color_1  = s:autumnRed
  let g:terminal_color_2  = s:autumnGreen
  let g:terminal_color_3  = s:carpYellow
  let g:terminal_color_4  = s:crystalBlue
  let g:terminal_color_5  = s:roninYellow
  let g:terminal_color_6  = s:springBlue
  let g:terminal_color_7  = s:fujiWhite
  let g:terminal_color_8  = s:fujiGray
  let g:terminal_color_9  = s:samuraiRed
  let g:terminal_color_10 = s:autumnGreen
  let g:terminal_color_11 = s:autumnYellow
  let g:terminal_color_12 = s:springBlue
  let g:terminal_color_13 = s:sakuraPink
  let g:terminal_color_14 = s:waveAqua1
  let g:terminal_color_15 = s:oldWhite
elseif has('terminal')
  let g:terminal_ansi_colors = [
    \ s:sumiInk0, s:autumnRed, s:autumnGreen, s:carpYellow,
    \ s:crystalBlue, s:roninYellow, s:springBlue, s:fujiWhite,
    \ s:fujiGray, s:samuraiRed, s:autumnGreen, s:autumnYellow,
    \ s:springBlue, s:sakuraPink, s:waveAqua1, s:oldWhite
    \ ]
endif
