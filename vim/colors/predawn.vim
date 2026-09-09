" Vim color scheme
" Name:         predawn.vim
" Maintainer:   Vim port based on Sublime Predawn theme
" License:      MIT
" Version:      1.0.0
" URL:          https://github.com/cellsummer/vim-colorschemes
" Credits:      Original Predawn theme by Jamie Wilson
"               https://github.com/jamiewilson/predawn

" Vim 9.1 color scheme for Predawn
" Supports: SQL, Python, Markdown, VBNET, and nvim-coc

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "predawn"

" Color Definitions
let s:predawn    = '#F18260'
let s:pale_yellow = '#F5F5AE'
let s:yellow     = '#EDE480'
let s:orange     = '#F49D62'
let s:red        = '#CF5340'
let s:dark_red   = '#893121'
let s:maroon     = '#55201B'
let s:pale_blue  = '#BDDCDC'
let s:blue       = '#92BFBF'
let s:slate      = '#5F777E'
let s:green      = '#B4D388'
let s:pale_green = '#D0EDA7'
let s:dark_green = '#809161'
let s:white      = '#F1F1F1'
let s:grey_1     = '#999999'
let s:grey_2     = '#777777'
let s:grey_3     = '#4C4C4C'
let s:grey_4     = '#3C3C3C'
let s:grey_5     = '#282828'
let s:grey_7     = '#232323'
let s:black      = '#151515'
let s:none       = 'NONE'

" Helper function to set highlights
" Set g:predawn_disable_italic = 1 to disable all italic formatting
function! s:Hi(group, fg, bg, attr)
  let l:attr = a:attr
  if get(g:, 'predawn_disable_italic', 0)
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
call s:Hi('Normal', s:white, s:grey_5, s:none)
call s:Hi('Cursor', s:grey_5, s:yellow, s:none)
call s:Hi('CursorLine', '', s:grey_7, s:none)
call s:Hi('CursorLineNr', s:predawn, s:grey_7, s:none)
call s:Hi('LineNr', s:grey_3, '', s:none)
call s:Hi('Visual', '', s:grey_3, s:none)
call s:Hi('VisualNOS', '', s:grey_4, s:none)
call s:Hi('Search', s:black, s:predawn, s:none)
call s:Hi('IncSearch', s:black, s:predawn, 'bold')
call s:Hi('MatchParen', s:predawn, '', 'bold')
call s:Hi('Pmenu', s:white, s:grey_4, s:none)
call s:Hi('PmenuSel', s:black, s:predawn, s:none)
call s:Hi('PmenuSbar', '', s:grey_3, s:none)
call s:Hi('PmenuThumb', '', s:grey_1, s:none)
call s:Hi('StatusLine', s:white, s:grey_4, s:none)
call s:Hi('StatusLineNC', s:grey_2, s:grey_5, s:none)
call s:Hi('VertSplit', s:grey_3, s:grey_5, s:none)
call s:Hi('TabLine', s:grey_2, s:grey_4, s:none)
call s:Hi('TabLineFill', '', s:grey_5, s:none)
call s:Hi('TabLineSel', s:white, s:grey_5, 'bold')
call s:Hi('Folded', s:grey_2, s:grey_4, s:none)
call s:Hi('FoldColumn', s:grey_3, s:grey_5, s:none)
call s:Hi('SignColumn', '', s:grey_5, s:none)
call s:Hi('ColorColumn', '', s:grey_7, s:none)
call s:Hi('NonText', s:grey_3, '', s:none)
call s:Hi('SpecialKey', s:grey_2, '', s:none)
call s:Hi('Directory', s:blue, '', s:none)
call s:Hi('Title', s:orange, '', 'bold')
call s:Hi('Question', s:green, '', s:none)
call s:Hi('MoreMsg', s:green, '', s:none)
call s:Hi('WarningMsg', s:yellow, '', s:none)
call s:Hi('ErrorMsg', s:red, s:grey_5, 'bold')
call s:Hi('Error', s:red, s:grey_5, 'bold')
call s:Hi('Todo', s:yellow, s:grey_4, 'bold,italic')
call s:Hi('Underlined', s:blue, '', 'underline')
call s:Hi('Ignore', s:grey_3, '', s:none)

