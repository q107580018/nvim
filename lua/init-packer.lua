local packer = require("packer").startup(function()
    -- packer包管理器
    use "wbthomason/packer.nvim"
    -- colorscheme
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
        }
    -- 快速注释
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
}
    use {
    'kyazdani42/nvim-tree.lua',
    requires = {
       -- optional, for file icon
      'kyazdani42/nvim-web-devicons', 
    }
}
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- vim增强
    use 'easymotion/vim-easymotion'
    use 'tpope/vim-surround'
    use 'mhinz/vim-startify'
    use 'windwp/nvim-autopairs'
    use 'mg979/vim-visual-multi'
    -- coc自动补全
    use {'neoclide/coc.nvim', branch = 'release'}
    -- 快速查找文件
    use { 'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- 显示缩进线
    use {"Yggdroot/indentLine"}

end)
require("config")
require("coc_config")
