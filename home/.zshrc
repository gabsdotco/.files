# ----------------- #
# ZSH Configuration #
# ----------------- #

# Path to your oh-my-zsh installation.
export ZSH="/home/gabs/.oh-my-zsh"

ZSH_THEME="typewritten/typewritten"

export TYPEWRITTEN_COLOR_MAPPINGS="primary:yellow;secondary:yellow"
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

alias main='git checkout main'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gb='git branch'
alias gbd='git branch -d'

alias grb='git rebase'
alias grbom='git rebase origin/master'
alias grbc='git rebase --continue'

alias gl='git log'
alias glo='git log --oneline --graph'

alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'

alias ga='git add'
alias gA='git add -A'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git add -A && git commit -m'
alias gfrb='git fetch origin && git rebase origin/master'

alias gxn='git clean -dn'
alias gx='git clean -df'

alias gsha='git rev-parse HEAD | pbcopy'

alias ghci='gh run list -L 1'

# -------------------- #
# Source configuration #
# -------------------- #
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/home/gabs/.zfunctions")

# pnpm
export PNPM_HOME="/home/gabs/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# asdf
. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"

export PATH="${HOME}/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
