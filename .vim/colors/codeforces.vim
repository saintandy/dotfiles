" Vim color file
" Maintainer:   Donald Ephraim Curtis <dcurtis@gmail.com>
" Last Change:  09. january 2007.
" URL:          http://milkbox.net
" Kate default color themes.
" version 1.1

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="codeforces"

hi Comment      gui=italic      guifg=#880000		guibg=NONE
hi Identifier   gui=NONE		guifg=#000088		guibg=NONE
hi Statement    gui=none		guifg=#000088       guibg=NONE
hi PreProc      gui=NONE		guifg=#880000		guibg=NONE	
hi Statement    gui=none        guifg=#000088       guibg=NONE
hi Type         gui=none		guifg=#000088		guibg=NONE
hi link Constant Type
hi Special      gui=NONE		guifg=#000088 	    guibg=NONE
hi Structure    gui=none        guifg=#000088       guibg=NONE
hi String       gui=NONE  	    guifg=#2D8840	    guibg=NONE
hi Character    gui=NONE        guifg=#660066       guibg=NONE
hi Number       gui=NONE		guifg=#006666       guibg=NONE
hi SpecialKey   gui=NONE		guifg=#0000FF       guibg=NONE
hi Float        gui=NONE        guifg=#800080       guibg=NONE
hi Boolean      gui=none        guifg=#000088       guibg=NONE
hi Gutter       gui=NONE        guifg=Black		    guibg=Grey
hi Todo         gui=none    	guifg=black		    guibg=#FFCCCC
hi LineNr       gui=NONE        guifg=Black         guibg=#EBE9ED
hi NonText      gui=none 		guifg=black         guibg=#EBE9ED
hi Visual       gui=reverse     guifg=NONE          guibg=NONE
hi MatchParen   gui=NONE        guifg=Black         guibg=#FFFF99
hi Question     gui=NONE        guifg=DarkGreen     guibg=NONE
hi More         gui=none        guifg=DarkGreen     guibg=NONE
hi StatusLine   gui=none        guifg=Black         guibg=#EBE9ED
hi SpecialChar guifg=#660066 gui=none

" C/C++ Colors
hi link cIncluded PreProc
hi cOctal       gui=NONE        guifg=#008080       guibg=NONE
hi cSpecial     gui=NONE        guifg=#FF00FF       guibg=NONE
hi link cSpecialCharacter cSpecial

" Latex Colors
"hi texStatement guifg=#606000
hi link texType Normal
hi link texDocType Type
hi link texDefParm Normal
hi link texInput Normal
hi link texInputFile Normal
hi link texNewCmd texDocType
hi link texSection String
hi link texSectionName SpecialKey
hi link texDelimiter Normal
hi link texRefZone Normal
hi link texMath PreProc
hi link texLigature texMath
hi texStatement gui=NONE        guifg=#800000       guibg=NONE

" Copyright (C) 2011 by Strahinja Markovic
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

if exists( 'g:loaded_operator_highlight' )
  finish
else
  let g:loaded_operator_highlight = 1
endif

if !exists( 'g:ophigh_color' )
  let g:ophigh_color = "cyan"
endif

if !exists( 'g:ophigh_filetypes_to_ignore' )
  let g:ophigh_filetypes_to_ignore = {}
endif

fun! s:IgnoreFiletypeIfNotSet( file_type )
  if get( g:ophigh_filetypes_to_ignore, a:file_type, 1 )
    let g:ophigh_filetypes_to_ignore[ a:file_type ] = 1
  endif
endfunction

call s:IgnoreFiletypeIfNotSet('help')
call s:IgnoreFiletypeIfNotSet('markdown')
call s:IgnoreFiletypeIfNotSet('qf') " This is for the quickfix window
call s:IgnoreFiletypeIfNotSet('conque_term')
call s:IgnoreFiletypeIfNotSet('diff')
call s:IgnoreFiletypeIfNotSet('html')
call s:IgnoreFiletypeIfNotSet('css')
call s:IgnoreFiletypeIfNotSet('less')
call s:IgnoreFiletypeIfNotSet('xml')
call s:IgnoreFiletypeIfNotSet('sh')
call s:IgnoreFiletypeIfNotSet('bash')
call s:IgnoreFiletypeIfNotSet('notes')
call s:IgnoreFiletypeIfNotSet('jinja')

fun! s:HighlightOperators()
  if get( g:ophigh_filetypes_to_ignore, &filetype, 0 )
    return
  endif

  " for the last element of the regex, see :h /\@!
  " basically, searching for "/" is more complex since we want to avoid
  " matching against "//" or "/*" which would break C++ comment highlighting
  syntax match OperatorChars "?\|+\|-\|\*\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"
  exec "hi OperatorChars guifg=" . g:ophigh_color . " gui=NONE"
endfunction

au Syntax * call s:HighlightOperators()
