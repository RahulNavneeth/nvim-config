local api = vim.api
local g = vim.g
local cmd = vim.cmd

g.mapleader = " "

api.nvim_set_keymap('i','<TAB>','<ESC>',{noremap = true})
api.nvim_set_keymap('v','<ESC>','<TAB>',{noremap = true})
api.nvim_set_keymap('v','<TAB>','<ESC>',{noremap = true})
api.nvim_set_keymap('i','<ESC>','<TAB>',{noremap = true})
api.nvim_set_keymap('n','vv','<C-v>',{noremap = true})


vim.cmd([[
 
  set nrformats+=alpha
  set rtp+=path/to/this_plugin
  let g:vim_svelte_plugin_load_full_syntax = 1
  let g:gruvbox_material_menu_selection_background = 'red'
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_material_enable_bold = 1
  let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
  let g:clang_c_options = '-std=gnu11'
  let g:gruvbox_underline = 1
  au BufNewFile,BufRead *.cpp set syntax=cpp11
  let g:airline_theme='transparent'

  let g:fern#renderer = "devicons"
  nnoremap nn :NERDTreeToggle<CR>
  tnoremap <TAB> <C-\><C-n>


 :command Cpp :read !head -1000 ~/projects/cpp/template.cpp
 :command Html :!open % -a Brave\ Browser

  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
  vmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

    function! s:gruvbox_material_custom() abort
      highlight! link groupA groupB
      highlight! link groupC groupD
    
      " Initialize the color palette.
      " The first parameter is a valid value for `g:gruvbox_material_background`,
      " the second parameter is a valid value for `g:gruvbox_material_foreground`,
      " and the third parameter is a valid value for `g:gruvbox_material_colors_override`.
      let l:palette = gruvbox_material#get_palette('hard', 'mix', {})
      " Define a highlight group.
      " The first parameter is the name of a highlight group,
      " the second parameter is the foreground color,
      " the third parameter is the background color,
      " the fourth parameter is for UI highlighting which is optional,
      " and the last parameter is for `guisp` which is also optional.
      " See `autoload/gruvbox_material.vim` for the format of `l:palette`.
      call gruvbox_material#highlight('groupE', l:palette.red, l:palette.black, 'undercurl', l:palette.red)
    endfunction
    
    augroup GruvboxMaterialCustom
      autocmd!
      autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
    augroup END
  set statusline=
]])

cmd("syntax on")
require('user/plugins')
require('user/options')

print("WELCOME BACK, RAHUL M. NAVNEETH")


