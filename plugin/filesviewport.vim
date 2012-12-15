command! FilesViewportSet call <SID>FilesViewportSet()
command! -nargs=1 -complete=file FilesViewportEdit call <SID>FilesViewportEdit(<q-args>)
command! -nargs=1 -complete=file FilesViewportSplit call <SID>FilesViewportSplit(<q-args>)
command! FilesViewportOnly call <SID>FilesViewportOnly()
command! FilesViewportDelete call <SID>FilesViewportDelete()
command! FilesViewportClose call <SID>FilesViewportClose()

nnoremap <F5> :w<CR>:so %<CR>

let s:opened_file_buffers = []

function! s:FilesViewportSet()
  let s:opened_file_buffers = [bufnr('%')]
endfunction

function! s:FilesViewportEdit(arg)
  exe s:initial_window . "wincmd w"
  echo a:arg
endfunction

function! s:FilesViewportSplit(arg)
  let l:top_window = 9999
  exe s:initial_window . "wincmd w"
endfunction

function! s:FilesViewportOnly(arg)
  let l:current_buffer = winbufnr(0)
  for l:b in s:opened_file_buffers
    exe ":bd" l:b
  endfor
endfunction
