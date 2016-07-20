" Plugins
" ----------------------------------------
" | Unite {{{
" ----------------------------------------
let g:unite_converter_file_directory_width = 80
let g:unite_source_history_yank_enable = 1
let g:unite_source_session_enable_auto_save = 1

call unite#custom#profile('default', 'context', {
      \ 'prompt-visible': 1,
      \ 'prompt': '> ',
      \ 'split': 0,
      \ 'resize': 0
      \ })

call unite#custom#source('buffer', 'sorters', ['sorter_word'])
call unite#custom#source('neomru/file,file_rec/async,buffer,grep', 'matchers', ['matcher_regexp'])
call unite#custom#alias('file', 'delete', 'vimfiler__delete')

" }}}
" ----------------------------------------
" | incsearch.vim {{{
" ----------------------------------------
let g:incsearch#auto_nohlsearch = 0
" }}}
" ----------------------------------------
" | vim-asterisk {{{
" ----------------------------------------
" let g:asterisk#keeppos = 0
" }}}
" ----------------------------------------
" | vim-multiple-cursors {{{
" ----------------------------------------

let g:multi_cursor_exit_from_insert_mode = 0

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock') == 2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock') == 2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" }}}
" ----------------------------------------
" | EasyAlign {{{
" ----------------------------------------
let g:easy_align_delimiters = {
      \ 'a' : { 'pattern': '->' },
      \ }
" }}}
" ----------------------------------------
" | undotree {{{
" ----------------------------------------
let g:undotree_SetFocusWhenToggle = 1
" }}}
" ----------------------------------------
" | vim-togglecursor {{{
" ----------------------------------------
let g:togglecursor_default = "block"
let g:togglecursor_insert = "line"
" }}}
" ----------------------------------------
" | syntastic {{{
" ----------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes": ["js"],
      \ "passive_filetypes": ["json"] }

" let g:syntastic_filetype_map = {'json': 'unknown'}

" javascript
let g:syntastic_javascript_checkers = ['eslint']

" perl
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_perl_perl_args = ['-I', expand('~/perl5/lib/perl5'), '-I', 'lib']
" let g:syntastic_perl_checkers = ['perl', 'perlcritic']
" let g:syntastic_perl_perlcritic_args = '-severity 3'
" let g:syntastic_perl_perlcritic_thres = 2
" let g:syntastic_perl_perlcritic_post_args = '--verbose "\%s:\%f:\%l:\%c: \%p: \%m\n"'

" python
let g:syntastic_ignore_files = ['\.py$']
" let g:syntastic_python_python_exec = '/usr/bin/python3'

"}}}
" ----------------------------------------
" | neocomplete {{{
" ----------------------------------------

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#max_list = 20
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#auto_completion_start_length = 1

" Select completion with Tab
inoremap <expr><tab>    pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><s-tab>  pumvisible() ? "\<C-p>" : "\<tab>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif

""let g:neocomplete#sources#omni#input_patterns.php =
""\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
""let g:neocomplete#sources#omni#input_patterns.c =
""\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
""let g:neocomplete#sources#omni#input_patterns.cpp =
""\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"
let g:neocomplete#sources#omni#input_patterns.perl =
      \ '\%(\h\w*::\|[$@%]\)\%(\h\w*\)\?'

" }}}
" ----------------------------------------
" | python-mode {{{
" ----------------------------------------
let g:pymode_options_max_line_length = 99
let g:pymode_options_colorcolumn = 0
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_signs = 1
let g:pymode_rope_complete_on_dot = 0
" }}}
" ----------------------------------------

" vim:foldmethod=marker:foldminlines=1:foldlevel=0:tabstop=2:shiftwidth=2
