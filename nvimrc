" Hugo Ribeira

" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'                                   " required for vundle to work
  Plugin 'junegunn/fzf'                                           " like ctrlp but faster
  Plugin 'scrooloose/nerdtree'
  Plugin 'jiangmiao/auto-pairs'                                   " match brackets
  Plugin 'mattn/webapi-vim'                                       " needed for mattn/gist-vim
  Plugin 'mattn/gist-vim'                                         " create gists from vim
  Plugin 'rking/ag.vim'                                           " use Ag from vim
  Plugin 'danro/rename.vim'                                       " Rename files from vim
  Plugin 'tpope/vim-surround'                                     " Surround movements
  Plugin 'tpope/vim-repeat'                                       " Surround movements
  Plugin 'tpope/vim-rails'                                        " Rails commands like migrations and partial extract
  Plugin 'jgdavey/tslime.vim'                                     " Send commands to tmux
  Plugin 'janko-m/vim-test'                                       " Test Runner
  Plugin 'benekastah/neomake'                                     " Run linters async
  Plugin 'ervandew/supertab'                                      " Tab for auto-completion
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Proper auto complete (requires python3 pip3 `gem install neovim` && `pip3 install neovim`)
  Plugin 'rstacruz/sparkup.git'                                   " HTML fancy css like completion
  Plugin 'tpope/vim-fugitive'                                     " Git binds for vim
  Plugin 'tpope/vim-rhubarb'                                      " Hub binds for vim
  Plugin 'elixir-lang/vim-elixir'                                 " Elixir syntax highlighting and indentation
  Plugin 'slashmili/alchemist.vim'                                " Elixir autocomplete
  Plugin 'mhinz/vim-mix-format'                                   " Run `mix format` automatically
  Plugin 'leafgarland/typescript-vim'                             " Typescript syntax highlighting and indentation
  Plugin 'pangloss/vim-javascript'                                " Javascript support
  Plugin 'othree/yajs.vim'                                        " Javascript syntax
  Plugin 'mxw/vim-jsx'                                            " React support
  Plugin 'MarcWeber/vim-addon-mw-utils'                           " Dependencies for snipmate
  Plugin 'tomtom/tlib_vim'                                        " Dependencies for snipmate
  Plugin 'garbas/vim-snipmate'                                    " Snippets engine
  Plugin 'honza/vim-snippets'                                     " Snippets
  Plugin 'sheerun/vim-polyglot'                                   " Support for all sorts of languages
  Plugin 'machakann/vim-highlightedyank'                          " Highlight yanked text
  Plugin 'joukevandermaas/vim-ember-hbs'                          " HBS support
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'hashivim/vim-terraform'
  Plugin 'isRuslan/vim-es6'
  Plugin 'editorconfig/editorconfig-vim'                          " Support for editorconfig


  " Colors
  Plugin 'altercation/Vim-colors-solarized'
  Plugin 'jpo/vim-railscasts-theme'
call vundle#end()            " required

filetype plugin indent on    " required for vundle
" "}}}
" Github {{{
let g:gist_post_private = 1
" }}}

" Colors {{{
syntax enable
set background=dark
colorscheme railscasts
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" }}}
" Misc {{{
set backspace=indent,eol,start
set modelines=1   " Use comment config line
set autowrite     " Automatically :write before running commands
set history=50    " remember last 50 commands entered
set pastetoggle=<F2>  " Set paste mode using F2 for copying stuff

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js' --exclude='vendor/**/*'"

" }}}
" Spaces & Tabs {{{
set tabstop=2 shiftwidth=2 shiftround expandtab " 2 spaces, tabs are spaces
set backspace=2       " Backspace deletes like most programs in insert mode
set autoindent
set copyindent        " copy the previous indentation on autoindenting
set smarttab          " insert tabs on the start of a line
set listchars=tab:>.,trail:.,extends:#,nbsp:. " show white space
set list
" }}}
" UI Layout {{{
set number                          " show line numbers
set nocursorline                    " highlight current line
set ruler                           " show the cursor position all the time
set textwidth=80                    " Make it obvious where 80 characters is
set showmatch                       " higlight matching parenthesis

set wildmode=list:longest,list:full " Show autocomplete menu

