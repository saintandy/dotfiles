" Maintainer:   Tim Aldrich <aldy0169@yahoo.com>
" Last Change:  19 November 2003

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="mars"
" GUI colors {{{
"hi Normal		guifg=#FFFFFF guibg=#961E00
highlight Normal guifg=#ffffff guibg=#961e00 ctermfg=231 ctermbg=124
highlight Cursor guifg=#a0963c guibg=#ffffff ctermfg=100 ctermbg=231
highlight CursorIM guifg=#6699cc guibg=#99cccc ctermfg=67 ctermbg=152
highlight Directory guifg=#b45000 guibg=#961e00 ctermfg=130 ctermbg=124
highlight DiffAdd guifg=#ffffcc guibg=#961e00 ctermfg=230 ctermbg=124
highlight DiffChange guifg=#ff9900 guibg=#961e00 ctermfg=208 ctermbg=124
highlight DiffDelete guifg=#999999 guibg=#961e00 ctermfg=247 ctermbg=124
highlight DiffText guifg=#ffffff guibg=#961e00 ctermfg=231 ctermbg=124
highlight ErrorMsg guifg=#ffffff guibg=#ff0000 ctermfg=231 ctermbg=196
highlight VertSplit guifg=#ffffff guibg=#961e00 ctermfg=231 ctermbg=124
highlight Folded guifg=#999999 guibg=#be1e00 gui=italic ctermfg=247 ctermbg=124
highlight FoldColumn guifg=#cc0000 guibg=#999999 ctermfg=160 ctermbg=247
highlight IncSearch guifg=#ffff00 guibg=#961e00 ctermfg=226 ctermbg=124
highlight LineNr guifg=#999999 guibg=#be1e00 ctermfg=247 ctermbg=124
highlight ModeMsg guifg=#ffffff guibg=#961e00 ctermfg=231 ctermbg=124
highlight MoreMsg guifg=#ffffff guibg=#961e00 ctermfg=231 ctermbg=124
highlight NonText guifg=#ffffff guibg=#a0141e ctermfg=231 ctermbg=124
highlight Question guifg=#ffffff guibg=#ee0000 ctermfg=231 ctermbg=196
highlight Search guifg=#a0142b guibg=#ffff00 gui=underline ctermfg=88 ctermbg=226 cterm=underline
highlight SpecialKey guifg=#ffff00 guibg=#961e00 ctermfg=226 ctermbg=124
highlight StatusLine guifg=#ffffff guibg=#961e00 ctermfg=231 ctermbg=124
highlight StatusLineNC guifg=#cccccc guibg=#961e00 ctermfg=252 ctermbg=124
highlight Title guifg=#ffffff guibg=#ff9900 ctermfg=231 ctermbg=208
highlight Visual guifg=#b45000 guibg=#961e00 ctermfg=130 ctermbg=124
highlight WarningMsg guifg=#ff0000 guibg=#ffffff ctermfg=196 ctermbg=231
highlight WildMenu guifg=#961e00 guibg=#999999 ctermfg=124 ctermbg=247
" }}}

" cterm colors {{{
highlight Normal
highlight Cursor
highlight CursorIM
highlight Directory
highlight DiffAdd
highlight DiffChange
highlight DiffDelete
highlight DiffText
highlight ErrorMsg
highlight VertSplit
highlight Folded
highlight FoldColumn
highlight IncSearch
highlight LineNr
highlight ModeMsg
highlight MoreMsg
highlight NonText
highlight Question
highlight Search
highlight SpecialKey
highlight StatusLine
highlight StatusLineNC
highlight Title
highlight Visual
highlight WarningMsg
highlight WildMenu
" }}}

" GUI hilight groups {{{

highlight Comment guifg=#999999 ctermfg=247
highlight Constant guifg=#ffff00 ctermfg=226
highlight String guifg=#cccc99 ctermfg=187
highlight Character guifg=#a0963c ctermfg=100
highlight Number guifg=#a0963c ctermfg=100
highlight Boolean guifg=#a0963c ctermfg=100
highlight Float guifg=#a0963c ctermfg=100
highlight Identifier guifg=#e6fa46 ctermfg=190
highlight Function guifg=#e6fa46 ctermfg=190
highlight Statement guifg=#ffffcc ctermfg=230
highlight Conditional guifg=#ffffcc ctermfg=230
highlight Repeat guifg=#ffffcc ctermfg=230
highlight Label guifg=#e66e46 ctermfg=209
highlight Operator guifg=#ffff00 ctermfg=226
highlight Keyword guifg=#ffff00 ctermfg=226
highlight Exception guifg=#ffffaa ctermfg=229
highlight PreProc guifg=#c8783c ctermfg=173
highlight Include guifg=#c8783c ctermfg=173
highlight Define guifg=#c8783c ctermfg=173
highlight Macro guifg=#c8783c ctermfg=173
highlight PreCondit guifg=#c8783c ctermfg=173
highlight Type guifg=#e6641e ctermfg=202
highlight StorageClass guifg=#e66e46 ctermfg=209
highlight Structure guifg=#e66e46 ctermfg=209
highlight Typedef guifg=#e66e46 ctermfg=209
highlight Special guifg=#00ff00 ctermfg=46
highlight SpecialChar guifg=#00ff00 ctermfg=46
highlight Tag guifg=#ccccff ctermfg=189
highlight Delimiter guifg=#ccccff ctermfg=189
highlight SpecialComment guifg=#ffffcc ctermfg=230
highlight Debug guifg=#cc3300 ctermfg=160
highlight Ignore guifg=#961e00 ctermfg=124
highlight Error guifg=#ff0000 guibg=#ffffff ctermfg=196 ctermbg=231
highlight Todo guifg=#ffff00 guibg=#961e00 ctermfg=226 ctermbg=124
" }}}

" cterm hilight groups {{{
highlight Comment
highlight Constant
highlight String
highlight Character
highlight Number
highlight Boolean
highlight Float
highlight Identifier
highlight Function
highlight Statement
highlight Conditional
highlight Repeat
highlight Label
highlight Operator
highlight Keyword
highlight Exception
highlight PreProc
highlight Include
highlight Define
highlight Macro
highlight PreCondit
highlight Type
highlight StorageClass
highlight Structure
highlight Typedef
highlight Special
highlight SpecialChar
highlight Tag
highlight Delimiter
highlight SpecialComment
highlight Debug
highlight Ignore
highlight Error
highlight Todo
" }}}

