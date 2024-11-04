"<SID> 主要用于函数调用时引用局部函数，而 s: 则用于定义局部函数和变量。
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<C-u>call <SID>GrepOperator(visualmode())<CR>

"s: which places it in the current script’s namespace.
function! s:GrepOperator(type)
  "By yanking the text into the unnamed register we destroy anything that was previously in there.
  "let’s save the contents of that register before we yank and restore it after we’ve done.
  let saved_unnamed_register = @@

  "==# case-sensitive comparison
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  "echom shellescape(@@)
  silent execute "grep! -R " . shellescape(@@) . " ."
  copen

  let @@ = saved_unnamed_register
endfunction
