scriptencoding utf-8
set encoding=utf-8
set pyxversion=3

" bootstrap to auto-install vim-plug
so ~/.vim/bootstrap.vim

" Plugins"{{{

call plug#begin('~/.vim/plugged')

" essentials
Plug 'ryanoasis/vim-devicons'                       " filetype icons
Plug 'lilydjwg/colorizer'                           " colorize test color ref
Plug 'lifepillar/vim-solarized8'                    " solarized themz
Plug 'vim-scripts/vimwiki'                          " vim wiki
Plug 'vim-airline/vim-airline'                      " custom status line
Plug 'vim-airline/vim-airline-themes'               " theme solarized status
Plug 'junegunn/fzf.vim'                             " power search
Plug 'tpope/vim-fugitive'                           " git integration
Plug 'tpope/vim-repeat'                             " . repeat map plugin
Plug 'tpope/vim-git'                                " git ft, indent, ...
Plug 'mattn/gist-vim'                               " gist interface
Plug 'mattn/webapi-vim'                             " gist dependancy
Plug 'mhinz/vim-startify'                           " start page
Plug 'pearofducks/ansible-vim'                      " ansible plugin

" utilities
Plug 'jamessan/vim-gnupg'
Plug 'will133/vim-dirdiff'
Plug 'mattn/emmet-vim'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/surround.vim'
Plug 'vim-scripts/loremipsum'
Plug 'vimoutliner/vimoutliner', { 'for' : ['votl','vimwiki'] }
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
"Plug 'toritori0318/vim-redmine', { 'on' : 'RedmineViewAllTicket' }
Plug 'junegunn/goyo.vim'
Plug 'dm4/vim-writer'
Plug 'marhop/vim-pal'
Plug 'jacekd/vim-iawriter'
Plug 'vim-scripts/drawit'
Plug 'sk1418/HowMuch'
Plug 'chrisbra/csv.vim'
Plug 'tyjak/vim-redact-pass'
"Plug 'fszymanski/deoplete-emoji'
"Plug 'tbabej/taskwiki', { 'for' : 'vimwiki' }
"Plug 'tpope/vim-unimpaired'
"Plug 'mtth/scratch.vim'
"Plug 'itchyny/calendar.vim'
"Plug 'https://github.com/jaxbot/browserlink.vim'
"Plug 'Lokaltog/vim-easymotion'
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plug 'tpope/vim-rails.git'
"Plug 'vim-scripts/L9'
"Plug 'vim-scripts/FuzzyFinder'

" in test
"Plug 'dm4/vim-writer'
"Plug 'honza/vim-snippets'
"Plug 'osyo-manga/vim-over' "search and replace improvment
Plug 'wincent/ferret' " for search ans substitute via Ripgrep and :Ack command
"Plug 'yuratomo/w3m.vim'
"Plug 'maralla/completor.vim'
"Plug 'ActivityWatch/aw-watcher-vim' " NOTE : ne supporte pas plusieurs
                                     " instances de vim

" dev or specific env plugin
if !empty(glob("~/.vim/otherplugin.vim"))
    so ~/.vim/otherplugin.vim
endif

call plug#end()

filetype plugin indent on

" map [] for tpope/vim-unimpaired
"nmap < [
"nmap > ]
"omap < [
"omap > ]
"xmap < [
"xmap > ]

" get FZF working
set rtp+=/usr/bin/fzf

" theme solarized"{{{
let &t_8f = "[38;2;%lu;%lu;%lum"
let &t_8b = "[48;2;%lu;%lu;%lum"

set termguicolors
"set t_Co=256
let g:solarized_visibility = "high"
let g:solarized_term_italics = 1
colorscheme solarized8
set background=dark
set fillchars+=vert:\ 

" default tools for search"{{{
set grepprg=rg\ --vimgrep

" easy vimrc quickopen, autoreload"{{{
augroup startup
  autocmd!
  autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup end

" vim airline + font +gvim "{{{
"
"set guifont=Liberation\ Mono\ for\ Powerline\ 10
"set guifont=Inconsolata\ for\ Powerline\ 10
set guifont=MesloLGSDZ\ Nerd\ Font\ Mono\ 9
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

" divers"{{{
syntax on
set history=10000
set magic
set backup
set backupdir=~/.vimfiles/bak//       " backup files
set noswapfile
"set directory=~/.vimfiles/swp//      " swap files
set undofile                          " persistent undo
set undodir  =~/.vimfiles/undo//      " undo files
set tabstop=4
set shiftwidth=4
set expandtab
set nosmarttab
set showcmd
set showmatch
set number
"set relativenumber
set hlsearch
set incsearch
set gdefault
set ignorecase
set smartcase
set autoindent
set ruler
set cursorline
set list listchars=nbsp:¤,tab:\ \ ,trail:¤,extends:▶,precedes:◀

" long completion menu
set wildmenu
set wildmode=list:longest,full
set hidden
set nofoldenable
set path=.,**

if expand("%:p:h") =~ '^/dev/shm'
     set nobackup
     set noswapfile
     set noundofile
endif

" color
highlight WarningMsg guifg=#002b36
highlight WarningMsg guibg=#b58900

" to open full link
let g:netrw_gx="<cWORD>"
let g:netrw_browsex_viewer= "xdg-open"

" Mappings"{{{

map ,v :tabe $MYVIMRC<CR>
map ,V :source $MYVIMRC<CR>
map ,i :tabe ~/.config/i3/config<CR>
map ,s :tabe ~/.config/i3/status.py<CR>
map ,w :tabe ~/.config/vimb/config<CR>
nmap <space> :Files<CR>
nmap ,b :Buffer<CR>


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
nmap <silent> <C-h> :tabprevious<CR>
nmap <silent> <C-l> :tabnext<CR>
nmap <silent> <C-j> :bprevious<CR>
nmap <silent> <C-k> :bnext<CR>

" easy choose a buffer
"nmap <silent> <C-b> :buffers<CR>:buffer<Space>
nmap <leader>b :Buffers<CR>

" edit in a new tab with Startify and FZF
nmap <silent> <C-t> :tabnew<CR>:Startify<CR>:Files<CR>

" toggle undotree
nmap U :UndotreeToggle<CR>:UndotreeFocus<CR>

" close current tab
"nmap <C-d> :tabclose<cr>

"delete current buffer
"nmap <C-x> :bdelete<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Join line without break as space
"map J gJ

" Disable highlight when <leader><cr> is pressed
map <silent> <leader>: :noh<cr>

" Smart way to move between windows
"nmap J <C-W>j
"nmap K <C-W>k
"nmap H <C-W>h
"nmap L <C-W>l
set splitbelow
set splitright

" open or create file under cursor
nmap gF :e <cfile><CR>

" dictionary
nmap <silent> <leader>se :set spelllang=en spell!<CR>
nmap <silent> <leader>sf :set spelllang=fr spell!<CR>
imap <silent> <C-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <silent> <C-f> [s1z=<c-o>
"nmap t :tabe<cr>

" deoplete tab-complete
"inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <expr> <tab>o pumvisible() ? "\<c-x>\<c-o>" : "\<tab>"

" vimoutliner
let maplocalleader = ',,'

" some abreviations"{{{
iab <expr> hms strftime("%T")
iab <expr> ymd strftime("%y%m%d")
iab <expr> dmy strftime("%d-%m-%Y")
iab <expr> --c strftime("%c")
iab <expr> --d strftime("%a %d %b %Y")
iab <expr> --f strftime("%F")

" some autocommand"{{{
augroup filemng
  autocmd!
  autocmd BufRead,BufNew *.md set filetype=markdown
  autocmd FileType vimwiki,markdown set nonumber |
                                    set norelativenumber |
                                    set linebreak |
                                    let g:solarized_visibility = "low" |
                                    let g:solarized_contrast = "low"

  autocmd FileType yaml,ansible setlocal ts=2 sts=2 sw=2 expandtab
  "autocmd BufWritePost *.wiki silent Vimwiki2HTML
  "au! BufRead,BufNewFile *.wiki    setfiletype wiki.votl
  autocmd FileType help nmap <buffer> q :q<CR>
  autocmd FileType help nmap <buffer> <space> f\|
  autocmd FileType help nmap <buffer> <CR> <C-]>
augroup end

augroup my_git_rebase
  autocmd!
  autocmd FileType gitrebase nmap <buffer> F :Fixup<cr>
  autocmd FileType gitrebase nmap <buffer> E :Edit<cr>
  autocmd FileType gitrebase nmap <buffer> S :Cycle<cr>
  autocmd FileType gitrebase nmap <buffer> R :Reword<cr>
augroup END

"let g:vimwiki_ext2syntax = {'.md': 'markdown',
"                \ '.mkd': 'markdown',
"                \ '.wiki': 'media'}
" Goyo"{{{
"augroup goyo
"  au!
"  map <C-g> :Goyo<CR>
"augroup end

let g:goyo_width=100
"let g:goyo_height=90
"let g:goyo_margin_top=2
"let g:goyo_margin_bottom=2

function! s:goyo_enter()
  "colorscheme iawriter
  if has('gui_running')
  endif
  colorscheme solarized8
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

augroup goyo
  autocmd!
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup end

"Plugin setup"{{{

"Vim-http
let g:vim_http_split_vertically = 1

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"Startify settings"{{{
let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 1

"Gist setup"{{{
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_show_privates = 1
"let g:gist_list_vsplit = 1

"GitGutter settings
nmap <Down> <Plug>(GitGutterNextHunk)
nmap <Up> <Plug>(GitGutterPrevHunk)
nmap <Return> <Plug>(GitGutterPreviewHunk)
highlight GitGutterChange guifg=#002b36
highlight GitGutterChange guibg=#b58900
highlight GitGutterDelete guifg=#fcf6e3
highlight GitGutterDelete guibg=#dc322f
highlight GitGutterChangeDelete guifg=#fcf6e3
highlight GitGutterChangeDelete guibg=#dc322f
highlight GitGutterAdd guifg=#002b36
highlight GitGutterAdd guibg=#859900
"let g:gitgutter_sign_added              = ''
"let g:gitgutter_sign_modified           = ''
"let g:gitgutter_sign_removed            = ''
"let g:gitgutter_sign_removed_first_line = '‾'
"let g:gitgutter_sign_modified_removed   = ''

"fzf use ripgrep instead of ag"{{{
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* Rgcw
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(expand("<cword>")), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nmap <leader><Space> :Rgcw<CR>

"Deoplete settings {{{
"let g:python3_host_prog = '~/.virtualenvs/vim/bin/python'
"let g:deoplete#enable_at_startup = 1
"if !exists('g:deoplete#omni#input_patterns')
"  let g:deoplete#omni#input_patterns = {}
"endif
"" let g:deoplete#disable_auto_complete = 1
"augroup deoplete
"  autocmd!
"  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"augroup end
""call deoplete#custom#set('emoji', 'filetypes', ['wiki','md'])

""Completor
""let g:completor_python_binary = '/home/david/.virtualenvs/vim/bin/python'
"" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
"" dictionary, source files, and completor to find matching words to complete.
"
"" Note: usual completion is on <C-n> but more trouble to press all the time.
"" Never type the same word twice and maybe learn a new spellings!
"" Use the Linux dictionary when spelling is in doubt.
"function! Tab_Or_Complete() abort
"  " If completor is already open the `tab` cycles through suggested completions.
"  if pumvisible()
"    return "\<C-N>"
"  " If completor is not open and we are in the middle of typing a word then
"  " `tab` opens completor menu.
"  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"    return "\<C-R>=completor#do('complete')\<CR>"
"  else
"    " If we aren't typing a word and we press `tab` simply do the normal `tab`
"    " action.
"    return "\<Tab>"
"  endif
"endfunction
"
"" Use `tab` key to select completions.  Default is arrow keys.
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
"" Use tab to trigger auto completion.  Default suggests completions as you type.
"let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> Tab_Or_Complete()

" my env settings"{{{
so ~/.vim/vimrc.local

" vim: set foldmethod=marker:textwidth=78
