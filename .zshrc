# ~~~~~~~~~~~~~~~ Oh My Zsh ~~~~~~~~~~~~~~~

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ~~~~~~~~~~~~~~~ Shell Environment ~~~~~~~~~~~~~~~

# Editor (used by shell commands)
export EDITOR='nvim'
export VISUAL='nvim'

# Terminal
export TERM=xterm-256color

# ~~~~~~~~~~~~~~~ Shell Options ~~~~~~~~~~~~~~~

# Vi mode
bindkey -v

# History
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~

# Quick commands
alias c='clear'
alias q='exit'
alias r='source ~/.zshrc'

# Editor
alias v='nvim'

# Tmux
alias t='tmux'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# Git
alias ga='git add .'
alias gc='git commit -m'
alias gpm='git push origin main'
alias gpl='git pull origin main'
alias gg='lazygit'

# Language
alias py='python3'

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~

# Open nvim in tmux
vv() {
    [ -z "$TMUX" ] && tmux new-session "nvim $*" || tmux new-window "nvim $*"
}