" Diff
call s:Hi('DiffAdd', s:green, s:grey_7, s:none)
call s:Hi('DiffChange', s:yellow, s:grey_7, s:none)
call s:Hi('DiffDelete', s:red, s:grey_7, s:none)
call s:Hi('DiffText', s:blue, s:grey_4, s:none)

" Spell
call s:Hi('SpellBad', s:red, '', 'undercurl')
call s:Hi('SpellCap', s:blue, '', 'undercurl')
call s:Hi('SpellLocal', s:pale_blue, '', 'undercurl')
call s:Hi('SpellRare', s:orange, '', 'undercurl')

" Standard Syntax Highlighting
call s:Hi('Comment', s:grey_2, '', 'italic')
call s:Hi('Constant', s:yellow, '', s:none)
call s:Hi('String', s:pale_blue, '', s:none)
call s:Hi('Character', s:pale_blue, '', s:none)
call s:Hi('Number', s:yellow, '', s:none)
call s:Hi('Boolean', s:green, '', s:none)
call s:Hi('Float', s:yellow, '', s:none)
call s:Hi('Identifier', s:white, '', s:none)
call s:Hi('Function', s:pale_yellow, '', s:none)
call s:Hi('Statement', s:orange, '', s:none)
call s:Hi('Conditional', s:yellow, '', 'italic')
call s:Hi('Repeat', s:orange, '', s:none)
call s:Hi('Label', s:orange, '', s:none)
call s:Hi('Operator', s:orange, '', s:none)
call s:Hi('Keyword', s:orange, '', s:none)
call s:Hi('Exception', s:red, '', s:none)
call s:Hi('PreProc', s:blue, '', s:none)
call s:Hi('Include', s:orange, '', s:none)
call s:Hi('Define', s:blue, '', 'italic')
call s:Hi('Macro', s:pale_yellow, '', s:none)
call s:Hi('PreCondit', s:blue, '', s:none)
call s:Hi('Type', s:yellow, '', 'italic')
call s:Hi('StorageClass', s:yellow, '', 'italic')
call s:Hi('Structure', s:yellow, '', 'italic')
call s:Hi('Typedef', s:yellow, '', 'italic')
call s:Hi('Special', s:blue, '', s:none)
call s:Hi('SpecialChar', s:orange, '', s:none)
call s:Hi('Tag', s:green, '', s:none)
call s:Hi('Delimiter', s:white, '', s:none)
call s:Hi('SpecialComment', s:grey_1, '', 'italic')
call s:Hi('Debug', s:red, '', s:none)

" Python Specific
call s:Hi('pythonInclude', s:orange, '', s:none)
call s:Hi('pythonImport', s:orange, '', s:none)
call s:Hi('pythonStatement', s:orange, '', s:none)
call s:Hi('pythonConditional', s:yellow, '', 'italic')
call s:Hi('pythonRepeat', s:orange, '', s:none)
call s:Hi('pythonException', s:red, '', s:none)
call s:Hi('pythonFunction', s:pale_yellow, '', s:none)
call s:Hi('pythonDecorator', s:orange, '', 'italic')
call s:Hi('pythonDecoratorName', s:orange, '', 'italic')
call s:Hi('pythonBuiltin', s:pale_yellow, '', 'italic')
call s:Hi('pythonBuiltinObj', s:pale_yellow, '', 'italic')
call s:Hi('pythonBuiltinFunc', s:pale_yellow, '', 'italic')
call s:Hi('pythonString', s:pale_blue, '', s:none)
call s:Hi('pythonRawString', s:pale_blue, '', s:none)
call s:Hi('pythonEscape', s:orange, '', s:none)
call s:Hi('pythonNumber', s:yellow, '', s:none)
call s:Hi('pythonBoolean', s:green, '', s:none)
call s:Hi('pythonOperator', s:orange, '', s:none)
call s:Hi('pythonComment', s:grey_2, '', 'italic')
call s:Hi('pythonDocstring', s:grey_2, '', 'italic')
call s:Hi('pythonSelf', s:orange, '', 'italic')
call s:Hi('pythonClass', s:pale_yellow, '', s:none)
call s:Hi('pythonClassVar', s:white, '', s:none)

