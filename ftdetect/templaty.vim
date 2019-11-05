
let s:known_file_extensions = {
  \ 'cc': 'cpp',
  \ 'cpp': 'cpp',
  \ 'c': 'c',
  \ 'py': 'python'
  \ }

function s:detect_filetype(path)
  let parts = split(expand('%:r'), '\.')
  if len(parts) == 1
    return v:null
  else
    if has_key(s:known_file_extensions, parts[1])
      return s:known_file_extensions[parts[1]]
    else
      return v:null
    endif
  endif
endfunction

function s:set_file_type()
  let nested_ft = s:detect_filetype(expand('%'))
  if nested_ft == v:null
    setfiletype templaty
  else
    execute "setfiletype" (nested_ft . ".templaty")
  endif
endfunction

autocmd BufNewFile,BufRead *.tply call s:set_file_type()

