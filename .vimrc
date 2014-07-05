" some gui options
set guifont=Monaco:h12
set guioptions-=L
set guioptions-=r

" colorscheme
syntax on
set bg=dark
set t_Co=256
colorscheme zenburn

" set
set autoindent
set autoread
set autowrite
set autowrite
set bs=2
set cursorline
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
set vb t_vb=
set wildmenu
setlocal spell spelllang=en

" binds
let mapleader = ","
nnoremap / /\v
nnoremap <down> gj
nnoremap <leader><space> :noh<cr>
nnoremap <leader>t :tabnew<cr>:e<space>
nnoremap <leader>z <C-w><C-w>
nnoremap <up> gk
nnoremap ? ?\v
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
vnoremap / /\v
vnoremap ? ?\v

" plugins
autocmd VimEnter * NERDTree

" easier control
cmap w!! w !sudo tee >/dev/null %
command! Q :q
command! W :w
map . ;.!
map <C-c> <enter>
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

" compile shortcuts and other commands
nnoremap <leader>c <ESC>:w!<cr>:call CompileAndRun()<cr>
nnoremap <leader>x <ESC>:w!<cr>:call CodeforcesCompile()<cr>
command C !cat % | pbcopy
command Z !pastebinit % | pbcopy

" custom keywords
syn keyword Type int64
syn keyword Statement foreach

" window movement shortcuts
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" writing commands
  " keep tab
inoremap <ENTER> <ENTER><Space><Backspace>
inoremap o o<Space><Backspace>
noremap O O<Space><Backspace>
  " brace completion
inoremap {<CR> {<CR>}<C-o>O<Tab>
  " brace deletion
inoremap <C-x> <ESC>%xx``la<Backspace>
nnoremap <C-x> %xx``xdd


" thanks to @statico for the next part

" Helper to initialize Zenburn colors in 256-color mode.
function! ColorTermZenburn()
  colorscheme zenburn
  highlight Normal ctermbg=234
  highlight CursorLine ctermbg=236
  let g:zenburn_high_Contrast = 1
endfunction

" Make sure colored syntax mode is on, and make it Just Work with newer 256
" color terminals like iTerm2.
if !has('gui_running')
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
    call ColorTermZenburn()
  elseif has("terminfo")
    colorscheme default
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    colorscheme default
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
endif
syntax on

" window splits & ruler were too bright - change to white on grey
" (shouldn't change GUI or non-color term appearance)
highlight StatusLine   cterm=NONE ctermbg=236 ctermfg=white
highlight StatusLineNC cterm=NONE ctermbg=black ctermfg=white
highlight VertSplit    cterm=NONE ctermbg=232 ctermfg=236

" unfortunately, taglist.vim's filenames is linked to LineNr, which sucks
highlight def link MyTagListFileName Statement
highlight def link MyTagListTagName Question

" turn off coloring for CDATA
highlight def link xmlCdata NONE

" custom incorrect spelling colors
highlight SpellBad     term=underline cterm=none ctermbg=NONE ctermfg=red
highlight SpellCap     term=underline cterm=none ctermbg=NONE ctermfg=blue
highlight SpellRare    term=underline cterm=none ctermbg=NONE ctermfg=magenta
highlight SpellLocal   term=underline cterm=none ctermbg=NONE ctermfg=cyan

" ignore should be... ignored
highlight Ignore cterm=bold ctermfg=black
highlight clear FoldColumn
highlight def link FoldColumn Ignore
highlight clear Folded
highlight link Folded Ignore
highlight clear LineNr
highlight! def link LineNr Ignore

" nice-looking hilight if I remember to set my terminal colors
highlight clear Search
highlight Search term=NONE cterm=NONE ctermfg=white ctermbg=black

" make hilighted matching parents less offensive
highlight clear MatchParen
highlight link MatchParen Search

" colors for NERD_tree
highlight def link NERDTreeRO NERDTreeFile

" make trailing spaces visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" make menu selections visible
highlight PmenuSel ctermfg=black ctermbg=magenta

" the sign column slows down remote terminals
highlight clear SignColumn
highlight link SignColumn Ignore

" Markdown could be more fruit salady.
highlight link markdownH1 PreProc
highlight link markdownH2 PreProc
highlight link markdownLink Character
highlight link markdownBold String
highlight link markdownItalic Statement
highlight link markdownCode Delimiter
highlight link markdownCodeBlock Delimiter
highlight link markdownListMarker Todo

highlight LineNr ctermfg=239
