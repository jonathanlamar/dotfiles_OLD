" ## 1: Plugins and their settings

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/autoload/plugged')

" TODO: When building vscode functionality, place necessary plugins here
if exists('g:vscode')

" None of these will be loaded for vscode ssessions.
else

  " Colorschemes

  " The gold standard of warm dark colorschemes
  Plug 'morhetz/gruvbox' 
  source $HOME/.config/nvim/plugins/settings/gruvbox.vim

  " Plug 'altercation/vim-colors-solarized' " Gross
  " Plug 'NLKNguyen/papercolor-theme' " Beautiful with python! But not much support for scala.
  " Plug 'joshdick/onedark.vim' " Decent middle ground with good support for both scala and python, but low contrast 
  " Plug 'drewtempelmeyer/palenight.vim' " Based on onedark: harder contrast, but also cooler.
  " Plug 'ayu-theme/ayu-vim'


  " General functionality


  " NERDTree for file navigation
  Plug 'scrooloose/nerdtree'

  " Airline for nifty info in the status and tablines
  Plug 'vim-airline/vim-airline'

  Plug 'vim-airline/vim-airline-themes'
  source $HOME/.config/nvim/plugins/settings/airline.vim

  " Syntax highlighting
  Plug 'sheerun/vim-polyglot'
  " Neat column highlighting for csv and tsv files.
  Plug 'mechatroner/rainbow_csv'

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


  " Code auto-completion.
  Plug 'neoclide/coc.nvim', {'branch': 'release' }
  source $HOME/.config/nvim/plugins/settings/coc-nvim.vim

  " New plugins to experiment with
  " Have the file system follow you around
  Plug 'airblade/vim-rooter'

  " Colored parens
  Plug 'junegunn/rainbow_parentheses.vim'
  source $HOME/.config/nvim/plugins/settings/rainbow_parentheses.vim

  " Better Comments
  Plug 'jbgutierrez/vim-better-comments'

  " Commenting and other nice code stuff
  " Comment-in-movement:
  Plug 'tpope/vim-commentary'
  source $HOME/.config/nvim/plugins/settings/vim-commentary.vim

  " Surround-movement-with-X:
  Plug 'tpope/vim-surround'

  " Repleat-plugin-with-.:
  Plug 'tpope/vim-repeat'


  " Fzf
  Plug 'junegunn/fzf.vim'
  source $HOME/.config/nvim/plugins/settings/fzf.vim


  " Git stuff
  "
  Plug 'Xuyuanp/nerdtree-git-plugin'
  source $HOME/.config/nvim/plugins/settings/nerdtree-git-plugin.vim

  Plug 'airblade/vim-gitgutter' " Not sure if this plays nice with fugitive.
  Plug 'tpope/vim-fugitive'

endif

call plug#end()

