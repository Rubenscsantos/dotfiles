set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on
autocmd FileType javascript setlocal ts=4 sts=4 sw=4

