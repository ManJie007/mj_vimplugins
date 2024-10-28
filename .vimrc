"base
"display
set number
set showmode
set showcmd
set nocompatible
syntax enable
set mouse=a
set encoding=utf-8
set t_Co=256
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set showmatch
set hlsearch
set incsearch
set nobackup
set noswapfile
set autoread
set wildmenu
set wildmode=longest:list,full
filetype plugin on
filetype plugin on
filetype indent on
set path+=/usr/include

"custom
"leader
let mapleader = ","

" 在插入模式下按 'jk' 退出插入模式
inoremap <silent> jk <Esc>

" Ctrl + s 保存当前文件
nnoremap <C-s> :w<CR>

" 在普通模式下按 ';' 进入命令行模式
nnoremap ; :

"借鉴了unimpaired.vim
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [t :tprevious<CR>
nnoremap <silent> ]t :tnext<CR>
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

"可视模式下的*、#
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

"参考amix/vimrc
"Smart way to move between windows
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l

" plugins
"colorscheme
set background=dark
colorscheme gruvbox

"NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>

"Ack
nnoremap <leader>aa :Ack<Space>
nnoremap <leader>aw :Ack <C-R><C-W><CR>

"Ctrlp or leaderf
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>ft :CtrlPTag<CR>

"lightline.vim
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'apprentice',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ], [ 'percent' ] ],
      \ },
      \ }
