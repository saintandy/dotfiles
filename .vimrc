" default shell set shell=/bin/bash
" 
" on the first day God created Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

call vundle#end()            " required
filetype plugin indent on    " required
let anyfold_activate=1
set foldlevel=0


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif



" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
nnoremap <C-c> :call NERDComment(0,"toggle")<CR>
vnoremap <C-c> :call NERDComment(0,"toggle")<CR>
" We don't really need this though, somehow it works
    " nnoremap <C-d> :call NERDComment(12,"toggle")<CR>
    " vnoremap <C-d> :call NERDComment(12,"toggle")<CR>


" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" autocmd VimEnter * NERDTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

nnoremap <C-d> :NERDTree<CR>
vnoremap <C-d> :NERDTree<CR>



" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0
let g:enable_ycm_at_startup = 0
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1



" airline
let g:airline#extensions#tabline#enabled = 1
" airline unicode symbols
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
" let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''




autocmd VimEnter * wincmd p
" autocmd VimEnter *.{js,jsx,c,cpp,py} IndentGuidesToggle


" auto load
autocmd QuickFixCmdPost *grep* cwindow

" folding
" setlocal foldmethod=indent

" Paste from VIM
" set clipboard=unnamed
set noerrorbells visualbell t_vb=
set wildignorecase
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
set nofoldenable
set ignorecase
" set cursorline
set incsearch
" for slow terminals
set lazyredraw
set history=1000
set undolevels=1000
set ttyfast
" set synmaxcol=128
" syntax sync minlines=256

" colorscheme base16-twilight
" colorscheme hydrangea
" colorscheme jellybeans
colorscheme molokai


" long wrapping lines
nnoremap j gj
nnoremap k gk



vnoremap / /\v
vnoremap ? ?\v

cmap w!! w !sudo tee >/dev/null %
command! Q :q
command! W :w

" map . ;!
nnoremap 0 ^

map <C-h> <C-W>h
if has("nvim")
     nmap <BS> <C-W>h
endif
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

nnoremap # #N

nnoremap ˙ :tabprev<cr>
nnoremap ¬ :tabnext<cr>
nnoremap <C-t> :tabnew<cr>

" inoremap {<CR> {<CR>}<C-o>O


" django



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



" listchars
set listchars=tab:»\ ,extends:›,precedes:‹,space:·,trail:·,eol:¬
" set list


" Indent guides
" autocmd VimEnter * IndentGuidesToggle
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" Colorscheme
syntax on
set bg=dark
set t_Co=256
" colorscheme hybrid
"
let g:airline_theme='oceanicnextlight'
colorscheme molokai

if has("termguicolors")
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1



" mapping the compile functions
nnoremap ,c :call CompileAndRun()<cr>
nnoremap ,x :call CodeforcesCompile()<cr>
nnoremap ,b :call BabelCompile()<cr>
" nnoremap ,b :write<cr>:!rollup -c<cr>

" copy and paste in vim 
command C !cat % | pbcopy


""" FLOW DE OLIMPIADA ...
" Make command
:set makeprg=make\ %<\ LDLIBS=\"-lm\"\ CFLAGS=\"-Wall\ -O2\ -static\"\ CPPFLAGS=\"-Wall\ -O2\ -std=c++11\"

" Mappings
map <F7> <ESC>:w<CR>:make<CR>
map <F8> <ESC>:!time ./%<<CR>
map <F9> <ESC>:w<CR>:make<CR>:!time ./%<<CR>

imap <F7> <ESC>:w<CR>:make<CR>
imap <F8> <ESC>:!time ./%<<CR>
imap <F9> <ESC>:w<CR>:make<CR>:!time ./%<<CR>
