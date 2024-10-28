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

"easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" s{char}{char} to move to {char}{char}
nnoremap s <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
noremap <Leader>j <Plug>(easymotion-j)
noremap <Leader>k <Plug>(easymotion-k)

" tagbar
nnoremap <leader>t :TagbarToggle<CR>

" vim-tmux-navigator
" ~/.tmux.conf
"# Smart pane switching with awareness of Vim splits.
"# See: https://github.com/christoomey/vim-tmux-navigator
"is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
"    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
"bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
"bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
"bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
"bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
"tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
"if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
"    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
"if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
"    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
"
"bind-key -T copy-mode-vi 'C-h' select-pane -L
"bind-key -T copy-mode-vi 'C-j' select-pane -D
"bind-key -T copy-mode-vi 'C-k' select-pane -U
"bind-key -T copy-mode-vi 'C-l' select-pane -R
"bind-key -T copy-mode-vi 'C-\' select-pane -l

" TODO Omnicppcomplete
" TODO neocomplcache youcompleteme vim-lsp
" TODO tags for std c++ https://www.vim.org/scripts/script.php?script_id=2358
