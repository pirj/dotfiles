setlocal spell

setlocal wrap
setlocal textwidth=0
setlocal wrapmargin=-1000

setlocal formatoptions=l

setlocal foldnestmax=2
setlocal foldlevel=3

function MarkdownLevel()
  let h = matchstr(getline(v:lnum), '^##\+')
  if empty(h)
    return "="
  else
    return ">" . len(h)
  endif
endfunction

setlocal foldexpr=MarkdownLevel()
setlocal foldmethod=expr
