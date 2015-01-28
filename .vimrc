" NeoBundle
source ~/dotfiles/.vimrc.neobundle

" --------------------------------------------------
" 基本設定
" --------------------------------------------------

" スクロール時の余白確保
set scrolloff=5
" スワップファイル作らない
set noswapfile
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" コマンドをステータス行に表示(ciとかのやつ)
set showcmd
" OSのクリップボードを使用
set clipboard+=unnamed
" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" --------------------------------------------------
" 表示
" --------------------------------------------------

" 行番号表示
set number
" 不可視文字表示
set list
" 不可視文字の表示形式
set listchars=tab:^\ ,trail:_,extends:>,precedes:<
" 印字不可能文字を16進数で表示
set display=uhex
" 全角スペースの表示
" vim-jp » Hack #40: 不可視文字を表示する
" http://vim-jp.org/vim-users-jp/2009/07/12/Hack-40.html
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" カーソル行をハイライト
set cursorline

" シンタックスハイライト
syntax on

" カラースキーマ
set t_Co=256
colorscheme molokai

" .mdをmarkdownとして認識させる
autocmd BufNewFile,BufRead *.md set filetype=markdown
" markdown内のコードをハイライト
let g:markdown_fenced_languages = [
\  'html',
\  'css',
\  'sass',
\  'javascript',
\  'coffee',
\  'php',
\]

" --------------------------------------------------
" 移動
" --------------------------------------------------

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" 0, 1, 9で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $

" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" insert mode でjjでesc
inoremap jj <Esc>

" --------------------------------------------------
" 編集
" --------------------------------------------------

" タブの代わりに空白文字を挿入する
set expandtab
" ファイル内の <Tab> が対応する空白の数
set tabstop=2
" 自動的にインデントされる幅
set shiftwidth=2
" Tabを押下した際の空白の数（バックスペースで消す数に影響する）
set softtabstop=2
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
" 保存時に^Mを削除する
autocmd BufWritePre * :%s///ge

" バックスペースキーでいろいろ削除
set backspace=indent,eol,start

" --------------------------------------------------
" 検索
" --------------------------------------------------

" インクリメンタルサーチ
set incsearch
" 大文字小文字無視
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字をハイライト
set hlsearch

" --------------------------------------------------
" ステータスライン
" --------------------------------------------------

" 常にステータスラインを表示
set laststatus=2
" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" --------------------------------------------------
" プラグインの設定を読み込み
" --------------------------------------------------

source ~/dotfiles/.vimrc.plugins
