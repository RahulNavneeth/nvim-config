local api = vim.api
local cmd = vim.cmd

vim.g.mapleader = "<space>"

vim.o.showtabline = 2

api.nvim_set_keymap('n','vv','<C-v>',{noremap = true})
api.nvim_set_keymap('n','PP',':bn<CR>',{noremap = true})
api.nvim_set_keymap('n','OO',':bp<CR>',{noremap = true})
api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
api.nvim_set_keymap('n', 'J', "mzJ`z", {noremap = true})
api.nvim_set_keymap('n', '<C-d>', "<C-d>zz", {noremap = true})
api.nvim_set_keymap('n', '<C-u>', "<C-u>zz", {noremap = true})
api.nvim_set_keymap('n', 'cls', ":noh<CR>", {noremap = true})
api.nvim_set_keymap('n', 'gh', ":GrammarousCheck<CR>", {noremap = true})

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

vim.cmd([[

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'

imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

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

    :command Open :!open % -a Brave\ Browser

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


