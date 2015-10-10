set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-repeat'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'jgdavey/tslime.vim'
  Plugin 'rstacruz/sparkup.git'
  Plugin 'vim-scripts/Rename'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
  Plugin 'ervandew/supertab'
  Plugin 'rizzatti/dash.vim'
  Plugin 'tpope/vim-fugitive.git'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'mattn/webapi-vim'
  Plugin 'mattn/gist-vim'
  Plugin 'rking/ag.vim'
  Plugin 'henrik/vim-qargs'
  Plugin 'scrooloose/syntastic'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'vim-scripts/ctags.vim'
  Plugin 'vim-scripts/matchit.zip'
  Plugin 'vim-scripts/tComment'
  Plugin 'aquach/vim-http-client'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'taglist.vim'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'BjRo/vim-extest'
  Plugin 'fatih/vim-go'
  Plugin 'nsf/gocode', {'rtp': 'vim/'}
  Plugin 'scrooloose/nerdtree'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'NLKNguyen/papercolor-theme'
  Plugin 'othree/yajs.vim'
  Plugin 'mxw/vim-jsx'

  " Colorschemes
  Plugin 'vim-scripts/Railscasts-Theme-GUIand256color'
call vundle#end()            " required

filetype plugin indent on    " required

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

set tabstop=2 shiftwidth=2 shiftround expandtab
set t_Co=256
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set textwidth=80 " Make it obvious where 80 characters is
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
let g:html_indent_tags = 'li\|p'
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
set smarttab      " insert tabs on the start of a line
set hlsearch      " highlight search terms
set incsearch     " show search matches as
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" No need to track whitespace for go, the linter will take care of it, on save
au filetype go set nolist

autocmd filetype html,xml set listchars-=tab:>.
set pastetoggle=<F2> " Set paste mode using F2 for copying stuff
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers=['jshint']
let g:mustache_abbreviations = 1
let g:jsx_ext_required = 1 " Allow JSX in normal JS files

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

let mapleader=","

" NerdTREE
map <Leader>n :NERDTreeToggle<CR>

" Ctags stuff
let Tlist_Show_One_File=1
map <Leader>ct :!ctags -R --exclude='vendor/**/*' .<CR>
map <Leader><Tab> :TlistOpen<CR>
map <Leader>gd tjump<CR>
map <Leader>gd "zyiw:exe "tj ".@z.""<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

imap jk <Esc>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:rspec_command = 'call Send_to_Tmux("tmux set -g status-left-fg white && tmux set -g status-left \"  Running {spec}\" && rspec {spec} --fail-fast && (tmux set -g status-left \"  Tests passed\" && tmux set -g status-left-fg green) || (tmux set -g status-left \"  Tests failed\" && tmux set -g status-left-fg red) \n")'
au FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>s :call RunNearestSpec()<CR>
au FileType ruby map <Leader>l :call RunLastSpec()<CR>
au FileType ruby map <Leader>a :call RunAllSpecs()<CR>

au FileType elixir map <leader>et :ExTestRunFile<CR>
au FileType elixir map <leader>es :ExTestRunMethod<CR>
au FileType elixir map <leader>el :ExTestRunLast<CR>

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

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

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <S-Tab> <c-n>

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  autocmd!

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for
  " Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

colorscheme railscasts
highlight Pmenu ctermbg=white ctermfg=black
