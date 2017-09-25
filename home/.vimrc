" エンコーディング
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

" ファイルバックアップを無効化
set nowritebackup
set nobackup

" タブ関連
set expandtab                      " タブ入力を複数のスペースに置換(ソフトタブ)
set tabstop=4                      " タブ文字の表示幅
set smartindent                    " 自動インデント
set shiftwidth=4                   " 自動インデントの幅

" 検索
set ignorecase                     " 検索時に大文字小文字を区別しない
set smartcase                      " 大文字が含まれる場合は大文字小文字を区別する
set wrapscan                       " 検索がファイル末尾まで進んだら先頭に戻る
set incsearch                      " インクリメンタルサーチ
set hlsearch                       " 検索結果をハイライト表示
nnoremap <Esc><Esc> :nohlsearch<CR><ESC> " Escの2回押しでハイライト消去

" UI
syntax enable                      " シンタックスハイライト
set list                           " 不可視文字の表示
set listchars=tab:>-,trail:-,eol:$ " 不可視文字の表示フォーマット
set number                         " 行番号を表示
set title                          " タイトルを表示
set ruler                          " 現在のカーソル位置を表示
set showcmd                        " 入力中のコマンドを表示
set showmatch                      " 対応する括弧を強調表示
set matchpairs+=<:>                " 対応括弧に<と>のペアを追加
set vb t_vb=                       " ビープ音を消す
set whichwrap=b,s,h,l,<,>,[,]      " カーソルを行をまたいで移動
set backspace=indent,eol,start     " バックスペースの削除拡張

" マウス対応
set mouse=a
set ttymouse=xterm2

" その他
set pastetoggle=<C-E>              " Ctrl-Eでペーストモードに移行
set clipboard=unnamed,autoselect   " ヤンクでクリップボードにコピー
autocmd InsertLeave * set nopaste  " 挿入モード解除時にペーストモードも削除
