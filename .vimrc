filetype off

" display
set number
hi LineNr ctermfg=darkgray
set laststatus=2
set statusline=%<[%n]\ %F\ %m%r%h%w%=%l/%L\ %P\ %{fugitive#statusline()}
set cmdheight=2
set showcmd
set list
set listchars=tab:»-,trail:-
set helpheight=999
set nocursorline
set nocursorcolumn

" move cursor
set backspace=indent,eol,start
set scrolloff=5
set nostartofline

" file
set hidden
set confirm
set autoread
set noswapfile
set nobackup

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan

" beep
set visualbell
set t_vb=
set noerrorbells

" command line
set wildmenu
set wildmode=list:longest,full
set history=50

" mouse
set mouse=a

" tab, indent
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=0

augroup fileTypeIndent
  autocmd!
  autocmd FileType php setlocal shiftwidth=4 tabstop=4
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" mapping
map Y y$
nnoremap j gj
nnoremap k gk
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-n> :NeoBundleInstall
nnoremap <C-k> :%s/
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" others
set pastetoggle=<F11>
set notimeout ttimeout ttimeoutlen=200

" NeoBundle
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'linux' : 'make',
  \     'unix' : 'gmake',
  \    },
  \ }
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'jpalardy/vim-slime'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'tpope/vim-fugitive'
call neobundle#end()

filetype plugin indent on

" Installation check
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

syntax on

autocmd BufWritePre * :%s/\s\+$//ge
