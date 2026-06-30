vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- Theme
    use 'folke/tokyonight.nvim'
    use 'rose-pine/neovim'
end)
