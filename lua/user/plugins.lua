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
		use 'sudoerwx/vim-ray-so-beautiful'
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
		use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
		use 'ap/vim-css-color'
		use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		  requires = { {'nvim-lua/plenary.nvim'} }
		}
		use 'BurntSushi/ripgrep'
		use 'sharkdp/fd'
		use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }
		use 'wbthomason/packer.nvim'
		use 'David-Kunz/markid'
		use 'Raimondi/delimitMate'
		use 'edluffy/hologram.nvim'
		use 'airblade/vim-gitgutter'
		use 'neoclide/coc-git'
		use 'tpope/vim-fugitive'
		use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
		-- use 'MaskRay/ccls'
		-- use {
		--   'nvim-lualine/lualine.nvim',
		--   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
		-- }
		-- use 'vim-airline/vim-airline'
		-- use 'vim-airline/vim-airline-themes'
		-- use 'jeaye/color_coded'
		use {
		    'numToStr/Comment.nvim',
		    config = function()
		        require('Comment').setup()
		    end
		}
		use  'hrsh7th/nvim-cmp'
		-- use {
		-- 		"windwp/nvim-autopairs",
  --   		config = function() require("nvim-autopairs").setup {} end
		-- 		}
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
    -- use 'bling/vim-bufferline'
    use 'sheerun/vim-polyglot'

		use 'ctrlpvim/ctrlp.vim'
		use 'HerringtonDarkholme/yats.vim'

  	--use 'gruvbox-community/gruvbox'
  	-- use 'sainnhe/gruvbox-material'
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
