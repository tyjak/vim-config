set nocompatible               " be iMproved
scriptencoding utf-8
set encoding=utf-8

" bootstrap to auto-install vim-plug
so ~/.vim/bootstrap.vim

" Plugins"{{{

call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
"Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'vimwiki'
Plug 'fugitive.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'loremipsum'
Plug 'surround.vim'
Plug 'dbext.vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/calendar-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'mhinz/vim-startify'
Plug 'yuratomo/w3m.vim'
Plug 'vimoutliner/vimoutliner', { 'for' : ['votl','vimwiki'] }
Plug 'osyo-manga/vim-over' "search and replace improvment
Plug 'chase/vim-ansible-yaml', { 'for' : 'ansible' }
Plug 'tpope/vim-markdown', { 'for' : 'markdown' }
Plug 'mbbill/undotree'
Plug 'quickfixsigns'
"Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim', { 'for' : 'python' }
Plug 'toritori0318/vim-redmine', { 'on' : 'RedmineViewAllTicket' }
Plug 'junegunn/goyo.vim'
Plug 'dm4/vim-writer'
Plug 'jacekd/vim-iawriter'
Plug 'jamessan/vim-gnupg'
Plug 'drawit'

" vim-scripts repos
"Plug 'tpope/vim-unimpaired'
"Plug 'mtth/scratch.vim'
"Plug 'itchyny/calendar.vim'
"Plug 'https://github.com/jaxbot/browserlink.vim'
"Plug 'Lokaltog/vim-easymotion'
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plug 'tpope/vim-rails.git'
"Plug 'L9'
"Plug 'FuzzyFinder'

if !empty(glob("~/.vim/otherplugin"))
    so ~/.vim/otherplugin
endif

call plug#end()

filetype plugin indent on

" remap [] for tpope/vim-unimpaired
"nmap < [
"nmap > ]
"omap < [
"omap > ]
"xmap < [
"xmap > ]

"TODO rendre possible le mode dégradé -> True color -> 256 -> 16
" theme solarized"{{{
set t_Co=256
set termguicolors
let g:solarized_visibility = "normal"
colorscheme solarized8_dark
"if filereadable( expand("~/.vim/plugged/vim-colors-solarized/colors/solarized.vim") )
"    " Color scheme
"    colorscheme solarized
"endif

set background=dark

" easy vimrc quickopen, autoreload"{{{
autocmd! BufWritePost $MYVIMRC so $MYVIMRC
autocmd! BufRead,BufNew *.md set filetype=markdown

map ,v :tabe $MYVIMRC<CR>
map ,V :source $MYVIMRC<CR>
map ,i :tabe ~/.config/i3/config<CR>
map ,w :tabe ~/.config/vimb/config<CR>

" vim airline + font +gvim "{{{
" 
"set guifont=Liberation\ Mono\ for\ Powerline\ 10
"set guifont=Inconsolata\ for\ Powerline\ 10
"set guifont=MesloLGSDZ\ Nerd\ Font\ 9
"set guifont=TerminusFont \9
set guioptions-=m
set guioptions-=l
set guioptions-=r
set guioptions-=b
set guioptions-=T
set guioptions-=F
set guioptions-=e
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
set colorcolumn=80

" divers"{{{
syntax on
set history=10000
set magic 
set backupdir=~/.vimfiles/bak//          " backup files
set backup
set noswapfile
"set directory=~/.vimfiles/swp//          " swap files
set undodir  =~/.vimfiles/undo//         " undo files
set undofile                      " persistent undo
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showcmd
set number
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set ruler
set cursorline
set list listchars=nbsp:¤,tab:··,trail:¤,extends:▶,precedes:◀
" long completion menu
set wildmenu
set wildmode=list:longest,full
set hidden
set cryptmethod=blowfish2
set nofoldenable

" to open full link
let g:netrw_gx="<cWORD>"
let g:netrw_browsex_viewer= "xdg-open"

" Mappings"{{{

" remaping for azerty
let mapleader = ","
" remap c-[ for azerty keyboard
" noremap <C-ù> <C-]>

" Switch CWD to the directory of the open buffer
map <leader>; :cd %:p:h<cr>:pwd<cr>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" TODO see to fix alt macbook key
nmap ,j :.m+<cr>
nmap ,k :.m-2<cr>
vmap ,j :m+<cr>
vmap ,k :m-2<cr>

" Cycle beetween tab
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-j> :bprevious<CR>
nnoremap <C-k> :bnext<CR>

" easy choose a buffer
nnoremap <C-b> :buffers<CR>:buffer<Space>

" edit in a new tab with Startify
nnoremap <C-t> :tabnew<CR>:Startify<CR>

" toggle undotree
nnoremap U :UndotreeToggle<CR>:UndotreeFocus<CR>

" close current tab
"nnoremap <C-d> :tabclose<cr>

"delete current buffer
"nnoremap <C-x> :bdelete<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Join line without break as space
"map J gJ

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><space> :noh<cr>

" Smart way to move between windows
"nnoremap J <C-W>j
"nnoremap K <C-W>k
"nnoremap H <C-W>h
"nnoremap L <C-W>l

" open or create file under cursor
nnoremap gf :e <cfile><CR>

" dictionary
nmap <silent> <leader>se :set spelllang=en spell!<CR>
nmap <silent> <leader>sf :set spelllang=fr spell!<CR>
imap <C-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <C-f> [s1z=<c-o>

"nmap t :tabe<cr>

" pour vimoutliner
let maplocalleader = ',,'

" quelques commandes"{{{
command! -nargs=1 Mks mksession ~/.vimfiles/sessions/<args>
command! -nargs=1 Ops source ~/.vimfiles/sessions/<args>

" Quelques abbréviations"{{{
iab <expr> hms strftime("%T")
iab <expr> ymd strftime("%y%m%d")
iab <expr> --c strftime("%c")
iab <expr> --f strftime("%F")

" quelques autocommand"{{{
augroup filemng
    autocmd!
    autocmd FileType vimwiki set nonumber | set linebreak
    "autocmd BufWritePost *.wiki silent Vimwiki2HTML
    "au! BufRead,BufNewFile *.wiki    setfiletype wiki.votl
    autocmd FileType help nnoremap <S-q> :q<CR>
    autocmd FileType help nnoremap <space> f\|
    autocmd FileType help nnoremap <CR> <C-]>
augroup END

" Goyo"{{{
augroup goyo
    au!
    map <C-g> :Goyo<CR>
augroup END

let g:goyo_width=100
"let g:goyo_height=90
"let g:goyo_margin_top=2
"let g:goyo_margin_bottom=2

function! s:goyo_enter()
  "colorscheme iawriter
  if has('gui_running')
  endif
  colorscheme solarized8_light
  "set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 11
  set background=light
  highlight Cursor guifg=#859900 guibg=white
  highlight iCursor guifg=white guibg=#2aa198
  highlight vCursor guifg=#d33682 guibg=white
  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=v:ver100-vCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10
  set linespace=4
endfunction

function! s:goyo_leave()
  "colorscheme solarized
  set background=dark
  set linespace=0
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Plugin setup"{{{

let g:GPGDefaultRecipients = ['david@tyjak.net']

"Gist setup"{{{
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_show_privates = 1
"let g:gist_list_vsplit = 1

" settings perso
so ~/.vim/vimrc.local

" vim: set foldmethod=marker:
