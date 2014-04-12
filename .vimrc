" basic stuff
  set autoindent
  set number
  set mouse=a
  set tabstop=4
" set expandtab softtabstop=4
  set wildmenu
  set nowrap
  
" colorscheme
  syntax on
  set t_Co=256
  set background=dark
  colo solarized256
    
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

" navigation
  " tabs
    imap <F3> <ESC>;tabnew<CR>;e 
    map  <F3> <ESC>;tabnew<CR>;e 
    imap <F2> <ESC>;tabprev<CR>;o<CR>
    map  <F2> <ESC>;tabprev<CR>;o<CR>
    imap <F4> <ESC>;tabnext<CR>;o<CR>
    map  <F4> <ESC>;tabnext<CR>;o<CR>
  " exit
    imap <F8> <ESC><ESC><ESC>;q<CR>
    map  <F8> <ESC><ESC><ESC>;q<CR>
  " fast scrolling
	nnoremap m jjjj
	nnoremap , kkkk
	
	
" autosave
 let g:auto_save=1

" instead of :
  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;
   
" fast ESC

" compile and run
  function CompileAndRun()
    if &filetype == 'c'
        !gcc -DHOME % && ./a.out && rm a.out
    elseif &filetype == 'cpp'
        !g++ -DHOME -std=c++0x % && ./a.out && rm a.out
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
  
  command C call CompileAndRun()
  imap <F5> <ESC><CR>;call CompileAndRun()<CR>
  map  <F5> <ESC><CR>;call CompileAndRun()<CR>