" SQL Specific
call s:Hi('sqlStatement', s:orange, '', s:none)
call s:Hi('sqlKeyword', s:orange, '', s:none)
call s:Hi('sqlConditional', s:yellow, '', 'italic')
call s:Hi('sqlOperator', s:orange, '', s:none)
call s:Hi('sqlSpecial', s:blue, '', s:none)
call s:Hi('sqlFunction', s:pale_yellow, '', 'italic')
call s:Hi('sqlString', s:pale_blue, '', s:none)
call s:Hi('sqlNumber', s:yellow, '', s:none)
call s:Hi('sqlType', s:yellow, '', 'italic')
call s:Hi('sqlComment', s:grey_2, '', 'italic')
call s:Hi('sqlTodo', s:yellow, s:grey_4, 'bold,italic')
call s:Hi('sqlTable', s:white, '', s:none)
call s:Hi('sqlColumn', s:white, '', s:none)
call s:Hi('sqlConstant', s:yellow, '', s:none)
call s:Hi('sqlKeywordCommand', s:orange, '', s:none)
call s:Hi('sqlKeywordCreate', s:orange, '', s:none)
call s:Hi('sqlKeywordSelect', s:orange, '', s:none)
call s:Hi('sqlKeywordInsert', s:orange, '', s:none)
call s:Hi('sqlKeywordUpdate', s:orange, '', s:none)
call s:Hi('sqlKeywordDelete', s:orange, '', s:none)

" Markdown Specific
call s:Hi('markdownH1', s:orange, '', 'bold')
call s:Hi('markdownH2', s:orange, '', 'bold')
call s:Hi('markdownH3', s:orange, '', 'bold')
call s:Hi('markdownH4', s:yellow, '', 'bold')
call s:Hi('markdownH5', s:yellow, '', 'bold')
call s:Hi('markdownH6', s:yellow, '', 'bold')
call s:Hi('markdownHeadingDelimiter', s:orange, '', 'bold')
call s:Hi('markdownHeadingRule', s:orange, '', 'bold')
call s:Hi('markdownBold', s:white, '', 'bold')
call s:Hi('markdownItalic', s:white, '', 'italic')
call s:Hi('markdownBoldItalic', s:white, '', 'bold,italic')
call s:Hi('markdownCode', s:green, '', s:none)
call s:Hi('markdownCodeBlock', s:green, '', s:none)
call s:Hi('markdownCodeDelimiter', s:green, '', s:none)
call s:Hi('markdownBlockquote', s:grey_2, '', 'italic')
call s:Hi('markdownListMarker', s:orange, '', s:none)
call s:Hi('markdownOrderedListMarker', s:orange, '', s:none)
call s:Hi('markdownRule', s:grey_2, '', s:none)
call s:Hi('markdownUrl', s:blue, '', 'underline')
call s:Hi('markdownLink', s:pale_blue, '', s:none)
call s:Hi('markdownLinkText', s:pale_blue, '', s:none)
call s:Hi('markdownLinkDelimiter', s:white, '', s:none)
call s:Hi('markdownLinkTextDelimiter', s:white, '', s:none)
call s:Hi('markdownIdDeclaration', s:blue, '', s:none)
call s:Hi('markdownId', s:blue, '', s:none)
call s:Hi('markdownAutomaticLink', s:blue, '', 'underline')
call s:Hi('markdownError', s:red, '', s:none)

" VBNET Specific
call s:Hi('vbStatement', s:orange, '', s:none)
call s:Hi('vbConditional', s:yellow, '', 'italic')
call s:Hi('vbRepeat', s:orange, '', s:none)
call s:Hi('vbOperator', s:orange, '', s:none)
call s:Hi('vbKeyword', s:orange, '', s:none)
call s:Hi('vbFunction', s:pale_yellow, '', s:none)
call s:Hi('vbMethods', s:pale_yellow, '', s:none)
call s:Hi('vbBoolean', s:green, '', s:none)
call s:Hi('vbConst', s:yellow, '', s:none)
call s:Hi('vbNumber', s:yellow, '', s:none)
call s:Hi('vbString', s:pale_blue, '', s:none)
call s:Hi('vbComment', s:grey_2, '', 'italic')
call s:Hi('vbLineNumber', s:grey_3, '', s:none)
call s:Hi('vbTypeSpecifier', s:yellow, '', 'italic')
call s:Hi('vbType', s:yellow, '', 'italic')
call s:Hi('vbDefine', s:blue, '', 'italic')
call s:Hi('vbEvents', s:orange, '', s:none)
call s:Hi('vbIdentifier', s:white, '', s:none)
call s:Hi('vbTodo', s:yellow, s:grey_4, 'bold,italic')
call s:Hi('vbLabel', s:orange, '', s:none)
call s:Hi('vbException', s:red, '', s:none)

