command! -nargs=0 -bar Qargs execute 'args ' . s:QuickfixFilenames()

" Contributed by "ib."
" http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim#comment8286582_5686810
command! -nargs=1 -complete=command -bang Qdo call s:Qdo(<q-bang>, <q-args>)

function! s:Qdo(bang, command)
  if exists('w:quickfix_title')
    let in_quickfix_window = 1
    cclose
  else
    let in_quickfix_window = 0
  endif

  arglocal
  exe 'args '.s:QuickfixFilenames()
  exe 'argdo'.a:bang.' '.a:command
  argglobal

  if in_quickfix_window
    copen
  endif
endfunction

function! s:QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}

  " if the current window has a local quickfix list (a location list)
  " then use it, otherwise use the global quickfix list
  let quickfix_items = getloclist(0)
  if len(quickfix_items) == 0
    let quickfix_items = getqflist()
  endif

  for quickfix_item in quickfix_items
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor

  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
