colorscheme darkblack
syntax on
set number

" Highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=242

" Vim-airline configuration
let g:airline_theme='base16_macintosh'

" Nerdtree configuration
hi Directory ctermfg=green

" Mapping various keys
" Ctrl+e to get to end of the line
map <C-e> $i<right>

" Ctrl+f to open nerdtree
map <C-f> :NERDTreeToggle<CR>
