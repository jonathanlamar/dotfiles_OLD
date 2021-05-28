return require('packer').startup(function()

  -- General Functionality
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-compe' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'onsails/lspkind-nvim' }

  -- Code formatting
  use { 'sbdchd/neoformat' }

  -- Snippets
  use { 'hrsh7th/vim-vsnip' }
  use { 'cstrap/python-snippets' }
  use { 'ylcnfrht/vscode-python-snippet-pack' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }

  -- Vim dispatch
  use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

  -- Don't forget mappings
  use { 'liuchengxu/vim-which-key' }

end)
