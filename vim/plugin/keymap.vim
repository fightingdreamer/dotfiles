" Pure
" ----------------------------------------
" | Tabs support with Alt {{{
" ----------------------------------------
nnoremap <M-n> :tabnew<cr>
nnoremap <M-c> :tabclose<cr>

nnoremap <M-h> :tabprevious<cr>
nnoremap <M-l> :tabnext<cr>

nnoremap <M-H> :-tabmove<cr>
nnoremap <M-L> :+tabmove<cr>

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
nnoremap <M-down>  :         resize +3<cr>
nnoremap <M-up>    :         resize -3<cr>
nnoremap <M-right> :vertical resize +5<cr>

nnoremap ķ :vertical resize -5<cr>
nnoremap ∆ :         resize +3<cr>
nnoremap Ż :         resize -3<cr>
nnoremap ł :vertical resize +5<cr>
" }}}
" ----------------------------------------
" | Change font size with F9 and F10 {{{
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
" | Syntax details with F12 {{{
" ----------------------------------------
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
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

nnoremap <leader>q  :<C-u>Unite -buffer-name=outline outline -start-insert<cr>
nnoremap <leader>r  :<C-u>Unite -buffer-name=mru neomru/file -start-insert<cr>
nnoremap <leader>R  :<C-u>Unite -buffer-name=mru neomru/directory -start-insert -default-action=cd<cr>
nnoremap <leader>s  :<C-u>Unite -buffer-name=buffer buffer -start-insert<cr>
nnoremap <leader>z  :<C-u>Unite -buffer-name=session session session/new<cr>
vnoremap <leader>p  :<C-u>Unite -buffer-name=yank history/yank -start-insert<cr>
nnoremap <leader>cs :<C-u>Unite -buffer-name=color colorscheme -no-quit -keep-focus<cr>
nnoremap <leader>g  :<C-u>Unite -buffer-name=change change line -start-insert<cr>
nnoremap <leader>o  :<C-u>Unite -buffer-name=files file file/new directory/new -start-insert<cr>
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
  nmap <buffer> <ESC> <Plug>(unite_exit)

endfunction

" }}}
" ----------------------------------------
" | vim-fzf {{{
" ----------------------------------------
nnoremap <leader>i :<C-u>FZF<cr>
" }}}
" ----------------------------------------
" | vim-easyMotion {{{
" ----------------------------------------
map  <leader>  <Plug>(easymotion-prefix)
map  -         <Plug>(easymotion-overwin-f)
map  <leader>/ <Plug>(easymotion-sn)

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
let g:UltiSnipsExpandTrigger = "<d-l>"
let g:UltiSnipsListSnippets = "<d-tab>"
let g:UltiSnipsJumpForwardTrigger = "<d-j>"
let g:UltiSnipsJumpBackwardTrigger = "<d-k>"
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
  nmap <F11> <Plug>(fullscreen-toggle)
endif
" }}}
" ----------------------------------------
" | python-mode {{{
" ----------------------------------------
let g:pymode_run = 1
let g:pymode_run_bind = '<localleader>r'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<localleader>b'
" }}}
" ----------------------------------------

" Custom
" ----------------------------------------
" | Perl Fennec {{{
" ----------------------------------------
function! RunFennecLine()
    let cur_line = line(".")
    exe "!FENNEC_TEST='" . cur_line . "' prove --nocolor -v -I ~/perl5/lib/perl5 -I lib %"
endfunction

nnoremap <leader>x :call RunFennecLine()<cr>
" }}}
" ----------------------------------------


" vim:foldmethod=marker:foldminlines=1:foldlevel=0:tabstop=2:shiftwidth=2
