colorscheme darkblack
syntax on
set number

" Highlighting line
" hi CursorLine cterm=NONE ctermbg=green
" hi CursorColumn cterm=NONE ctermbg=green
hi CursorLine cterm=NONE ctermbg=240
hi CursorColumn cterm=NONE ctermbg=240
hi Directory ctermfg=green


" Lightline
set laststatus=2

let g:lightline = {
	\ 'colorscheme' : '16color',
	\ }

" Mapping various keys
" Ctrl+e to get to end of the line
map <C-e> $i<right> 

" Ctrl+f to open vifm 
map <C-f> :Vifm <CR>
map <C-v> :Vsplit Vifm <CR>

" Nerdtree
map <C-n> :NERDTreeToggle <CR>

" Ctrl-a to make green line
" Ctrl-z to make green vertical line
map <C-a> :set cursorline! <CR> 
map <C-z> :set cursorcolumn! <CR>

" Disabling arrow keys
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
vnoremap <Right> <nop>
vnoremap <Up> <Nop>
