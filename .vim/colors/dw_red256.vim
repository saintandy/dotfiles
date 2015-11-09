"--------------------------------------------------------------------
" Name Of File: dw_red.vim.
" Description: Gvim colorscheme, designed against VIM 7.0 GUI
" By: Steve Cadwallader
" Contact: demwiz@gmail.com
" Credits: Inspiration from the brookstream and redblack schemes.
" Last Change: Saturday, September 17, 2006.
" Installation: Drop this file in your $VIMRUNTIME/colors/ directory.
"--------------------------------------------------------------------
set background=dark
hi clear 
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="dw_red"
"--------------------------------------------------------------------
hi Boolean guifg=#ff0000 ctermfg=9 
hi cDefine guifg=#ff0000 ctermfg=9 
hi cInclude guifg=#ffffff ctermfg=15 
hi Comment guifg=#696969 ctermfg=242 
hi Constant guifg=#ff0000 ctermfg=9 
hi Cursor guibg=#444444 ctermbg=238 guifg=#ffffff ctermfg=15 
hi CursorColumn guibg=#110000 ctermbg=0 
hi CursorLine guibg=#180000 ctermbg=0 
hi DiffAdd guibg=#333333 ctermbg=236 guifg=#ff0000 ctermfg=9 
hi DiffChange guibg=#333333 ctermbg=236 guifg=#ff0000 ctermfg=9 
hi DiffDelete guibg=#333333 ctermbg=236 guifg=#ff0000 ctermfg=9 
hi DiffText guibg=#333333 ctermbg=236 guifg=#ffffff ctermfg=15 
hi Directory guibg=#000000 ctermbg=0 guifg=#ff0000 ctermfg=9 
hi ErrorMsg guibg=#ffffff ctermbg=15 guifg=#000000 ctermfg=0 
hi FoldColumn guibg=#222222 ctermbg=235 guifg=#ff0000 ctermfg=9 
hi Folded guibg=#222222 ctermbg=235 guifg=#ff0000 ctermfg=9 
hi Function guibg=#000000 ctermbg=0 guifg=#ff0000 ctermfg=9 
hi Identifier guibg=#000000 ctermbg=0 guifg=#cc0000 ctermfg=1 
hi IncSearch gui=none guibg=#bb0000 ctermbg=124 guifg=#000000 ctermfg=0 
hi LineNr guibg=#000000 ctermbg=0 guifg=#880000 ctermfg=88 
hi MatchParen gui=none guibg=#222222 ctermbg=235 guifg=#ff0000 ctermfg=9 
hi ModeMsg guibg=#000000 ctermbg=0 guifg=#ff0000 ctermfg=9 
hi MoreMsg guibg=#000000 ctermbg=0 guifg=#ff0000 ctermfg=9 
hi NonText guibg=#000000 ctermbg=0 guifg=#ffffff ctermfg=232
hi Normal gui=none guibg=#000000 ctermbg=0 guifg=#c0c0c0 ctermfg=250 
hi Operator gui=none guifg=#696969 ctermfg=242 
hi PreProc gui=none guifg=#ffffff ctermfg=15 
hi Question guifg=#ff0000 ctermfg=9 
hi Search gui=none guibg=#ff0000 ctermbg=9 guifg=#000000 ctermfg=0 
hi SignColumn guibg=#111111 ctermbg=233 guifg=#ffffff ctermfg=15 
hi Special gui=none guibg=#000000 ctermbg=0 guifg=#ffffff ctermfg=15 
hi SpecialKey guibg=#000000 ctermbg=0 guifg=#ff0000 ctermfg=9 
hi Statement gui=bold guifg=#ff0000 ctermfg=9 
hi StatusLine gui=none guibg=#ff0000 ctermbg=9 guifg=#000000 ctermfg=0 
hi StatusLineNC gui=none guibg=#444444 ctermbg=238 guifg=#000000 ctermfg=0 
hi String gui=none guifg=#bb0000 ctermfg=124 
hi TabLine gui=none guibg=#444444 ctermbg=238 guifg=#000000 ctermfg=0 
hi TabLineFill gui=underline guibg=#000000 ctermbg=0 guifg=#ffffff ctermfg=15 
hi TabLineSel gui=none guibg=#aa0000 ctermbg=124 guifg=#000000 ctermfg=0 
hi Title gui=none guifg=#ff0000 ctermfg=9 
hi Todo gui=none guibg=#000000 ctermbg=0 guifg=#ff0000 ctermfg=9 
hi Type gui=none guifg=#ffffff ctermfg=15 
hi VertSplit gui=none guibg=#000000 ctermbg=232 guifg=#ffffff ctermfg=232
hi Visual guibg=#dd0000 ctermbg=160 guifg=#000000 ctermfg=0 
hi WarningMsg guibg=#888888 ctermbg=102 guifg=#000000 ctermfg=0 
"- end of colorscheme -----------------------------------------------  