set splitbelow                      " New panes open in the bottom
set splitright                      " New panes open to the right
" }}}
" Status Line {{{
set laststatus=2      " Always display the status line
set statusline=%F     " show filename in the statusline
set showcmd           " show command in bottom bar
" }}}
" Searching {{{
set smartcase     " ignore case if search pattern is all lowercase,
set ignorecase    " ignore case when searching
set incsearch     " search as characters are entered
set hlsearch      " highlight all matches
set inccommand=nosplit " live search and replace

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" }}}
" CTRLP {{{
noremap <C-P> :FZF<CR>
" }}}
" Folding {{{
"=== folding ===
set foldmethod=marker   " fold based on indent level
set foldlevelstart=0    " start with fold level of 1
nnoremap <space> za
" }}}
" Line Shortcuts {{{
" Use visual line movements
nnoremap j gj
nnoremap k gk
" }}}
" Movement {{{

" Use jk to quit insert mode
inoremap jk <esc>

" Same as above but when using Nvim's terminal
tnoremap jk <C-\><C-n>

" Move between panes using ctrl-hjkl

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Hit Ctrl-R during visual mode for search and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" }}}
" Backups {{{
" no backup files
set nobackup
set nowritebackup
set noswapfile
" "}}}
" Ctags {{{
let Tlist_Show_One_File=1
let g:gutentags_cache_dir = '~/.tags_cache'
let g:gutentags_ctags_exclude = 'node_modules'

" Expose `Tags` command to open ctags in FZF
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
" }}}
" Completion {{{

let g:SuperTabDefaultCompletionType = "context"
let g:jsx_ext_required = 0
let g:deoplete#enable_at_startup = 1

" }}}
" Syntax Checker {{{

let g:neomake_list_height = 3
let g:neomake_open_list = 0
let g:neomake_serialize = 0
let g:neomake_serialize_abort_on_error = 1
let g:neomake_verbose = 0
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let g:neomake_ruby_enabled_checkers = ['rubocop', 'mri']

let g:neomake_error_sign = {
      \ 'text': 'x'
      \ }

let g:neomake_warning_sign = {
      \ 'text': 'x'
      \ }

let g:neomake_message_sign = {
      \ 'text': 'x'
      \ }

let g:neomake_info_sign = {
      \ 'text': 'x'
      \ }

let g:mix_format_on_save = 1

" '❌' '⁉️' '⚠️' '💩

" }}}
" Testing {{{

function! TmuxWithStatusStrategy(cmd)
  let running_cmd = 'tmux set -g status-left-fg white && tmux set -g status-left "  Running ' . a:cmd . '"'
  let success_cmd = 'tmux set -g status-left "  Tests passed" && tmux set -g status-left-fg green'
  let failure_cmd = 'tmux set -g status-left "  Tests failed" && tmux set -g status-left-fg red'

  call Send_to_Tmux('clear; ' . l:running_cmd . " && ( SKIP_FG='true' " . a:cmd . " && " . l:success_cmd .") || (" . l:failure_cmd .")\n")
endfunction

let g:test#custom_strategies = {'TmuxWithStatusStrategy': function('TmuxWithStatusStrategy')}
let g:test#strategy = 'TmuxWithStatusStrategy'

let test#elixir#exunit#file_pattern = 'test\.exs'
let test#elixir#exunit#executable = 'mix test'

let test#elixir#espec#file_pattern = 'test\.exs'
let test#elixir#espec#executable = 'mix test'

let test#javascript#mocha#file_pattern = '\.test\.js' " *.test.js are mocha test files
let test#javascript#mocha#executable = 'mocha --opts .mocha.opts'

let test#javascript#jest#file_pattern = '.*\.test\.js' " *.test.js are mocha test files
let test#javascript#jest#executable = 'jest'

let test#filename_modifier = ':p' " Use absolute path for ExUnit tests

" }}}
" Leader Shortcuts {{{
let mapleader="," " leader is comma

map <Leader>n :NERDTreeToggle<CR>

map <Leader>c g:deoplete#mappings#close_popup()<CR>

"ctags
map <Leader>ct :!ctags -R --exclude='vendor/**/*' --exclude='node_modules/**/*' .<CR>
map <Leader><Tab> :TlistOpen<CR>
map <Leader>gd tjump<CR>
map <Leader>gd "zyiw:exe "tj ".@z.""<CR>

map <leader>s :TestNearest<CR>
map <leader>t :TestFile<CR>
map <leader>l :TestLast<CR>
map <leader>a :TestSuite<CR>
map <leader>gt :TestVisit<CR>


" Hide search matches
map <Leader> :noh<CR>
map <leader>vr :set cursorcolumn!<Bar>set cursorline!<CR>

nnoremap <leader>v :source $MYVIMRC<CR>
" }}}
" AutoGroups {{{
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.js* set filetype=javascript
  autocmd FileType markdown setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd FileType go setlocal nolist
  autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim " Enable sparkup for jsx files

  autocmd! BufWritePost * Neomake
  autocmd! BufReadPost * Neomake
augroup END
"}}}
