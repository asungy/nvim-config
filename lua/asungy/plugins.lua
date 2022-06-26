-- Autocommand that reloads neovim whenever keymaps.lua is written to
vim.cmd([[
    if !exists("plugins_autocmd_loaded")
        let plugins_autocmd_loaded = 1
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    endif
]])

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd("packadd packer.nvim")
end

local ok, packer = pcall(require, "packer")
if not ok then
    print("Cannot find packer. Try restarting.")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }
}

return packer.startup(function(use)
    -- package manager
    use "wbthomason/packer.nvim"

    -- color themes
    use "joshdick/onedark.vim"
    use "morhetz/gruvbox"
    use 'folke/tokyonight.nvim'

    -- lua implementation of Popup API
    use "nvim-lua/popup.nvim"

    -- useful lua functions used by lots of plugings
    use "nvim-lua/plenary.nvim"

    -- language server
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    -- Requires: gcc/clang and make
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- nvim-treesitter
    use "nvim-treesitter/nvim-treesitter"

    use "akinsho/toggleterm.nvim"

    -- completion plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- file explorer
    use "preservim/nerdtree"

    -- auto pairs
    use "jiangmiao/auto-pairs"

    -- Easily wrap text in character pairs (e.g. {}, (), [])
    use "tpope/vim-surround"

    -- Quick commenting/uncommenting
    use "tpope/vim-commentary"

    -- smooth scrolling
    use "psliwka/vim-smoothie"

    -- allow vim to maximize/un-maximize window
    use "szw/vim-maximizer"

    -- markdown preview
    use {
        "iamcco/markdown-preview.nvim",
        run = function() fn["mkdp#util#install"]() end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then require("packer").sync()
    end
end)
