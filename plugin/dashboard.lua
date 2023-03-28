local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "                   RAHUL M. NAVNEETH                 ",
}

dashboard.section.buttons.val = {
    dashboard.button( "E", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "F", "  > Find file", ":Telescope find_files<cr>"),
    dashboard.button( "R", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "S", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "Q", "  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val =  {
    "                                                    ",
    "====================================================",
    "=================     NEVER : q!    =================",
    "====================================================",
}

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
