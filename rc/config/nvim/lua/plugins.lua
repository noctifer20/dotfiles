local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not isntalled")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'neovim/nvim-lspconfig'
	use 'nvim-treesitter/nvim-treesitter'
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.1',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { "nvim-telescope/telescope-file-browser.nvim" }
	use 'nvim-tree/nvim-web-devicons'
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	use 'onsails/lspkind-nvim'
	use {
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	}
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use {
    		"glepnir/lspsaga.nvim",
    		branch = "main",
    		config = function()
        		require("lspsaga").setup({})
    		end,
    		requires = { {"nvim-tree/nvim-web-devicons"} }
	}
	use {
  		'nvim-tree/nvim-tree.lua',
  		requires = {
    			'nvim-tree/nvim-web-devicons', -- optional, for file icons
  		},
  		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'navarasu/onedark.nvim'
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
  use({
    'nvim-neotest/neotest',
    requires = {
      'haydenmeade/neotest-jest',
    }
  })
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

end)
