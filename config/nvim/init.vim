let mapleader = " " "leader is space
let NERDTreeShowHidden=1
set number
set cursorline!
colorscheme wgt

" Plugins
map <leader>f :NERDTreeToggle <CR>
map <leader>v :Vifm <CR>

" Line highlighting
hi CursorLine cterm=NONE ctermbg=240
hi CursorColumn cterm=NONE ctermbg=240

" Status line
hi StatusLine ctermbg=0 ctermfg=2
set statusline=%f
set statusline+=%y
set statusline+=%m
set statusline+=%r
set statusline+=\ %=
set statusline+=Line:%l/%L[%p%%]
set statusline+=\ Col:%c
set statusline+=\ Buf:%n
set statusline+=\ ASCII:[%b][0x%B]

" Set cursor line
map <leader>c :set cursorline! <CR>

" Get to the end of the line
map <leader>e A

" Quick save
map <leader>w :w <CR>

" Quick quit
map <leader>q :wq <CR>

" Quick save and quit
map <leader>r :q! <CR>

" Split panes
map <leader>v <C-w>v <CR>
map <leader>h <C-w>h <CR>

" Move between panes
map <leader>h <C-w>h <CR>
map <leader>l <C-w>l <CR>

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
