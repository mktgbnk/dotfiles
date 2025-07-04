# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration - Powerlevel10k for beautiful prompt
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins for enhanced functionality
plugins=(
  git                      # Git aliases and functions
  kubectl                  # Kubernetes completion and aliases
  kube-ps1
  docker                   # Docker completion and aliases
  helm                     # Helm completion
  terraform                # Terraform completion
  aws                      # AWS CLI completion
  fzf                      # Fuzzy finder for command history and file search
  zsh-autosuggestions      # Fish-like autosuggestions
  zsh-syntax-highlighting  # Syntax highlighting for commands
  history-substring-search # Search history with up/down arrows
  colored-man-pages        # Colorized man pages
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Environment variables
export EDITOR='vim'

# History configuration
HISTSIZE=50000                 # Number of commands in memory
SAVEHIST=50000                 # Number of commands saved to file
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicates first when trimming history
setopt HIST_IGNORE_DUPS        # Don't record duplicate consecutive entries
setopt HIST_IGNORE_ALL_DUPS    # Delete old entry if new entry is duplicate
setopt HIST_FIND_NO_DUPS       # Don't display duplicates during searches
setopt HIST_SAVE_NO_DUPS       # Don't write duplicates to history file
setopt SHARE_HISTORY           # Share history between all sessions

# Completion configuration
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # Case insensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # Colored completions

# General aliases
alias ll='ls -alF'
alias dev='cd ~/dev'

# # Git aliases
alias gs='git status'
alias gau='git add -u'
alias gc='git commit'
alias gpr='git pull --rebase'
alias gl='git log'
alias gsm='git switch master'

# Kubernetes aliases
alias kgp='kubectl get pods'         # Get pods
alias kgs='kubectl get svc'          # Get services
alias kgn='kubectl get nodes'        # Get nodes
alias kgd='kubectl get deployments'  # Get deployments

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
