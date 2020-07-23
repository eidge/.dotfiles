" Hugo Ribeira

" Bundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required for vundle

if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.nvim/autoload/plug.vim

call plug#begin('~/.nvim/plugged')
  Plug 'ChartaDev/charta.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf'                                           " like ctrlp but faster
  Plug 'scrooloose/nerdtree'
  Plug 'jiangmiao/auto-pairs'                                   " match brackets
  Plug 'mattn/webapi-vim'                                       " needed for mattn/gist-vim
  Plug 'mattn/gist-vim'                                         " create gists from vim
  Plug 'rking/ag.vim'                                           " use Ag from vim
  Plug 'danro/rename.vim'                                       " Rename files from vim
  Plug 'tpope/vim-surround'                                     " Surround movements
  Plug 'tpope/vim-repeat'                                       " Surround movements repeats
  Plug 'tpope/vim-rails'                                        " Rails commands like migrations and partial extract
  Plug 'jgdavey/tslime.vim'                                     " Send commands to tmux
  Plug 'janko-m/vim-test'                                       " Test Runner
  Plug 'ervandew/supertab'                                      " Tab for auto-completion
  Plug 'rstacruz/sparkup'                                       " HTML fancy css like completion
  Plug 'tpope/vim-fugitive'                                     " Git binds for vim
  Plug 'tpope/vim-rhubarb'                                      " Gbrowse & friends
  Plug 'machakann/vim-highlightedyank'                          " Highlight yanked text
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'editorconfig/editorconfig-vim'                          " Support for editorconfig
  Plug 'sheerun/vim-polyglot'                                   " Highlighting and syntax for most languages
  Plug 'tpope/vim-projectionist'                                " Navigate between alternate files (test -> impl, etc)

  " Colors
  Plug 'altercation/Vim-colors-solarized'
  Plug 'jpo/vim-railscasts-theme'
call plug#end()

filetype plugin indent on    " required for vundle
" "}}}

let mapleader="," " leader is comma

" Github {{{
let g:gist_post_private = 1
" }}}
" Projectionist {{{
let g:projectionist_heuristics = {
      \ 'package.json&.ember-cli.js' : {
      \    'app/initializers/*.js': {
      \      'type': 'initializer'
      \    },
      \    'app/models/*.js': {
      \      'type': 'model',
      \      'alternate': 'app/adapters/{}.js'
      \    },
      \    'app/adapters/*.js': {
      \      'type': 'adapter',
      \      'alternate': 'app/serializers/{}.js'
      \    },
      \    'app/serializers/*.js': {
      \      'type': 'serializer',
      \      'alternate': 'app/models/{}.js'
      \    },
      \    'app/services/*.js': {
      \      'type': 'service'
      \    },
      \    'app/routes/*.js': {
      \      'type': 'route',
      \      'alternate': 'app/controllers/{}.js'
      \    },
      \    'app/controllers/*.js': {
      \      'type': 'controller',
      \      'alternate': 'app/templates/{}.hbs'
      \    },
      \    'app/templates/*.hbs': {
      \      'type': 'template',
      \      'alternate': 'app/routes/{}.js'
      \    },
      \    'app/components/*.js': {
      \      'type': 'component',
      \      'alternate': 'app/templates/components/{}.hbs'
      \    },
      \    'app/components/*/component.js': {
      \      'type': 'component',
      \      'alternate': 'app/components/{}/template.hbs'
      \    },
      \    'app/templates/components/*.hbs': {
      \      'type': 'ctemplate',
      \      'alternate': 'app/components/{}.js'
      \    }
      \  },
      \ 'mix.exs': {
      \   'lib/*.ex': {
      \     'type':      'src',
      \     'alternate': 'test/{}_test.exs'
      \   },
      \   'test/*_test.exs': {
      \     'type':      'test',
      \     'alternate': 'lib/{}.ex'
      \   }
      \ },
      \ 'package.json': {
      \   "*.tsx": {
      \     "alternate": "{dirname}/__tests__/{basename}.test.tsx",
      \     "type": "source"
      \   },
      \   '**/__tests__/*.test.tsx': {
      \     'type': 'test',
      \     'alternate': '{}.tsx'
      \   },
      \   "*.jsx": {
      \     "alternate": "{dirname}/__tests__/{basename}.test.jsx",
      \     "type": "source"
      \   },
      \   '**/__tests__/*.test.jsx': {
      \     'type': 'test',
      \     'alternate': '{}.jsx'
      \   },
      \   "*.js": {
      \     "alternate": "{dirname}/__tests__/{basename}.test.js",
      \     "type": "source"
      \   },
      \   '**/__tests__/*.test.js': {
      \     'type': 'test',
      \     'alternate': '{}.js'
      \   },
      \   "*.ts": {
      \     "alternate": "{dirname}/__tests__/{basename}.test.ts",
      \     "type": "source"
      \   },
      \   '**/__tests__/*.test.ts': {
      \     'type': 'test',
      \     'alternate': '{}.ts'
      \   }
      \ }
      \ }
" }}}
" Charta {{{
let g:charta_api_token=$CHARTA_TOKEN
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

" Use FZF with CTRLP
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Ignore .gitignored files
noremap <C-P> :FZF<CR>
" }}}
" Folding {{{

set foldmethod=marker   " fold based on indent level
set foldlevelstart=0    " start with fold level of 1
nnoremap <space> za     " toggle fold

"}}}
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
" SuperTab {{{

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

" }}}
" CoC {{{
let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-prettier',
\ 'coc-eslint',
\ 'coc-elixir',
\ 'coc-solargraph',
\ 'coc-html',
\ 'coc-css',
\ 'coc-json',
\ 'coc-ember',
\ 'coc-highlight',
\]

nnoremap <silent> K :call CocAction('doHover')<CR>

map gd <Plug>(coc-definition)
map gt <Plug>(coc-type-definition)
map gr <Plug>(coc-references)
map gr <Plug>(coc-references)
noremap <Leader>cl :CocList<CR>
noremap <Leader>cd :CocList diagnostics<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
nmap <Leader>do <Plug>(coc-codeaction)

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

map <Leader>n :NERDTreeToggle<CR>
map <leader>s :TestNearest<CR>
map <leader>t :TestFile<CR>
map <leader>l :TestLast<CR>
map <leader>a :TestSuite<CR>
map <leader>gt :TestVisit<CR>

" }}}
" Random leader shortcuts {{{

" Hide search matches
map <Leader><space> :noh<CR>
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
  autocmd BufRead,BufNewFile *.html.* set filetype=html
  autocmd BufRead,BufNewFile *.leex set filetype=eelixir
  autocmd FileType markdown setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd FileType go setlocal nolist
  autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim " Enable sparkup for jsx files
augroup END
"}}}
