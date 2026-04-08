" Kuro - Vim/Neovim colorscheme translated from IntelliJ IDEA theme

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'kuro'
set background=dark

" Palette
let s:bg         = '#202020'
let s:bg_alt     = '#252525'
let s:bg_sel     = '#353535'
let s:bg_cursor  = '#15181c'
let s:fg         = '#eeffff'
let s:fg_muted   = '#c9c9c9'
let s:comment    = '#909090'
let s:gutter     = '#898989'
let s:accent     = '#e52a57'
let s:red        = '#ff5370'
let s:orange     = '#f78c6c'
let s:yellow     = '#ffcb6b'
let s:green      = '#c3e88d'
let s:cyan       = '#89ddff'
let s:blue       = '#82aaff'
let s:purple     = '#c792ea'

if has('termguicolors')
  set termguicolors
endif

function! s:hi(group, fg, bg, style, sp) abort
  let l:cmd = ['highlight', a:group]
  call add(l:cmd, 'guifg=' . (empty(a:fg) ? 'NONE' : a:fg))
  call add(l:cmd, 'guibg=' . (empty(a:bg) ? 'NONE' : a:bg))
  call add(l:cmd, 'gui=' . (empty(a:style) ? 'NONE' : a:style))
  call add(l:cmd, 'guisp=' . (empty(a:sp) ? 'NONE' : a:sp))
  call add(l:cmd, 'ctermfg=NONE ctermbg=NONE cterm=NONE')
  execute join(l:cmd, ' ')
endfunction

" UI
call s:hi('Normal',         s:fg,       '',         '',          '')
call s:hi('NormalNC',       s:fg_muted, '',         '',          '')
call s:hi('CursorLine',     '',         s:bg_alt,   '',          '')
call s:hi('CursorColumn',   '',         s:bg_alt,   '',          '')
call s:hi('ColorColumn',    '',         s:bg_alt,   '',          '')
call s:hi('CursorLineNr',   s:fg,       '',         'bold',      '')
call s:hi('LineNr',         s:gutter,   '',         '',          '')
call s:hi('SignColumn',     s:gutter,   '',         '',          '')
call s:hi('VertSplit',      s:bg_alt,   '',         '',          '')
call s:hi('WinSeparator',   s:bg_alt,   '',         '',          '')
call s:hi('EndOfBuffer',    s:bg,       '',         '',          '')
call s:hi('StatusLine',     s:fg_muted, s:bg_alt,   '',          '')
call s:hi('StatusLineNC',   s:comment,  s:bg_alt,   '',          '')
call s:hi('Pmenu',          s:fg_muted, s:bg_alt,   '',          '')
call s:hi('PmenuSel',       s:fg,       s:accent,   'bold',      '')
call s:hi('PmenuSbar',      '',         s:bg_sel,   '',          '')
call s:hi('PmenuThumb',     '',         s:accent,   '',          '')
call s:hi('TabLine',        s:fg_muted, s:bg_alt,   '',          '')
call s:hi('TabLineSel',     s:fg,       s:bg,       'bold',      '')
call s:hi('TabLineFill',    s:comment,  s:bg_alt,   '',          '')
call s:hi('Visual',         s:fg,       s:bg_sel,   '',          '')
call s:hi('Search',         s:bg,       '#1cf8c5',  'bold',      '')
call s:hi('IncSearch',      s:bg,       s:yellow,   'bold',      '')
call s:hi('MatchParen',     s:cyan,     '',         'bold',      '')
call s:hi('Directory',      s:blue,     '',         'bold',      '')
call s:hi('Title',          s:purple,   '',         'bold',      '')
call s:hi('Question',       s:green,    '',         'bold',      '')

