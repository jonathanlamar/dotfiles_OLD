" ## 1: Plugins and their settings

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/autoload/plugged')



  " General functionality


  " Repleat-plugin-with-.:
  " TODO: Come up with better mappings for this
  Plug 'tpope/vim-repeat'

  " Increment dates and times with C-A and C-X
  Plug 'tpope/vim-speeddating'

  " Neat column highlighting for csv and tsv files.
  " Also allows some basic SQL functionality, but I haven't learned that
  Plug 'mechatroner/rainbow_csv'

  " NERDTree for file navigation
  " Plug 'scrooloose/nerdtree'
  " source $HOME/.config/nvim/plugins/settings/nerdtree.vim

  " Airline for nifty info in the status and tablines
  Plug 'vim-airline/vim-airline'
  source $HOME/.config/nvim/plugins/settings/vim-airline.vim

  Plug 'vim-airline/vim-airline-themes'

  " Fuzzy search for files and tags, grep contents, etc.
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  source $HOME/.config/nvim/plugins/settings/fzf.vim

  " Display available keybindings in popup.
  Plug 'liuchengxu/vim-which-key'
  " FIXME: This souce has to go after all plugins have been configured.
  " source $HOME/.config/nvim/plugins/settings/vim-which-key.vim

  " Start Screen
  Plug 'mhinz/vim-startify'
  source $HOME/.config/nvim/plugins/settings/vim-startify.vim

  " Neat icons
  Plug 'ryanoasis/vim-devicons'

  " Distraction-free markdown writing
  Plug 'junegunn/goyo.vim'
  source $HOME/.config/nvim/plugins/settings/goyo.vim

  " TODO: Figure out how to make this less ugly
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  source $HOME/.config/nvim/plugins/settings/ranger.vim

  Plug 'christoomey/vim-tmux-navigator'
  source $HOME/.config/nvim/plugins/settings/navigator.vim



  " Colorschemes


  " The gold standard of warm dark colorschemes
  " Plug 'morhetz/gruvbox'
  " TODO: Some of the settings in these colorscheme files apply to all
  " colorschemes. It would be nice to source all of them and condition on the
  " active colorscheme
  "
  " source $HOME/.config/nvim/plugins/settings/gruvbox.vim

  " Plug 'NLKNguyen/papercolor-theme' " Beautiful with python! But not much support for scala.
  " source $HOME/.config/nvim/plugins/settings/papercolor-theme.vim

  Plug 'joshdick/onedark.vim' " Decent middle ground with good support for both scala and python, but low contrast
  source $HOME/.config/nvim/plugins/settings/onedark.vim

  " Plug 'danilo-augusto/vim-afterglow'
  " source $HOME/.config/nvim/plugins/settings/vim-afterglow.vim

  " Plug 'ayu-theme/ayu-vim'
  " source $HOME/.config/nvim/plugins/settings/ayu-vim.vim

  " Plug 'chriskempson/base16-vim'
  " source $HOME/.config/nvim/plugins/settings/base16-vim.vim

  " Plug 'arcticicestudio/nord-vim'
  " source $HOME/.config/nvim/plugins/settings/nord-vim.vim



  " Make coding easier


  " Comment-in-movement:
  Plug 'tpope/vim-commentary'
  source $HOME/.config/nvim/plugins/settings/vim-commentary.vim

  " Surround-movement-with-X:
  Plug 'tpope/vim-surround'

  " The best worst language server/linting integration.
  Plug 'neoclide/coc.nvim', {'branch': 'release' }
  source $HOME/.config/nvim/plugins/settings/coc-nvim.vim

  " Provides auto-completion for common commands.
  " Plug 'mattn/emmet-vim'

  " Syntax highlighting for many languages
  Plug 'sheerun/vim-polyglot'

  Plug 'derekwyatt/vim-scala'
  source $HOME/.config/nvim/plugins/settings/vim-scala.vim

  " Better syntax highlighting for java
  Plug 'uiiaoo/java-syntax.vim'
  source $HOME/.config/nvim/plugins/settings/java-syntax.vim

  " Nice python syntax highlighting.  Doesn't seem to work with all
  " colorschemes, but does with gruvbox
  Plug 'vim-python/python-syntax'
  source $HOME/.config/nvim/plugins/settings/python-syntax.vim

  Plug 'majutsushi/tagbar'
  source $HOME/.config/nvim/plugins/settings/tagbar.vim

  " Plug 'mhinz/vim-signify'
  " source $HOME/.config/nvim/plugins/settings/vim-signify.vim

  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
  source $HOME/.config/nvim/plugins/settings/vim-pydocstring.vim



  " General dev/git stuff

  " Plug 'tmsvg/pear-tree'
  " source $HOME/.config/nvim/plugins/settings/pear-tree.vim

  Plug 'jiangmiao/auto-pairs'
  source $HOME/.config/nvim/plugins/settings/auto-pairs.vim

  " Plug 'Xuyuanp/nerdtree-git-plugin'
  " source $HOME/.config/nvim/plugins/settings/nerdtree-git-plugin.vim

  Plug 'airblade/vim-gitgutter'

  " Commit browser
  " TODO: How much do I actually use this?
  Plug 'junegunn/gv.vim'

  " Integration for git in vim.
  Plug 'tpope/vim-fugitive'
  " This enables GBrowse and some other github-specific functionality for fugitive.
  Plug 'tpope/vim-rhubarb'

call plug#end()

