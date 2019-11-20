#
# ~/.bashrc
#

# fzf Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jon/Applications/fzf/shell/completion.bash" 2> /dev/null

# fzf Key bindings
# ------------
source "/home/jon/Applications/fzf/shell/key-bindings.bash"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Just source .profile
[[ -f ~/.profile ]] && . ~/.profile