" nvim-coc (Conquer of Completion) Highlight Groups
" Diagnostic Signs
call s:Hi('CocErrorSign', s:red, s:grey_5, s:none)
call s:Hi('CocWarningSign', s:yellow, s:grey_5, s:none)
call s:Hi('CocInfoSign', s:blue, s:grey_5, s:none)
call s:Hi('CocHintSign', s:pale_blue, s:grey_5, s:none)

" Diagnostic Virtual Text
call s:Hi('CocErrorVirtualText', s:red, '', s:none)
call s:Hi('CocWarningVirtualText', s:yellow, '', s:none)
call s:Hi('CocInfoVirtualText', s:blue, '', s:none)
call s:Hi('CocHintVirtualText', s:pale_blue, '', s:none)

" Diagnostic Highlighting
call s:Hi('CocErrorHighlight', '', '', 'undercurl')
call s:Hi('CocWarningHighlight', '', '', 'undercurl')
call s:Hi('CocInfoHighlight', '', '', 'undercurl')
call s:Hi('CocHintHighlight', '', '', 'undercurl')

" Diagnostic Float
call s:Hi('CocErrorFloat', s:red, s:grey_4, s:none)
call s:Hi('CocWarningFloat', s:yellow, s:grey_4, s:none)
call s:Hi('CocInfoFloat', s:blue, s:grey_4, s:none)
call s:Hi('CocHintFloat', s:pale_blue, s:grey_4, s:none)

" Float Windows
call s:Hi('CocFloating', s:white, s:grey_4, s:none)
call s:Hi('CocFloatBorder', s:grey_2, s:grey_4, s:none)
call s:Hi('CocFloatDividingLine', s:grey_3, s:grey_4, s:none)

" Menu
call s:Hi('CocMenuSel', s:black, s:predawn, s:none)
call s:Hi('CocSelectedText', s:predawn, '', s:none)

" Completion
call s:Hi('CocPumMenu', s:white, s:grey_4, s:none)
call s:Hi('CocPumShortcut', s:grey_2, s:grey_4, s:none)
call s:Hi('CocPumDetail', s:grey_1, s:grey_4, s:none)
call s:Hi('CocPumVirtualText', s:grey_2, s:grey_4, s:none)

" Highlight (references, document highlight)
call s:Hi('CocHighlightText', '', s:grey_4, s:none)
call s:Hi('CocHighlightRead', '', s:grey_4, s:none)
call s:Hi('CocHighlightWrite', '', s:grey_4, 'underline')

" Cursor
call s:Hi('CocCursorRange', '', s:grey_3, s:none)

" Code Lens
call s:Hi('CocCodeLens', s:grey_2, '', 'italic')

" Semantic Highlighting
call s:Hi('CocSem_namespace', s:blue, '', s:none)
call s:Hi('CocSem_type', s:yellow, '', 'italic')
call s:Hi('CocSem_class', s:yellow, '', 'italic')
call s:Hi('CocSem_enum', s:yellow, '', 'italic')
call s:Hi('CocSem_interface', s:yellow, '', 'italic')
call s:Hi('CocSem_struct', s:yellow, '', 'italic')
call s:Hi('CocSem_typeParameter', s:yellow, '', 'italic')
call s:Hi('CocSem_parameter', s:white, '', s:none)
call s:Hi('CocSem_variable', s:white, '', s:none)
call s:Hi('CocSem_property', s:white, '', s:none)
call s:Hi('CocSem_enumMember', s:yellow, '', s:none)
call s:Hi('CocSem_event', s:orange, '', s:none)
call s:Hi('CocSem_function', s:pale_yellow, '', s:none)
call s:Hi('CocSem_method', s:pale_yellow, '', s:none)
call s:Hi('CocSem_macro', s:pale_yellow, '', s:none)
call s:Hi('CocSem_keyword', s:orange, '', s:none)
call s:Hi('CocSem_modifier', s:orange, '', s:none)
call s:Hi('CocSem_comment', s:grey_2, '', 'italic')
call s:Hi('CocSem_string', s:pale_blue, '', s:none)
call s:Hi('CocSem_number', s:yellow, '', s:none)
call s:Hi('CocSem_regexp', s:orange, '', s:none)
call s:Hi('CocSem_operator', s:orange, '', s:none)
call s:Hi('CocSem_decorator', s:orange, '', 'italic')

