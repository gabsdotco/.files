# ----------------- #
# ZSH Configuration #
# ----------------- #

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="typewritten/typewritten"

export TYPEWRITTEN_PROMPT_LAYOUT="singleline"
export TYPEWRITTEN_SYMBOL="λ"
export TYPEWRITTEN_COLOR_MAPPINGS="primary:white;secondary:white"
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
