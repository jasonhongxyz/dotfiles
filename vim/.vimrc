" syntax
syntax on

" show line numbers and relative line numbers
set rnu
set nu

" show status line
set laststatus=2

" backspace over anything
set backspace=indent,eol,start

" allows hidden buffers with unsaved changes
set hidden

" makes search case-insensitive, search becomes case-sensitive if it contains any capital letters
set ignorecase
set smartcase

" search as you type
set incsearch

" enable mouse support
set mouse+=a

" disable bell noise
set noerrorbells visualbell t_vb=

" highlight search
set hls

" extend history
set history=8192

" open split pane right and bottom
set splitbelow
set splitright

" tabstops
set tabstop=2 shiftwidth=2 expandtab
