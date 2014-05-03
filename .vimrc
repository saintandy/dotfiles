
" basic stuff
  set autoindent
  set number
  set mouse=a
  set softtabstop=4 shiftwidth=4 tabstop=4
" set expandtab softtabstop=4
  set wildmenu
  set nowrap
  
" colorscheme
  syntax on
  set t_Co=256
  set background=dark
  colo twilight
  let g:ophigh_color="#998f84"
 
" plugin
  " NerdTree
"	autocmd VimEnter * NERDTree

" autocomplete
  " keep tab
    inoremap <ENTER> <ENTER><Space><Backspace>
    noremap o o<Space><Backspace>
    noremap O O<Space><Backspace>
  " brace completion
    inoremap {<CR> {<CR>}<C-o>O<Tab>
  " brace deletion
    inoremap <C-x> <ESC>%xx``la<Backspace>
	nnoremap <C-x> %xx``x

" navigation
  " fast scrolling
    set scrolloff=999

" instead of :
  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;
 
" fast ESC

" compile and run
  function CompileAndRun()
    if &filetype == 'c'
        !gcc % && ./a.out && rm a.out
    elseif &filetype == 'cpp'
        !g++ -std=c++0x % && ./a.out && rm a.out
    elseif &filetype == 'py'
        !python %
    elseif &filetype == 'php'
        !php %
    elseif &filetype == 'perl'
        !perl %
    elseif &filetype == 'sh'
        !bash %
    endif
  endfunction
  
  function RunCodeforces()
  	!./.test %
  endfunction

  command C call CompileAndRun()
  command Z call RunCodeforces()
  

set guifont=PT\ Mono:h14
set guioptions-=r
set guioptions-=L



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

