set nocompatible               " be iMproved

" Plugins"{{{
filetype off                   " required!

call vundle#rc()

Plugin 'Solarized'
Plugin 'vimwiki'
Plugin 'fugitive.vim'
Plugin 'bling/vim-airline'
Plugin 'loremipsum'
Plugin 'surround.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/calendar-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'mtth/scratch.vim'
Plugin 'mhinz/vim-startify'
Plugin 'yuratomo/w3m.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
"Plugin 'https://github.com/jaxbot/browserlink.vim'

" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'

" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required! "}}}

" theme solarized"{{{
set t_Co=16
set background=dark
colorscheme solarized
"}}}

" easy vimrc quickopen, autoreload"{{{
autocmd! BufWritePost $MYVIMRC so $MYVIMRC

map ,v :tabe $MYVIMRC<CR>
map ,V :source $MYVIMRC<CR>
map ,i :tabe ~/.config/i3/config<CR>
"}}}

" vim airline + font +gvim "{{{
"set guifont=Liberation\ Mono\ for\ Powerline\ 10
"set guifont=Inconsolata\ for\ Powerline\ 10
set guioptions-=m
set guioptions-=l
set guioptions-=r
set guioptions-=b
set guioptions-=T
set guioptions-=F
set guioptions-=e
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 9
let g:airline_powerline_fonts = 1
set laststatus=2"}}}
let g:airline#extensions#branch#enabled = 1

" remaping for azerty
let mapleader = ","
nnoremap <C-*> <C-]>

" divers"{{{
syntax on
set history=10000
set magic 
set backupdir=~/.vimfiles/bak          " backup files
set directory=~/.vimfiles/swp          " swap files
set undodir  =~/.vimfiles/undo         " undo files
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
"}}}
" Mappings"{{{

" Switch CWD to the directory of the open buffer
map <leader>, :cd %:p:h<cr>:pwd<cr>

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

" close current tab
nnoremap <C-d> :tabclose<cr>

"delete current buffer
nnoremap <C-x> :bdelete<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><space> :noh<cr>

" Smart way to move between windows
nnoremap J <C-W>j
nnoremap K <C-W>k
nnoremap H <C-W>h
nnoremap L <C-W>l

" open or create file under cursor
nnoremap gf :e <cfile><CR>

" dictionary
nmap <silent> <leader>se :set spelllang=en spell!<CR>
nmap <silent> <leader>sf :set spelllang=fr spell!<CR>

"nmap t :tabe<cr>"}}}

" quelques commandes
command! -nargs=1 Mks mksession ~/.vimfiles/sessions/<args>
command! -nargs=1 Ops source ~/.vimfiles/sessions/<args>

"Plugin setup"{{{

" vimwiki setup"{{{
"vimwiki conversion auto des fichiers du wiki en html
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/Sites/tyjak.github.io/'}]
autocmd! BufWritePost *.wiki silent Vimwiki2HTML"}}}

"Startify setup"{{{
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ '~/.muttrc-local','~/.config/i3/config','~/.config/i3/status.py' ]"}}}
"}}}

" on ouvre dwb
"function! VimwikiLinkHandler(link)
"try
"  let browser = '/usr/bin/i3-msg -q focus parent split horizontal exec "/usr/bin/dwb -n"'
"  execute 'silent !'.browser.' ' . a:link
"  return 1
"catch
"  echo "This can happen for a variety of reasons ..."
"endtry
"return 0
"endfunction


" vim: set foldmethod=marker:
