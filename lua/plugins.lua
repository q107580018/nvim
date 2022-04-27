local packer = require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
        }
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
}
    use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
}
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'easymotion/vim-easymotion'
    use 'tpope/vim-surround'
    use 'mhinz/vim-startify'
    use 'windwp/nvim-autopairs'
    use 'mg979/vim-visual-multi'
    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'simrat39/symbols-outline.nvim'
    use {'neoclide/coc.nvim', branch = 'release'}
    use { 'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {"Yggdroot/indentLine"}

end)
require("config")
require("coc_config")
