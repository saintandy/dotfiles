set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
"Plugin 'itchyny/lightline.vim'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Raimondi/delimitMate'
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'acarapetis/vim-colors-github'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'Valloric/vim-operator-highlight'
"Plugin 'jnurmine/Zenburn'
"Plugin 'Yggdroot/indentLine'
"Plugin 'tclem/vim-arduino'
"Plugin 'sudar/vim-arduino-syntax'
"Plugin 'sentientmachine/erics_vim_syntax_and_color_highlighting'
"Plugin 'vim-scripts/javacomplete'
Plugin 'majutsushi/tagbar'
"Plugin 'pangloss/vim-javascript'
"Plugin 'oplatek/Conque-Shell'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'adragomir/javacomplete'

"autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

call vundle#end()            " required
filetype plugin indent on    " required

"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java map <leader>b :call javacomplete#GoToDefinition()<CR>

setlocal completefunc=javacomplete#CompleteParamsInfo 
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

let javascript_enable_domhtmlcss=1

" no lag bitches
set ttyfast " u got a fast terminal
set scroll=3
set lazyredraw " to avoid scrolling problems

" some gui options
set guifont=Source\ Code\ Pro\ Light:h8
set guioptions-=L
set guioptions-=r

" colorscheme
syntax on
set bg=dark
set t_Co=256
colo badwolf

" set
set autoindent
set smartindent
set autoread
set autowrite
set autowrite
set bs=2
set encoding=utf-8
set gdefault
set hlsearch
set ignorecase
set incsearch
set modeline
set mouse=a
set mouse=a
set nohidden
set nospell
set number
set ruler
set shiftwidth=4
set smartcase
set softtabstop=4
set tabstop=4
set expandtab
set vb t_vb=
set wildmenu
setlocal spell spelllang=en

" plugins
let g:tagbar_left=1
let g:ophigh_color_gui = "#F6FF00"
" autocmd VimEnter * nested :TagbarOpen

" binds
let mapleader = ","
nnoremap / /\v
nnoremap <leader>h :tabprev<cr>
nnoremap <leader>l :tabnext<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>pp :set paste<cr>
nnoremap <leader>np :set nopaste<cr>
nnoremap <leader>z <C-w><C-w>
nnoremap ? ?\v
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
vnoremap / /\v
vnoremap ? ?\v

" easier control
cmap w!! w !sudo tee >/dev/null %
command! Q :q
command! W :w
map . ;.!
map N Nzz
map n nzz
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" tab autocompletes
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

" aliases
iab fales false
iab fasle false
iab inclde include
iab incldue include
iab sceond second
iab secndo second
iab secnod second

" save, compile and run files
function! CompileAndRun()
  write
  if &filetype == 'java'
    exec "!javac %"
    exec "!time java -cp %:p:h %:t:r"
  elseif &filetype == 'c'
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

function! CodeforcesCompile()
  write
  !./../cr.sh %
endfunction

" compile shortcuts and other commands
nnoremap <leader>c <ESC>:w!<cr>:call CompileAndRun()<cr>
nnoremap <leader>x <ESC>:w!<cr>:call CodeforcesCompile()<cr>
command C !cat % | pbcopy
command Z !pastebinit % | pbcopy


" window movement shortcuts
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" writing commands
  " keep tab
" inoremap <ENTER> <ENTER><Space><Backspace>
inoremap o o<Space><Backspace>
inoremap O O<Space><Backspace>
  " brace completion
inoremap {<CR> {<CR>}<C-o>O
  " brace deletion

"au Syntax * call s:HighlightOperators()
"au ColorScheme * call s:HighlightOperators()
