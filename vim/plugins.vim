
call plug#begin('~/.vim/plugged')

" Plugins
" ----------------------------------------
" | Color schemes {{{
" ----------------------------------------

Plug 'fightingdreamer/tomorrow-theme', {'rtp': 'vim'}
Plug 'fightingdreamer/cleanroom-vim-color'
"Plug 'altercation/vim-colors-solarized'
"Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'
"Plug 'w0ng/vim-hybrid'
"Plug 'abra/vim-abra'
"Plug 'junegunn/seoul256.vim'
"Plug 'vyshane/vydark-vim-color'
"Plug 'vyshane/vyterm-vim-color'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'

" }}}
" ----------------------------------------
" | Unite collection {{{
" ----------------------------------------

" Interactive command execution in Vim.
Plug 'Shougo/vimproc.vim', {'do': 'make'}

" The unite.vim plug-in can search and display information from arbitrary sources
Plug 'Shougo/unite.vim'

" MRU plugin
Plug 'Shougo/neomru.vim'

" Session source
Plug 'Shougo/unite-session'

" Saves yank history
Plug 'Shougo/neoyank.vim'

" Outline source
Plug 'Shougo/unite-outline'

" Tags source for unite.vim
Plug 'tsukkee/unite-tag'

" help source
Plug 'Shougo/unite-help'

" Color scheme source
Plug 'ujihisa/unite-colorscheme'

" FZF's extended-search mode for unite
Plug 'cskeeters/unite-fzf'

" }}}
" ----------------------------------------
" | Navigation {{{
" ----------------------------------------

" Vim motions on speed!
Plug 'Lokaltog/vim-easymotion'

" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'

" asterisk.vim provides improved * motions
Plug 'haya14busa/vim-asterisk'

" }}}
" ----------------------------------------
" | Editing {{{
" ----------------------------------------

" Delete unwanted whitespace at the end of lines
Plug 'vim-scripts/DeleteTrailingWhitespace'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" unimpaired.vim: pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" An extensible & universal comment vim-plugin
Plug 'tomtom/tcomment_vim'

" use CTRL+A/X to create increasing sequence of numbers or letters via visual mode
Plug 'triglav/vim-visual-increment'

" }}}
" ----------------------------------------
" | Fast coding {{{
" ----------------------------------------

" vim plugins for HTML and CSS hi-speed coding
Plug 'mattn/emmet-vim'

" neo-snippet plugin contains neocomplcache snippets source
"Plug 'Shougo/neosnippet.vim'

" The standard snippets repository for neosnippet
"Plug 'Shougo/neosnippet-snippets'

" The ultimate snippet solution for Vim
" <broken for macvim>
" Plug 'SirVer/ultisnips'

" Snippets are separated from the engine
Plug 'honza/vim-snippets'

" }}}
" ----------------------------------------
" | Folding {{{
" ----------------------------------------

" Speed up Vim by updating folds only when called-for
Plug 'Konfekt/FastFold'

" }}}
" ----------------------------------------
" | History {{{
" ----------------------------------------

" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree'

" }}}
" ----------------------------------------
" | Gui {{{
" ----------------------------------------

" Toggle a fullscreen mode on GVim or MacVim
Plug 'lambdalisue/vim-fullscreen'

" Toggle the cursor shape in the terminal for Vim
Plug 'jszakmeister/vim-togglecursor'

" }}}
" ----------------------------------------
" | Syntax checking {{{
" ----------------------------------------

" Syntax checking hacks for vim
"Plug 'scrooloose/syntastic'

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'w0rp/ale'

" }}}
" ----------------------------------------
" | Language specific {{{
" ----------------------------------------

" perl omnicompletion for vim
Plug 'c9s/perlomni.vim'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plug 'klen/python-mode', { 'for': 'python', 'branch': 'develop' }

" Improved nginx vim plugin (incl. syntax highlighting)
Plug 'chr4/nginx.vim'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Decode Quoted-Printable text
Plug 'akarzim/vim-decode-qp', { 'for': 'asc' }

" }}}
" ----------------------------------------
" | Autocompletion {{{
" ----------------------------------------

" Next generation completion framework after neocomplcache
Plug 'Shougo/neocomplete.vim'

" Include completion framework for neocomplete/deoplete
"Plug 'Shougo/neoinclude.vim'

" }}}
" ----------------------------------------
" | Git {{{
" ----------------------------------------

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'

" }}}
" ----------------------------------------
" | Async jobs {{{
" ----------------------------------------

" asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" }}}
" ----------------------------------------
" | Fuzzy matcher {{{
" ----------------------------------------

" A command-line fuzzy finder written in Go
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" }}}
" ----------------------------------------
" | Tasks {{{
" ----------------------------------------

" use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" Text outlining and task management for Vim
Plug 'jceb/vim-orgmode'

" }}}
" ----------------------------------------
" | Maybe someday {{{
" ----------------------------------------

" Powerful shell implemented by vim.
"Plug 'Shougo/vimshell.vim'

" Auto insert pairs when complete done
"Plug 'Shougo/neopairs.vim'

" }}}
" ----------------------------------------
" | Remote editing {{{
" ----------------------------------------

" MacVim (or GVim) plugin for remote editing
Plug 'wannesm/rmvim.vim'

" }}}
" ----------------------------------------
" | Tracking {{{
" ----------------------------------------

" Open-source plugin automatic time tracking.
Plug 'wakatime/vim-wakatime'

" }}}
" ----------------------------------------

call plug#end()

" vim:foldmethod=marker:foldminlines=1:foldlevel=0:tabstop=2:shiftwidth=2
