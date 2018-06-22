if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

"setting
""文字コードをUFT-8に設定
 set fenc=utf-8
 set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
 " バックアップファイルを作らない
 set nobackup
 " スワップファイルを作らない
 set noswapfile
 " undo fileを作らない
 set noundofile
 " 編集中のファイルが変更されたら自動で読み直す
 set autoread
 " バッファが編集中でもその他のファイルを開けるように
 set hidden
 " 入力中のコマンドをステータスに表示する
 set showcmd
 "use clipboard
 set clipboard=unnamed,autoselect
 "save to corrent directory
 set browsedir=buffer
 " 見た目系
 " 行番号を表示
 set number
 " 行末の1文字先までカーソルを移動できるように
 set virtualedit=onemore
 " indent
 set cindent
 set visualbell
 " 括弧入力時の対応する括弧を表示
 set showmatch
 " ステータスラインを常に表示
 set laststatus=2
 " コマンドラインの補完
 set wildmode=list:longest
 " 折り返し時に表示行単位での移動できるようにする
 nnoremap j gj
 nnoremap k gk

 " Tab系
  set tabstop=2
  " 行頭でのTab文字の表示幅
  set shiftwidth=2


  " 検索系
  " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
  set ignorecase
  " 検索文字列に大文字が含まれている場合は区別して検索する
  set smartcase
  " 検索文字列入力時に順次対象文字列にヒットさせる
  set incsearch
  " 検索時に最後まで行ったら最初に戻る
  set wrapscan
  " 検索語をハイライト表示
  set hlsearch
  " ESC連打でハイライト解除
  colorscheme ron
