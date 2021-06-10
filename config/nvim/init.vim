" So I can see the line number
set number
set cursorline!
colorscheme wgt

" Line highlighting
hi CursorLine cterm=NONE ctermbg=240
hi CursorColumn cterm=NONE ctermbg=240

map <C-a> :set cursorline! <CR>

" Get to the end of the line
map <C-e> A

" Disable arrow keys
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
