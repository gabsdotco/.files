# ----------------- #
# ZSH Configuration #
# ----------------- #

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""

fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten

export TYPEWRITTEN_PROMPT_LAYOUT="singleline"
export TYPEWRITTEN_SYMBOL="λ"
export TYPEWRITTEN_COLOR_MAPPINGS="primary:foreground;secondary:dim_foreground"
export TYPEWRITTEN_CURSOR="block"

plugins=(
  fzf
  git
  history-substring-search
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

# ------------------- #
# Alias configuration #
# ------------------- #

# Git alias
alias grt='cd "$(git rev-parse --show-toplevel)"' # Go to the root of the current git repository
alias gs='git status'
alias gp='git push'
alias gpf='git push --force'
alias gpft='git push --follow-tags'
alias gpl='git pull --rebase'
alias gcl='git clone'
alias gst='git stash'
alias grm='git rm'
alias gmv='git mv'
alias gb='git branch'
alias gl='git log'

# Extra alias
alias n='nvim'

# -------------------- #
# Source configuration #
# -------------------- #
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fpath=($fpath "$HOME/.zfunctions")

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# add cargo to PATH
export PATH="$HOME/.cargo/bin:$PATH"

# add bob to PATH
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Turso
export PATH="$HOME/.turso:$PATH"
fpath=($fpath "$HOME/.zfunctions")

# Set typewritten ZSH as a prompt
autoload -U promptinit; promptinit
prompt typewritten

# Set GVM variables
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Bun Completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Custom tools
export PATH="$HOME/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