" Syntax
call s:hi('Comment',        s:comment,  '',         'italic',    '')
call s:hi('Constant',       s:orange,   '',         '',          '')
call s:hi('String',         s:green,    '',         '',          '')
call s:hi('Character',      s:green,    '',         '',          '')
call s:hi('Number',         s:orange,   '',         '',          '')
call s:hi('Boolean',        s:orange,   '',         '',          '')
call s:hi('Float',          s:orange,   '',         '',          '')
call s:hi('Identifier',     s:fg,       '',         '',          '')
call s:hi('Function',       s:blue,     '',         '',          '')
call s:hi('Statement',      s:purple,   '',         'bold',      '')
call s:hi('Conditional',    s:purple,   '',         'bold',      '')
call s:hi('Repeat',         s:purple,   '',         'bold',      '')
call s:hi('Label',          s:fg,       '',         'bold',      '')
call s:hi('Operator',       s:cyan,     '',         '',          '')
call s:hi('Keyword',        s:purple,   '',         'bold',      '')
call s:hi('Exception',      s:purple,   '',         'bold',      '')
call s:hi('PreProc',        s:purple,   '',         '',          '')
call s:hi('Include',        s:purple,   '',         '',          '')
call s:hi('Define',         s:purple,   '',         '',          '')
call s:hi('Macro',          s:blue,     '',         '',          '')
call s:hi('Type',           s:yellow,   '',         '',          '')
call s:hi('StorageClass',   s:purple,   '',         '',          '')
call s:hi('Structure',      s:yellow,   '',         '',          '')
call s:hi('Typedef',        s:orange,   '',         '',          '')
call s:hi('Special',        s:cyan,     '',         '',          '')
call s:hi('SpecialChar',    s:cyan,     '',         '',          '')
call s:hi('Tag',            s:cyan,     '',         '',          '')
call s:hi('Delimiter',      s:cyan,     '',         '',          '')
call s:hi('SpecialComment', s:comment,  '',         'italic',    '')
call s:hi('Debug',          s:red,      '',         '',          '')
call s:hi('Underlined',     s:green,    '',         'underline', '')
call s:hi('Ignore',         s:comment,  '',         '',          '')
call s:hi('Error',          s:red,      '',         'undercurl', s:red)
call s:hi('Todo',           s:yellow,   '',         'bold',      '')

" Diagnostics and diff
call s:hi('ErrorMsg',       s:red,      '',         'bold',      '')
call s:hi('WarningMsg',     s:yellow,   '',         'bold',      '')
call s:hi('DiffAdd',        s:green,    '#45582b',  '',          '')
call s:hi('DiffChange',     s:yellow,   '#927243',  '',          '')
call s:hi('DiffDelete',     s:red,      '#b63b50',  '',          '')
call s:hi('DiffText',       s:cyan,     '#6c4e81',  'bold',      '')

call s:hi('DiagnosticError', s:red,     '',         '',          '')
call s:hi('DiagnosticWarn',  s:yellow,  '',         '',          '')
call s:hi('DiagnosticInfo',  s:green,   '',         '',          '')
call s:hi('DiagnosticHint',  s:cyan,    '',         '',          '')
call s:hi('DiagnosticUnderlineError', '', '',       'undercurl', s:red)
call s:hi('DiagnosticUnderlineWarn',  '', '',       'undercurl', s:yellow)
call s:hi('DiagnosticUnderlineInfo',  '', '',       'undercurl', s:green)
call s:hi('DiagnosticUnderlineHint',  '', '',       'undercurl', s:cyan)

" Git signs (if plugin is present)
call s:hi('GitSignsAdd',    s:green,    '',         '',          '')
call s:hi('GitSignsChange', s:yellow,   '',         '',          '')
call s:hi('GitSignsDelete', s:red,      '',         '',          '')

" Treesitter and semantic links
if has('nvim')
  hi! link @comment Comment
  hi! link @string String
  hi! link @number Number
  hi! link @boolean Boolean
  hi! link @constant Constant
  hi! link @constant.builtin Constant
  hi! link @constructor Type
  hi! link @function Function
  hi! link @function.call Function
  hi! link @method Function
  hi! link @keyword Keyword
  hi! link @keyword.function Keyword
  hi! link @keyword.return Keyword
  hi! link @operator Operator
  hi! link @parameter Identifier
  hi! link @property Identifier
  hi! link @punctuation Delimiter
  hi! link @type Type
  hi! link @type.builtin Type
  hi! link @variable Identifier
  hi! link @variable.builtin Constant
endif

hi! link LspReferenceText CursorLine
hi! link LspReferenceRead CursorLine
hi! link LspReferenceWrite CursorLine
