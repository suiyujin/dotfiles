filetype off

" display
set number
set laststatus=2
set statusline=%<[%n]\ %F\ %m%r%h%w%=%l/%L\ %P\ %{fugitive#statusline()}
set cmdheight=2
set showcmd
set list
set listchars=tab:»-,trail:-
set helpheight=999
set nocursorline
set nocursorcolumn
set display=lastline

" window
set splitbelow
set splitright

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
noremap <Space>h ^
noremap <Space>l $
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-k> :%s/
nnoremap cpr :cprevious<CR>
nnoremap cne :cnext<CR>
nnoremap cfi :<C-u>cfirst<CR>
nnoremap cla :<C-u>clast<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-\> vnew<CR>
cnoremap <C-_> new<CR>

" others
set pastetoggle=<F11>
set notimeout ttimeout ttimeoutlen=100
set clipboard=unnamed

" NeoBundle
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'

  NeoBundle 'basyura/unite-rails'
  NeoBundle 'jreybert/vimagit'
  NeoBundle 'junegunn/vim-easy-align'
  NeoBundle 'kana/vim-textobj-function'
  NeoBundle 'kana/vim-textobj-jabraces'
  NeoBundle 'kana/vim-textobj-syntax'
  NeoBundle 'kana/vim-textobj-user'
  NeoBundle 'kannokanno/previm'
  NeoBundle 'LeafCage/yankround.vim'
  NeoBundle 'marcus/rsense'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'nishigori/increment-activator'
  NeoBundle 'rhysd/vim-textobj-ruby'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/unite.vim'
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
  NeoBundle 'supermomonga/neocomplete-rsense.vim', {
  \  'autoload' : {
  \    'insert' : 1,
  \    'filetypes': 'ruby',
  \  }
  \}
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'thinca/vim-visualstar'
  NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tyru/caw.vim'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'vim-scripts/AnsiEsc.vim'
  NeoBundle 'vim-scripts/ruby-matchit'
  NeoBundle 'yonchu/accelerated-smooth-scroll'
call neobundle#end()

filetype plugin indent on

" Installation check
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

" settings for plugin
nnoremap <C-n> :NeoBundleInstall

" vimagit
let g:magit_default_show_all_files = 2
let g:magit_default_fold_level = 2
nnoremap <Space>Mv :call magit#show_magit('v')<CR>
nnoremap <Space>Mh :call magit#show_magit('h')<CR>

" eazy align
xmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" previm
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,txt,mdwn,mkd,mkdn,mark*} set filetype=markdown
  nmap <Space>pre [previm]
  nnoremap <silent> [previm]o :PrevimOpen<CR>
  nnoremap <silent> [previm]r :call previm#refresh()<CR>
augroup END

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" increment-activator
let g:increment_activator_filetype_candidates = {
  \   '_' : [
  \     ['月', '火', '水', '木', '金', '土', '日']
  \   ],
  \   'ruby' : [
  \     ['nil', 'empty', 'present', 'blank']
  \   ]
  \ }

" nerdtree
nnoremap <silent><C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" neocomplete or neocomplcache
if neobundle#is_installed('neocomplete')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  " only english
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  let g:neocomplete#max_list = 20
  " rsense
  " if !exists('g:neocomplete#force_omni_input_patterns')
  "   let g:neocomplete#force_omni_input_patterns = {}
  " endif
  " let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
elseif neobundle#is_installed('neocomplcache')
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  " only english
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_max_list = 20
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" unite
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]f   :<C-u>Unite file<CR>
nnoremap <silent> [unite]m   :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r   :<C-u>UniteResume<CR>
nnoremap <silent> [unite]g   :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]cg  :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> [unite]y   :<C-u>Unite yankround<CR>
nnoremap <silent> [unite]rc  :<C-u>Unite rails/controller<CR>
nnoremap <silent> [unite]rm  :<C-u>Unite rails/model<CR>
nnoremap <silent> [unite]rv  :<C-u>Unite rails/view<CR>
nnoremap <silent> [unite]rh  :<C-u>Unite rails/helper<CR>
nnoremap <silent> [unite]rd  :<C-u>Unite rails/db<CR>
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nnoremap <silent> <buffer> <expr> <C-_> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-_> unite#do_action('split')
  nnoremap <silent> <buffer> <expr> <C-\> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-\> unite#do_action('vsplit')
endfunction

" rsense
let g:rsenseUseOmniFunc = 1

" quickrun
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }

" visualstar
map * <Plug>(visualstar-*)N

" caw
map <C-_> <Plug>(caw:i:toggle)

" open-browser
nmap <Space>o <Plug>(openbrowser-smart-search)

" accelerated-smooth-scroll
let g:ac_smooth_scroll_du_sleep_time_msec = 3
let g:ac_smooth_scroll_fb_sleep_time_msec = 3

colorscheme jellybeans
syntax on

autocmd BufWritePre * :%s/\s\+$//ge
