local api = vim.api
local cmd = vim.cmd

api.nvim_set_keymap('i','<TAB>','<ESC>',{noremap = true})
api.nvim_set_keymap('v','<ESC>','<TAB>',{noremap = true})
api.nvim_set_keymap('v','<TAB>','<ESC>',{noremap = true})
api.nvim_set_keymap('i','<ESC>','<TAB>',{noremap = true})
api.nvim_set_keymap('n','vv','<C-v>',{noremap = true})
api.nvim_set_keymap('n','PP',':bn<CR>',{noremap = true})
api.nvim_set_keymap('n','OO',':bp<CR>',{noremap = true})

vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single"
  }
)

vim.cmd [[nnoremap <buffer><silent> <C-space> :lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>]]
vim.cmd [[nnoremap <buffer><silent> ]g :lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>]]
vim.cmd [[nnoremap <buffer><silent> [g :lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>]]

vim.cmd[[set showtabline=0 ]]

vim.cmd([[
augroup clearcmdline
    autocmd!
    function! Echo_Nothing(timer)
        echo ''
    endfunction
    autocmd CmdlineLeave * call timer_start(1000, 'Echo_Nothing')
augroup END
vnoremap SS :Ray<CR>
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }


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


