" MIT License. Copyright (c) 2013-2015 Bailey Ling.
" vim: et ts=2 sts=2 sw=2

"if !get(g:, 'loaded_signify', 0) && !get(g:, 'loaded_gitgutter', 0) && !get(g:, 'loaded_changes', 0) && !get(g:, 'loaded_quickfixsigns', 0)
"  finish
"endif

let s:non_zero_only = get(g:, 'airline#extensions#hunks#non_zero_only', 0)
let s:hunk_symbols = get(g:, 'airline#extensions#hunks#hunk_symbols', ['+', '~', '-'])

function! s:get_hunks_signify()
  let hunks = sy#repo#get_stats()
  if hunks[0] >= 0
    return hunks
  endif
  return []
endfunction

function! s:is_branch_empty()
  return exists('*airline#extensions#branch#head') && empty(airline#extensions#branch#head())
endfunction

function! s:get_hunks_gitgutter()
  if !get(g:, 'gitgutter_enabled', 0) || s:is_branch_empty()
    return ''
  endif
  return GitGutterGetHunkSummary()
endfunction

function! s:get_hunks_changes()
  if !get(b:, 'changes_view_enabled', 0) || s:is_branch_empty()
    return []
  endif
  let hunks = changes#GetStats()
  for i in hunks
    if i > 0
      return hunks
    endif
  endfor
  return []
endfunction

function! s:get_hunks_empty()
  return ''
endfunction

let s:source_func = ''
function! s:get_hunks()
  let s:source_func = 'gitgutter#hunk#summary'
  return {s:source_func}()
endfunction

function! airline#extensions#hunks#get_hunks()
  let hunkeee=gitgutter#hunk#summary()
  let stringed =''
  if hunkeee[0] > 0 || hunkeee[1] > 0 || hunkeee[2] > 0
    let stringed .= printf(" +%d ~%d -%d ",hunkeee[0],hunkeee[1],hunkeee[2])
  endif
  return stringed
endfunction

function! airline#extensions#hunks#init(ext)
  call airline#parts#define_function('hunks', 'airline#extensions#hunks#get_hunks')
endfunction

