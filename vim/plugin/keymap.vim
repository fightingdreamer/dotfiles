" Pure
" ----------------------------------------
" | Tabs support with Alt {{{
" ----------------------------------------
nnoremap <M-n> :tabnew<cr>
nnoremap <M-c> :tabclose<cr>

nnoremap <M-j> :tabprevious<cr>
nnoremap <M-k> :tabnext<cr>

nnoremap <M-J> :-tabmove<cr>
nnoremap <M-K> :+tabmove<cr>

nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
nnoremap <M-0> 0gt
" }}}
" ----------------------------------------
" | Yank to end of line with Y {{{
" ----------------------------------------
nnoremap Y y$
" }}}
" ----------------------------------------
" | Window resize using arrows {{{
" ----------------------------------------
nnoremap <M-left>  :vertical resize -5<cr>
nnoremap <M-down>  :         resize +5<cr>
nnoremap <M-up>    :         resize -5<cr>
nnoremap <M-right> :vertical resize +5<cr>
" }}}
" ----------------------------------------
" | Change font size with F10 Shift-F10 {{{
" ----------------------------------------
if has("unix")
  function! GetFontSize ()
    return str2float(matchstr(&guifont, '\d\+\.\=\d*$'))
  endfunction

  function! SetFontSize (size)
    let &guifont = substitute(&guifont, '\d\+\.\=\d*$', string(a:size), '')
  endfunction

  function! IncreaseFontSize ()
    call SetFontSize(GetFontSize() + 1)
  endfunction

  function! DecreaseFontSize ()
    call SetFontSize(GetFontSize() - 1)
  endfunction
endif

nnoremap <F9>  :call DecreaseFontSize()<cr>
nnoremap <F10> :call IncreaseFontSize()<cr>
" }}}
" ----------------------------------------
" | cd to current file directory with ~ {{{
" ----------------------------------------
nnoremap <silent> ~ :cd %:p:h<cr>
" }}}
" ----------------------------------------
" | Clipboard shortcuts with <leader> {{{
" ----------------------------------------
vmap <leader>y "+y
vmap <leader>d "+d

vmap <leader>p "+p
vmap <leader>P "+P

nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>P "+P
" }}}
" ----------------------------------------
" | Syntax details with F11 {{{
" ----------------------------------------
map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
" ----------------------------------------
" | Treat wrapped lines as new lines with jk {{{
" ----------------------------------------
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" }}}
" ----------------------------------------
" | Sticky indentation with < and > {{{
" ----------------------------------------
vnoremap < <gv
vnoremap > >gv
" }}}
" ----------------------------------------


" Plugins
" ----------------------------------------
" | Unite collection {{{
" ----------------------------------------

nnoremap <leader>i       :<C-u>Unite -buffer-name=files_rec -start-insert
      \ file_rec/async:!<cr>
nnoremap <leader>I  :<C-u>UniteWithInputDirectory -buffer-name=files -start-insert
      \ file_rec/async:!<cr>

if isdirectory(expand('~/Projects'))
nnoremap <leader>cd      :<C-u>Unite -buffer-name=cd -start-insert -default-action=cd
      \ directory_rec/async:~/Projects<cr>
endif

if isdirectory(expand('~/Projekty'))
nnoremap <leader>cd      :<C-u>Unite -buffer-name=cd -start-insert -default-action=cd
      \ directory_rec/async:~/Projekty<cr>
endif

nnoremap <leader>CD :<C-u>UniteWithBufferDir -buffer-name=cd -start-insert -default-action=cd
      \ directory_rec/async<cr>

nnoremap <leader>o       :<C-u>Unite -buffer-name=files -start-insert
      \ file file/new directory/new<cr>
nnoremap <leader>O  :<C-u>UniteWithInputDirectory -buffer-name=files -start-insert
      \ file file/new directory/new<cr>

nnoremap <leader>r       :<C-u>Unite -buffer-name=mru -start-insert
      \ neomru/file<cr>

nnoremap <leader>q       :<C-u>Unite -buffer-name=outline -start-insert
      \ outline<cr>

nnoremap <leader>u       :<C-u>Unite -buffer-name=yank
      \ history/yank<cr>

nnoremap <leader>s       :<C-u>Unite -buffer-name=buffer -start-insert
      \ buffer<cr>

nnoremap <leader>/       :<C-u>Unite -buffer-name=grep -start-insert
      \ grep:%<cr>
nnoremap <leader>?       :<C-u>UniteWithInputDirectory -buffer-name=grep -start-insert
      \ grep:<cr>

nnoremap <leader>h       :<C-u>Unite -buffer-name=help -start-insert
      \ help<cr><cr>

nnoremap <leader>gh      :<C-u>UniteWithCursorWord -buffer-name=help
      \ help<cr>

nnoremap <leader>cs      :<C-u>Unite -buffer-name=color -start-insert
      \ colorscheme<cr>

nnoremap <leader>z :<C-u>Unite -buffer-name=session -start-insert
      \ session session/new<cr>

" nnoremap <leader>q   :<C-u>Unite -buffer-name=tag   tag<cr>
" nnoremap <leader>j   :<C-u>Unite -buffer-name=jump  jump<cr>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()

  " Disable cursor looping
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! nunmap <buffer> k
  silent! nunmap <buffer> j

  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  " nmap <buffer> <ESC> <Plug>(unite_exit)

endfunction

" }}}
" ----------------------------------------
" | vim-easyMotion {{{
" ----------------------------------------
map <leader>      <Plug>(easymotion-prefix)
map <localleader> <Plug>(easymotion-overwin-f)
"}}}
" ----------------------------------------
" | incsearch.vim {{{
" ----------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}
" ----------------------------------------
" | vim-asterisk {{{
" ----------------------------------------
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" map *  <Plug>(asterisk-z*)
" map #  <Plug>(asterisk-z#)
" map g* <Plug>(asterisk-gz*)
" map g# <Plug>(asterisk-gz#)
" }}}
" ----------------------------------------
" | DeleteTrailingWhitespace {{{
" ----------------------------------------
nnoremap <leader>d :DeleteTrailingWhitespace<cr>
vnoremap <leader>d :DeleteTrailingWhitespace<cr>
" }}}
" ----------------------------------------
" | EasyAlign {{{
" ----------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode
vmap <cr> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <leader>a <Plug>(EasyAlign)

" }}}
" ----------------------------------------
" | neosnippet {{{
" ----------------------------------------
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" "   \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" " For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
" }}}
" ----------------------------------------
" | {{{ UltiSnips
" ----------------------------------------
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" }}}
" ----------------------------------------
" | undotree {{{
" ----------------------------------------
nnoremap <leader>l :<C-u>UndotreeToggle<cr>
"}}}
" ----------------------------------------
" | vim-fullscreen {{{
" ----------------------------------------
if has("gui_running")
  nmap <F12> <Plug>(fullscreen-toggle)
endif
" }}}
" ----------------------------------------

" vim:foldmethod=marker:foldminlines=1:foldlevel=0:tabstop=2:shiftwidth=2
