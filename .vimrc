" default shell
set shell=/usr/local/bin/bash

" on the first day God created Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vundle
    Plugin 'gmarik/Vundle.vim'
" NerdTree
    Plugin 'scrooloose/nerdtree'
" jsx - for csacademy development
    Plugin 'lervag/vim-latex'
    Plugin 'mxw/vim-jsx'
    Plugin 'jbgutierrez/vim-babel'
    Plugin 'mattn/webapi-vim'
" Plugin 'MaxMEllon/vim-jsx-pretty'
    Plugin 'pangloss/vim-javascript'
" folding
    Plugin 'tmhedberg/SimpylFold'
" YCM
    Plugin 'Valloric/YouCompleteMe'
" airline
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
" colorschemes
    Plugin 'romainl/Apprentice'
    Plugin 'tlhr/anderson.vim'
    Plugin 'joshdick/onedark.vim'
    Plugin 'monkoose/boa.vim'
    Plugin 'sjl/badwolf'
    Plugin 'jpo/vim-railscasts-theme'

call vundle#end()            " required
filetype plugin indent on    " required



" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif



" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0



" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'



" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" auto load
autocmd QuickFixCmdPost *grep* cwindow



" cursor
" " Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif



set laststatus=2
set nospell
set hlsearch
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set mouse=a
set number
set wildmenu
set tabstop=4
set noswapfile
set scrolljump=5
set softtabstop=4

syntax on
set bg=dark
set t_Co=256
colo hybrid

if has("termguicolors")
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1







vnoremap / /\v
vnoremap ? ?\v

cmap w!! w !sudo tee >/dev/null %
command! Q :q
command! W :w

map . ;!
nnoremap 0 ^

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

nnoremap ,h :tabprev<cr>
nnoremap ,l :tabnext<cr>
nnoremap ,t :tabnew<cr>

" inoremap {<CR> {<CR>}<C-o>O


" compile functions
function! CodeforcesCompile()
  write
  !./../cr.sh %
endfunction

function! BabelCompile()
  write
  !echo "Compiling Babel %"; foo=%; babel % > ${foo: : -1} 
endfunction

function! CompileAndRun()
  write
  if &filetype == 'java'
    exec "!javac %"
    exec "!time java -cp %:p:h %:t:r"
  elseif &filetype == 'scala'
    exec "!scalac %"
    exec "!scala %"
  elseif &filetype == 'c'
    !gcc % && ./a.out && rm a.out
  elseif &filetype == 'cpp'
    exec "!g++ -std=c++0x % ; ./a.out ; rm a.out"
  elseif &filetype == 'python'
    !python3 %
  elseif &filetype == 'php'
    !php %
  elseif &filetype == 'perl'
    !perl %
  elseif &filetype == 'sh'
    !bash %
  elseif &filetype == 'ruby'
    !ruby %
  elseif &filetype == 'javascript'
    !foo=%; babel % > ${foo: : -1} 
  endif
endfunction



" mapping the compile functions
nnoremap ,c :call CompileAndRun()<cr>
nnoremap ,x :call CodeforcesCompile()<cr>
nnoremap ,b :call BabelCompile()<cr>
" nnoremap ,b :write<cr>:!rollup -c<cr>

" copy and paste in vim 
command C !cat % | pbcopy
