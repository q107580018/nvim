-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    paccker_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1", -- "https://github.com/wbthomason/packer.nvim",
        "https://gitcode.net/mirrors/wbthomason/packer.nvim",
        install_path,
    })
    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim 安装完毕")
end

local packer = require("packer").startup({ function()
    -- packer包管理器
    use "wbthomason/packer.nvim"
    -- colorscheme
    use 'marko-cerovac/material.nvim'
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
    -- Tabs
    use { 'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- line
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- hightlight
    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- vim增强
    use 'easymotion/vim-easymotion'
    use 'tpope/vim-surround'
    use 'mhinz/vim-startify'
    use 'windwp/nvim-autopairs'
    use 'mg979/vim-visual-multi'
    -- 快速查找文件
    use { 'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- 显示缩进线
    use "Yggdroot/indentLine"

    -- LSP,补全，代码片段
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- { name = 'buffer' },
    use 'hrsh7th/cmp-path' -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'
    use 'onsails/lspkind-nvim' -- lspkind
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'rafamadriz/friendly-snippets'
    -- symbols-outline
    use 'simrat39/symbols-outline.nvim'

    use 'xiyaowong/nvim-cursorword'
end,
config = {
    max_jobs = 16,
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}
})
