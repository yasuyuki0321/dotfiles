" 行番号を表示
set number

" □や○文字が崩れる問を解決
set ambiwidth=double

" クリップボードを使用
set clipboard=unnamed,autoselect

"ビープ音すべてを無効にする
set visualbell t_vb=

"エラーメッセージの表示時にビープを鳴らさない"
set noerrorbells

" 検索するときに大文字小文字を区別しない
set ignorecase

" 検索文字列に大文字と小文字が混在した場合に限り、大文字と小文字を区別して検索
set smartcase

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan

" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch

" 検索結果をハイライト表示
set hlsearch

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" 対応する括弧やブレースを表示
set showmatch
set matchtime=1

" ステータス行を常に表示
set laststatus=2

" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd

" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab

" インデント幅
set shiftwidth=4

" タブキー押下時に挿入される文字幅を指定
set softtabstop=4

" ファイル内にあるタブ文字の表示幅
set tabstop=4

" 改行時に前の行のインデントを継続する
set autoindent

" スワップファイルを作成しない
set noswapfile

" シンタックスハイライト
syntax on

" コマンドモードの補完
set wildmenu

" カラースキームをhybridに変更
set background=dark
colorscheme hybrid

" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> : nohlsearch<CR><ESC>
nnoremap <C-o><C-n> : set number <Esc>
nnoremap <C-n><C-n> : set nonumber <Esc>
nnoremap <C-o><C-p> : set paste <Esc>
nnoremap <C-n><C-p> : set nopaste <Esc>

