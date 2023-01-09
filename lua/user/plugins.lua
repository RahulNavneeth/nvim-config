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
		use 'ap/vim-css-color'
		-- use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }
		use 'wbthomason/packer.nvim'
		use 'David-Kunz/markid'
		use 'Raimondi/delimitMate'
		use 'airblade/vim-gitgutter'
		use 'neoclide/coc-git'
		use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
		use 'jackguo380/vim-lsp-cxx-highlight'
		use 'prabirshrestha/vim-lsp'
		use 'MaskRay/ccls'
		use 'vim-airline/vim-airline'
		use 'vim-airline/vim-airline-themes'
		-- use 'jeaye/color_coded'
		use 'mattn/vim-lsp-settings'
		use {
		    'numToStr/Comment.nvim',
		    config = function()
		        require('Comment').setup()
		    end
		}
 		use 'leafOfTree/vim-svelte-plugin'
		use  'hrsh7th/nvim-cmp'
		use {
				"windwp/nvim-autopairs",
    		config = function() require("nvim-autopairs").setup {} end
				}
		use 'mhartington/formatter.nvim'
		use 'andweeb/presence.nvim'
		use 'nvim-treesitter/nvim-treesitter'
		use 'prettier/vim-prettier'
		
		

  	use 'morhetz/gruvbox'

    use 'bling/vim-bufferline'
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
	        use 'othree/html5.vim'
	        use 'pangloss/vim-javascript'
					use 'leafgarland/typescript-vim'


					use {
					    's1n7ax/nvim-terminal',
					     config = function()
					        vim.o.hidden = true
					        require('nvim-terminal').setup()
					    end,
							}

	end
}
