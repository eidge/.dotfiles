set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'kien/ctrlp.vim'

  " Colorschemes
  Plugin 'vim-scripts/Railscasts-Theme-GUIand256color'
call vundle#end()            " required
filetype plugin indent on    " required


:imap jk <Esc>
:set tabstop=2 shiftwidth=2 expandtab
:set t_Co=256
:colorscheme railscasts
