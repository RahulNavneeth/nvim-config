local api = vim.api
local g = vim.g
local cmd = vim.cmd

api.nvim_set_keymap('i','<TAB>','<ESC>',{noremap = true})
api.nvim_set_keymap('v','<ESC>','<TAB>',{noremap = true})
api.nvim_set_keymap('v','<TAB>','<ESC>',{noremap = true})
api.nvim_set_keymap('i','<ESC>','<TAB>',{noremap = true})
api.nvim_set_keymap('n','vv','<C-v>',{noremap = true})
api.nvim_set_keymap('n','OO',':bn<CR>',{noremap = true})
api.nvim_set_keymap('n','PP',':bp<CR>',{noremap = true})

vim.cmd([[
  set nrformats+=alpha
  let g:vim_svelte_plugin_load_full_syntax = 1
  let g:gruvbox_material_menu_selection_background = 'red'
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_material_enable_bold = 1
  let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
  let g:clang_c_options = '-std=gnu11'
  let g:gruvbox_underline = 1
  au BufNewFile,BufRead *.cpp set syntax=cpp11
  let g:airline_theme='transparent'

  let g:prettier#quickfix_enabled = 0
  let g:prettier#autoformat_require_pragma = 0
  au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

  let g:fern#renderer = "devicons"
  nnoremap nn :NERDTreeToggle<CR>
  tnoremap <TAB> <C-\><C-n>

 :command Html :!open % -a Brave\ Browser

    function! s:gruvbox_material_custom() abort
      highlight! link groupA groupB
      highlight! link groupC groupD
      let l:palette = gruvbox_material#get_palette('hard', 'mix', {})
      call gruvbox_material#highlight('groupE', l:palette.red, l:palette.black, 'undercurl', l:palette.red)
    endfunction
    
    augroup GruvboxMaterialCustom
      autocmd!
      autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
    augroup END
  
]])


cmd("syntax on")
require('user/plugins')
require('user/options')
print("WELCOME BACK, RAHUL M. NAVNEETH")


