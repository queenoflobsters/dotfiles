# Environement variables
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="/usr/bin/hx"
export HOST=$HOST
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/gaybe/.pixi/bin:$PATH"
export JULIA_PKG_SERVER="" # Necessary for Julia because in with dnf... idk...

# I shat my balls

# Highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(
  main
  brackets
  pattern
  regexp
  root
  line
)

# Autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(
  completion
  match_prev_cmd
  history
)


# Theme
ZSH_THEME="bira"

# Plugins
plugins=(
  sudo
  aliases
  rust
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
)

# Aliases
alias lg="lazygit"
alias qalc="qalc -c"
alias lsd="lsd -lAg"

source $ZSH/oh-my-zsh.sh

### >>> opam >>>
eval "$(opam env)"
# <<< opam >>>

# >>> zoxide >>>
eval "$(zoxide init --cmd cd zsh)"
# <<< zoxide <<<

# >>> xmake >>>
test -f "$HOME/.xmake/profile" && source "$HOME/.xmake/profile"
# <<< xmake <<<

# >>> ghcup-env >>>
[ -f "/home/gaybe/.ghcup/env" ] && . "/home/gaybe/.ghcup/env" # ghcup-env
# <<< ghcup-env <<<


