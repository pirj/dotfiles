" Auto JSHint on write
autocmd BufWritePost *.js silent! :JSHint<CR>

" Re-set format options as plugins may set it on thier own
autocmd FileType * setlocal formatoptions=tj

" Go to last position of opened files. Taken from :help last-position-jump.
autocmd BufReadPost * execute "normal! g`\""

" But not for Git commits, go to beginning of the file.
autocmd BufReadPost COMMIT_EDITMSG normal! gg

" Open QuickFix/Location lists on search
autocmd QuickFixCmdPost l* lwindow
autocmd QuickFixCmdPost [^l]* cwindow

" Automatically fold comments on Ruby file open
" autocmd FileType ruby set foldmethod=expr | set foldexpr=getline(v:lnum)=~'^\\s*#'

" Redraw after grep
autocmd ShellCmdPost * redraw!

" Reduce path to only find files in non-ignored directories
let g:project_find_path = '.,' . system("git ls-tree -d HEAD --name-only | tr '\n' : | sed 's/:/**,/g'")
autocmd VimEnter let &path = g:project_find_path
autocmd BufReadPost * let &path = g:project_find_path

" make vim-projectionist and vim-rails compatible (see tpope/vim-projectionist#36)
autocmd BufNewFile,BufRead,BufWrite * call s:copy_projections()
function! s:copy_projections() abort
  if !exists('b:projectionist') || !exists('b:rails_root')
    return
  endif

  let g:rails_projections = {}
  let app_projections = deepcopy(b:projectionist[b:rails_root])
  for projection_group in app_projections
    for projection in keys(projection_group)
      if has_key(projection_group[projection], 'type')
        let projection_group[projection]['command'] = projection_group[projection]['type']
        call remove(projection_group[projection], 'type')
      endif

      let g:rails_projections[projection] = projection_group[projection]
    endfor
  endfor
endfunction

autocmd BufReadPost * silent! lcd .

autocmd BufNewFile,BufRead *.git/{,modules/**/}{PULLREQ_EDIT,COMMIT_EDIT,MERGE_}MSG set ft=gitcommit

" autocmd FileType markdown call pencil#init()
" autocmd FileType text call pencil#init()

autocmd BufRead,BufNewFile PULLREQ_EDITMSG setlocal filetype=markdown

function! s:goyo_enter()
  setlocal noshowcmd
  setlocal wrap
  setlocal scrolloff=15
  colorscheme seoul256-light
endfunction

function! s:goyo_leave()
  setlocal showcmd
  setlocal nowrap
  setlocal scrolloff=5
  colorscheme jellybeans
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
