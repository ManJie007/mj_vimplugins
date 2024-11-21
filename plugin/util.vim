" 快捷键绑定，<leader>ps 调用该功能
vnoremap <leader>ps :<C-u>call <SID>PadToColumn()<CR>

" 定义自定义命令 PadToColumn，用于调用脚本局部函数
"command! -range PadToColumn <line1>,<line2>call <SID>PadToColumn()

function! s:PadToColumn()
  let column = input("Target Column: ")
  execute "'<,'>s/\\(.*\\)/\\=printf('%-".column."s', submatch(1))/"
endfunction
