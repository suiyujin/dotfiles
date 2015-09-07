" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
" filetype indent plugin on
 filetype off

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" オートインデント
set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" ビジュアルベルを無効化
set t_vb=

" 全モードでマウスを有効化
set mouse=a

" コマンドラインの高さを2行に
set cmdheight=2

" 行番号を表示
set number

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

" タブ文字の代わりにスペース2個を使う場合の設定。
set shiftwidth=2
set softtabstop=2
set expandtab

" augroup vimrc_indent
"   autocmd! FileType php setlocal shiftwidth=4 softtabstop=4
" augroup END

" Yの動作をDやCと同じにする
map Y y$

" <C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

" NERDTree
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" クリップボードにコピーする
set clipboard=unnamed,autoselect

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    " originalrepos on github
    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/vimproc'
    NeoBundle 'VimClojure'
    NeoBundle 'Shougo/vimshell'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'jpalardy/vim-slime'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'Townk/vim-autoclose'
  call neobundle#end()
endif

filetype plugin indent on     " required!
filetype indent on

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  " finish
endif

" 色づけをオン
syntax on
"set background=dark
"colorscheme solarized

"保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge
"保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
