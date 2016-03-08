" Hugo Ribeira

" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required for vundle

set rtp+=~/.nvim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim' " required for vundle to work
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'jiangmiao/auto-pairs'       " match brackets
  Plugin 'mattn/webapi-vim'           " needed for mattn/gist-vim
  Plugin 'mattn/gist-vim'             " create gists from vim
  Plugin 'rking/ag.vim'               " use Ag from vim
  Plugin 'vim-scripts/Rename'         " Rename files from vim
  Plugin 'tpope/vim-surround'         " Surround movements
  Plugin 'tpope/vim-repeat'           " Surround movements
  Plugin 'tpope/vim-rails'            " Rails commands like migrations and partial extract
  Plugin 'thoughtbot/vim-rspec'       " Rspec commands inside vim
  Plugin 'jgdavey/tslime.vim'         " Send commands to tmux
  Plugin 'scrooloose/syntastic'       " Send commands to tmux
  Plugin 'ervandew/supertab'          " Tab for auto-completion
  Plugin 'rstacruz/sparkup.git'       " HTML fancy css like completion
  Plugin 'tpope/vim-fugitive'         " Git binds for vim
  Plugin 'elixir-lang/vim-elixir'     " Elixir syntax highlighting and indentation
  Plugin 'leafgarland/typescript-vim' " Typescript syntax highlighting and indentation
  Plugin 'henrik/vim-qargs'           " Support for :Qdo
  Plugin 'pangloss/vim-javascript'    " Javascript support
  Plugin 'othree/yajs.vim'            " Javascript syntax
  Plugin 'mxw/vim-jsx'                " React support
  Plugin 'nathanaelkane/vim-indent-guides'

  " Colors
  Plugin 'altercation/Vim-colors-solarized'
  Plugin 'rickharris/vim-railscasts'
call vundle#end()            " required

filetype plugin indent on    " required for vundle
" "}}}
" Colors {{{
syntax enable
call togglebg#map("<leader>bg")
set background=dark
colorscheme railscasts
" }}}
" Misc {{{
set lazyredraw    " Don't redraw if there's no need to
set backspace=indent,eol,start
set modelines=1   " Use comment config line
set autowrite     " Automatically :write before running commands
set history=50    " remember last 50 commands entered
set pastetoggle=<F2>  " Set paste mode using F2 for copying stuff

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
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
" Move between panes using ctrl-hjkl
inoremap jk <esc>

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
" }}}
" Syntastic {{{

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs =1
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 0

let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers = ['jshint']


let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" }}}
" Testing {{{
let g:rspec_command = 'call Send_to_Tmux("tmux set -g status-left-fg white && tmux set -g status-left \"  Running {spec}\" && bundle exec rspec {spec} --fail-fast && (tmux set -g status-left \"  Tests passed\" && tmux set -g status-left-fg green) || (tmux set -g status-left \"  Tests failed\" && tmux set -g status-left-fg red) \n")'
au FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>s :call RunNearestSpec()<CR>
au FileType ruby map <Leader>l :call RunLastSpec()<CR>
au FileType ruby map <Leader>a :call RunAllSpecs()<CR>

au FileType elixir map <leader>t :ExTestRunFile<CR>
au FileType elixir map <leader>s :ExTestRunMethod<CR>
au FileType elixir map <leader>l :ExTestRunLast<CR>

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
" }}}
" Leader Shortcuts {{{
let mapleader="," " leader is comma

map <Leader>n :NERDTreeToggle<CR>

"ctags
map <Leader>ct :!ctags -R --exclude='vendor/**/*' .<CR>
map <Leader><Tab> :TlistOpen<CR>
map <Leader>gd tjump<CR>
map <Leader>gd "zyiw:exe "tj ".@z.""<CR>

" Hide search matches
map <Leader> :noh<CR>

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
augroup END
"}}}