" Deprecated/Unused
call s:Hi('CocDeprecatedHighlight', '', '', 'strikethrough')
call s:Hi('CocUnusedHighlight', s:grey_2, '', 'italic')

" Symbols
call s:Hi('CocSymbolDefault', s:white, '', s:none)
call s:Hi('CocSymbolFile', s:white, '', s:none)
call s:Hi('CocSymbolModule', s:blue, '', s:none)
call s:Hi('CocSymbolNamespace', s:blue, '', s:none)
call s:Hi('CocSymbolPackage', s:blue, '', s:none)
call s:Hi('CocSymbolClass', s:yellow, '', s:none)
call s:Hi('CocSymbolMethod', s:pale_yellow, '', s:none)
call s:Hi('CocSymbolProperty', s:white, '', s:none)
call s:Hi('CocSymbolField', s:white, '', s:none)
call s:Hi('CocSymbolConstructor', s:pale_yellow, '', s:none)
call s:Hi('CocSymbolEnum', s:yellow, '', s:none)
call s:Hi('CocSymbolInterface', s:yellow, '', s:none)
call s:Hi('CocSymbolFunction', s:pale_yellow, '', s:none)
call s:Hi('CocSymbolVariable', s:white, '', s:none)
call s:Hi('CocSymbolConstant', s:yellow, '', s:none)
call s:Hi('CocSymbolString', s:pale_blue, '', s:none)
call s:Hi('CocSymbolNumber', s:yellow, '', s:none)
call s:Hi('CocSymbolBoolean', s:green, '', s:none)
call s:Hi('CocSymbolArray', s:white, '', s:none)
call s:Hi('CocSymbolObject', s:white, '', s:none)
call s:Hi('CocSymbolKey', s:orange, '', s:none)
call s:Hi('CocSymbolNull', s:yellow, '', s:none)
call s:Hi('CocSymbolEnumMember', s:yellow, '', s:none)
call s:Hi('CocSymbolStruct', s:yellow, '', s:none)
call s:Hi('CocSymbolEvent', s:orange, '', s:none)
call s:Hi('CocSymbolOperator', s:orange, '', s:none)
call s:Hi('CocSymbolTypeParameter', s:yellow, '', s:none)

" Git Gutter Integration (bonus)
call s:Hi('GitGutterAdd', s:green, s:grey_5, s:none)
call s:Hi('GitGutterChange', s:yellow, s:grey_5, s:none)
call s:Hi('GitGutterDelete', s:red, s:grey_5, s:none)
call s:Hi('GitGutterChangeDelete', s:orange, s:grey_5, s:none)

" Terminal Colors (for :terminal)
if has('nvim')
  let g:terminal_color_0  = s:black
  let g:terminal_color_1  = s:red
  let g:terminal_color_2  = s:green
  let g:terminal_color_3  = s:yellow
  let g:terminal_color_4  = s:blue
  let g:terminal_color_5  = s:predawn
  let g:terminal_color_6  = s:pale_blue
  let g:terminal_color_7  = s:white
  let g:terminal_color_8  = s:grey_2
  let g:terminal_color_9  = s:red
  let g:terminal_color_10 = s:green
  let g:terminal_color_11 = s:yellow
  let g:terminal_color_12 = s:blue
  let g:terminal_color_13 = s:orange
  let g:terminal_color_14 = s:pale_blue
  let g:terminal_color_15 = s:white
elseif has('terminal')
  let g:terminal_ansi_colors = [
    \ s:black, s:red, s:green, s:yellow,
    \ s:blue, s:predawn, s:pale_blue, s:white,
    \ s:grey_2, s:red, s:green, s:yellow,
    \ s:blue, s:orange, s:pale_blue, s:white
    \ ]
endif
