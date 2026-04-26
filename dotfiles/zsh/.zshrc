# Powerlevel10k prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Плагины
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zoxide
)

source $ZSH/oh-my-zsh.sh

# История
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Системные алиасы
alias fresh='/usr/local/bin/fresh'
alias freash='/usr/local/bin/fresh'
alias frsh='/usr/local/bin/fresh'
alias update='/usr/local/bin/fresh'
alias upd='/usr/local/bin/fresh'
alias cls='clear'
alias q='exit'

# Файловые алиасы
alias ls='ls --color=auto'
alias la='ls -a'
alias ..='cd ..'
alias grep='grep --color=auto'
alias vim='nvim'

# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"