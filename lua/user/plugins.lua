local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
	})
	vim.api.nvim_command 'packadd packer.nvim'
end

local ok, packer = pcall(require, "packer")
if not ok then return end

return packer.startup {
	function()
		use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
		use 'prisma/vim-prisma'
		use { 'yardnsm/vim-import-cost',  run = ':ImportCost'}
		use 'rhysd/vim-grammarous'
		use 'nanozuki/tabby.nvim'
		use { "catppuccin/nvim", as = "catppuccin" }
		use 'ThePrimeagen/vim-be-good'
		use 'ThePrimeagen/harpoon'
		use 'nvim-telescope/telescope-media-files.nvim'
		use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
		use 'preservim/tagbar'
		use 'sudoerwx/vim-ray-so-beautiful'
		use 'github/copilot.vim'
		use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
		}
		use {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
		}
		use 'simrat39/rust-tools.nvim'
		use 'ap/vim-css-color'
		use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.0',
		  requires = { {'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'} }
		}
		use 'BurntSushi/ripgrep'
		use 'sharkdp/fd'
		use 'feline-nvim/feline.nvim'
		use 'wbthomason/packer.nvim'
		use 'David-Kunz/markid'
		use 'Raimondi/delimitMate'
		use 'edluffy/hologram.nvim'
		use 'neoclide/coc-git'
		use 'tpope/vim-fugitive'
		use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
		use {
		    'numToStr/Comment.nvim',
		    config = function()
		        require('Comment').setup()
		    end
		}
		use  'hrsh7th/nvim-cmp'
		use 'mhartington/formatter.nvim'
		use 'andweeb/presence.nvim'
		use 'nvim-treesitter/nvim-treesitter'
		use {'prettier/vim-prettier' , run = "yarn install"}
  	use 'morhetz/gruvbox'
		use {
		    "jcdickinson/wpm.nvim",
		    config = function()
		        require("wpm").setup({
		        })
		    end
		}
    use 'sheerun/vim-polyglot'
		use 'ctrlpvim/ctrlp.vim'
		use 'HerringtonDarkholme/yats.vim'
	  use {
	      'nvim-tree/nvim-tree.lua',
	      requires = {
	        'nvim-tree/nvim-web-devicons', 
	      },
	      tag = 'nightly' 
	    }
					use {
					    's1n7ax/nvim-terminal',
					     config = function()
					        vim.o.hidden = true
					        require('nvim-terminal').setup()
					    end,
							}

	end
}
