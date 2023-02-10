" Inspect $TERM instad of t_Co as it works in neovim as well
syntax on
if &term =~ '256color'
  " Enable true (24-bit) colors instead of (8-bit) 256 colors.
  " :h true-color
  if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
  colorscheme gruvbox
endif
highlight VertSplit guibg=#181818 guifg=#996228
highlight SLBackground guibg=#181818 guifg=#996228
highlight SLFileType guibg=indianred guifg=#663333
highlight SLBufNumber guibg=SeaGreen guifg=#003333
highlight SLLineNumber guibg=#80a0ff guifg=#003366

set statusline=
set statusline=\%#SLBackground#
set statusline+=\ %F
set statusline+=\%= " separator
set statusline+=\ %#SLFileType#
set statusline+=\ FT:\ %Y
set statusline+=\ %#SLBufNumber#
set statusline+=\ BN:\ %n
set statusline+=\ %#SLLineNumber#
set statusline+=\ LN:\ %l
