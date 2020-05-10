" ## 1: Plugins and their settings

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/autoload/plugged')

" TODO: When building vscode functionality, place necessary plugins here
if exists('g:vscode')

" None of these will be loaded for vscode ssessions.
else


  " General functionality


  " NERDTree for file navigation
  Plug 'scrooloose/nerdtree'

  " Airline for nifty info in the status and tablines
  Plug 'vim-airline/vim-airline'
  source $HOME/.config/nvim/plugins/settings/vim-airline.vim

  Plug 'vim-airline/vim-airline-themes'
  source $HOME/.config/nvim/plugins/settings/vim-airline-themes.vim

  " Neat column highlighting for csv and tsv files.
  " Also allows some basic SQL functionality, but I haven't learned that
  Plug 'mechatroner/rainbow_csv'

  " Repleat-plugin-with-.:
  " TODO: Come up with better mappings for this
  Plug 'tpope/vim-repeat'

  " Increment dates and times with C-A and C-X
  Plug 'tpope/vim-speeddating'

  " Fuzzy search for files and tags, grep contents, etc.
  Plug 'junegunn/fzf.vim'
  source $HOME/.config/nvim/plugins/settings/fzf.vim



  " Colorschemes


  " The gold standard of warm dark colorschemes
  Plug 'morhetz/gruvbox' 
  source $HOME/.config/nvim/plugins/settings/gruvbox.vim

  " Plug 'altercation/vim-colors-solarized' " Gross
  " Plug 'NLKNguyen/papercolor-theme' " Beautiful with python! But not much support for scala.
  " Plug 'joshdick/onedark.vim' " Decent middle ground with good support for both scala and python, but low contrast 
  " Plug 'drewtempelmeyer/palenight.vim' " Based on onedark: harder contrast, but also cooler.
  " Plug 'ayu-theme/ayu-vim'



  " Make coding easier


  " The best worst language server/linting integration.
  Plug 'neoclide/coc.nvim', {'branch': 'release' }
  source $HOME/.config/nvim/plugins/settings/coc-nvim.vim

  " Provides auto-completion for common commands.
  " Plug 'mattn/emmet-vim'

  " Syntax highlighting for many languages
  Plug 'sheerun/vim-polyglot'

  " Colored parens
  Plug 'junegunn/rainbow_parentheses.vim'
  source $HOME/.config/nvim/plugins/settings/rainbow_parentheses.vim

  " Better Comments
  Plug 'jbgutierrez/vim-better-comments'

  " Comment-in-movement:
  Plug 'tpope/vim-commentary'
  source $HOME/.config/nvim/plugins/settings/vim-commentary.vim

  " Surround-movement-with-X:
  Plug 'tpope/vim-surround'

  " vim-scala - modern scaladoc indentation
  Plug 'derekwyatt/vim-scala' " This one has a bit more than syntax highlighting.
  source $HOME/.config/nvim/plugins/settings/vim-scala.vim

  " Nice python syntax highlighting.  Doesn't seem to work with all
  " colorschemes, but does with gruvbox
  Plug 'vim-python/python-syntax'
  source $HOME/.config/nvim/plugins/settings/python-syntax.vim

  " Golang support for building, etc.
  Plug 'fatih/vim-go'
  source $HOME/.config/nvim/plugins/settings/vim-go.vim



  " General dev/git stuff


  " Have the file system follow you around.  Not sure how I feel about this one...
  Plug 'airblade/vim-rooter'
  source $HOME/.config/nvim/plugins/settings/vim-rooter.vim

  Plug 'Xuyuanp/nerdtree-git-plugin'
  source $HOME/.config/nvim/plugins/settings/nerdtree-git-plugin.vim

  Plug 'airblade/vim-gitgutter'

  " Integration for git in vim.
  " TODO: Learn, configure, and start using.
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb' " This enables GBrowse and some other github-specific functionality for fugitive.

endif

call plug#end()

