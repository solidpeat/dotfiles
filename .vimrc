" NeoBundle
source ~/dotfiles/.vimrc.neobundle

" --------------------------------------------------
" 基本設定
" --------------------------------------------------

" スクロール時の余白確保
set scrolloff=5
" スワップファイル作らない
set noswapfile
" バックアップファイルを作らない
set nobackup
" undoファイルを作らない
set noundofile
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

" 80文字目に線を表示
set colorcolumn=80

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
\  'cs',
\]

" .applescriptをAppleScriptとして認識させる
autocmd BufNewFile,BufReadPost *.applescript set filetype=applescript

" C#のregionで折りたたみ
" csharp.vim - C# Syntax file : vim online
" http://www.vim.org/scripts/script.php?script_id=116
function! CSharpFoldText(add)
  let line = getline(v:foldstart + a:add)
  let sub = substitute(line, '#region\s', '', 'i')
  let ts = &tabstop
  let text = ""
  while (l:ts > 0)
    let text = text . v:folddashes[0]
    let ts = ts - 1
  endwhile
  return substitute(sub, "\t", text, "g")
endfunction
autocmd FileType cs setlocal foldmethod=syntax
autocmd FileType cs setlocal foldcolumn=2
autocmd FileType cs setlocal foldtext=CSharpFoldText(0)

" JSONの折りたたみ
autocmd FileType json setlocal foldmethod=syntax
autocmd FileType json setlocal foldlevel=2
" jqの実行
" VimでJsonを整形したい - koturnの日記
" http://koturn.hatenablog.com/entry/2015/07/27/042519
if executable('jq')
  function! s:jq(...)
    execute '%!jq' (a:0 == 0 ? '.' : a:1)
  endfunction
  command! -nargs=? Jq  call s:jq(<f-args>)
endif

" --------------------------------------------------
" 移動
" --------------------------------------------------

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" 0, 1, 9で行頭、行末へ
nnoremap 0 ^
nnoremap 9 $

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

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 保存時にtabをスペースに変換する
" autocmd BufWritePre *[^{.cs}] :%s/\t/  /ge

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
" Escの2回押しでハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
" grep後自動でquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

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
