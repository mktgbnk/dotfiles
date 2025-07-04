if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  kubectl
  kube-ps1
  docker
  helm
  terraform
  aws
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

HISTSIZE=50000
SAVEHIST=50000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

alias ll='ls -alF'
alias dev='cd ~/dev'

alias gs='git status'
alias gau='git add -u'
alias gc='git commit'
alias gpr='git pull --rebase'
alias gl='git log'
alias gsm='git switch main'
alias gr='git rebase -i origin/main'

alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgn='kubectl get nodes'
alias kgd='kubectl get deployments'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
