local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
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
-- "                                                                                                                                     ",
-- "                                                                                                                                     ",
-- "██████╗  █████╗ ██╗  ██╗██╗   ██╗██╗         ███╗   ███╗       ███╗   ██╗ █████╗ ██╗   ██╗███╗   ██╗███████╗███████╗████████╗██╗  ██╗",
-- "██╔══██╗██╔══██╗██║  ██║██║   ██║██║         ████╗ ████║       ████╗  ██║██╔══██╗██║   ██║████╗  ██║██╔════╝██╔════╝╚══██╔══╝██║  ██║",
-- "██████╔╝███████║███████║██║   ██║██║         ██╔████╔██║       ██╔██╗ ██║███████║██║   ██║██╔██╗ ██║█████╗  █████╗     ██║   ███████║",
-- "██╔══██╗██╔══██║██╔══██║██║   ██║██║         ██║╚██╔╝██║       ██║╚██╗██║██╔══██║╚██╗ ██╔╝██║╚██╗██║██╔══╝  ██╔══╝     ██║   ██╔══██║",
-- "██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗    ██║ ╚═╝ ██║██╗    ██║ ╚████║██║  ██║ ╚████╔╝ ██║ ╚████║███████╗███████╗   ██║   ██║  ██║",
-- "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝     ╚═╝╚═╝    ╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═══╝╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝",
-- "                                                                                                                                     ",
-- "                                                                                                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "E", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "F", "  > Find file", ":Telescope find_files<cr>"),
    dashboard.button( "R", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "S", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "Q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
dashboard.section.footer.val =  {
    "                                                    ",
    "====================================================",
    "=================     NEVER : q!    =================",
    "====================================================",
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
