
set guioptions-=r
set guioptions-=L

set t_Co=256
colorscheme badwolf

set tabstop=4
set shiftwidth=4
set softtabstop=4
set bs=2
set ignorecase
set smartcase
set gdefault
set autoindent
set autowrite
set hlsearch
set incsearch
set vb t_vb=
set ruler
set cursorline
set mouse=a
syntax on
setlocal spell spelllang=en
set nospell
set encoding=utf-8
set number
set modeline
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>t :tabnew<cr>:e<space>
nnoremap <leader>z <C-w><C-w>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <up> gk
nnoremap <down> gj

set updatetime=3000
autocmd CursorHoldI * silent w

" Tab autocompletes
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

:inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

:iab fales false
:iab fasle false
:iab sceond second
:iab secnod second
:iab secndo second
:iab incldue include
:iab inclde include

command! W :w
command! Q :q

set mouse=a
set nohidden
set wildmenu

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

map N Nzz
map n nzz

" Save, compile and run files
function! CompileAndRun()
  write
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

function! CodeforcesCompile()
  write
  !./.test %
endfunction

nnoremap <leader>c :w!<cr>:call CompileAndRun()<cr>
nnoremap <leader>m :w!<cr>:call CodeforcesCompile()<cr>
inoremap <leader>c <ESC><cr>:w!<cr>:call CompileAndRun()<cr>
inoremap <leader>m <ESC><cr>:w!<cr>:call CodeforcesCompile()<cr>

syn keyword Type int64
syn keyword Statement foreach

" keep tab
  inoremap <ENTER> <ENTER><Space><Backspace>
  noremap o o<Space><Backspace>
  noremap O O<Space><Backspace>
" brace completion
  inoremap {<CR> {<CR>}<C-o>O<Tab>
" brace deletion
  inoremap <C-x> <ESC>%xx``la<Backspace>
  nnoremap <C-x> %xx``xdd

