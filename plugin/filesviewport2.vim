nnoremap <F5> :w<CR>:so %<CR>

augroup filesviewport
  autocmd!
  autocmd BufAdd * call <SID>BufAdd(expand("<afile>"))
  autocmd BufDelete * call <SID>BufDelete(expand("<afile>"))
  autocmd BufNew * call <SID>BufNew(expand("<afile>"))
  autocmd BufEnter * call <SID>BufEnter(expand("<afile>"))
  autocmd BufWinEnter * call <SID>BufWinEnter(expand("<afile>"))
augroup end

function! s:BufAdd(afile)
  "exe "!echo -n BufAdd"
endfunction

function! s:BufDelete(afile)
endfunction

function! s:BufNew(afile)
  "exe "!echo -n BufNew"
endfunction

function! s:BufEnter(afile)
  "exe "!echo -n BufEnter"
endfunction

function! s:BufWinEnter(afile)
  "exe "!echo -n BufWinEnter"
  if &l:previewwindow
    call MoveWindowToTop()
  elseif &l:buftype ==# "quickfix"
    call MoveWindowToBottom()
  endif
endfunction

function! MoveWindowToTop()
  while 1
    let l:curwindow = winnr()
    exe "wincmd k"
    if winnr() == l:curwindow
      break
    else
      exe "wincmd x"
    endif
  endwhile
endfunction

function! MoveWindowToBottom()
  while 1
    let l:curwindow = winnr()
    exe "wincmd j"
    if winnr() == l:curwindow
      break
    else
      exe "wincmd k"
      exe "wincmd x"
      exe "wincmd j"
    endif
  endwhile
endfunction

function! s:print_error(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl None
endfunction

call s:print_error("foo")
