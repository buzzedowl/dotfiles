# ~~~~~~~~~~~~~~~ oh-my-zsh ~~~~~~~~~~~~~~~ #
#
# Path to your Oh My Zsh installation, Using Default config. 
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
# ~~~~~~~~~~~~~~~ CONFIG ~~~~~~~~~~~~~~~~ #
#
# Set to superior editing mode
bindkey -v

# History settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Editor
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='zen' 

# ~~~~~~~~~~~~~~~ ALIASES ~~~~~~~~~~~~~~~ #
#
# Most Used #
alias v='nvim'
alias t='tmux'
alias c='clear' 
alias q='exit' 
              
# Navigation #
alias ..='cd ..'
alias ...='cd ...'
alias -- -='cd -'  # Go to previous directory

# Git #
alias ga='git add .'
alias gc='git commit -m'
alias gpm='git push origin main'
alias gpl='git pull origin main'
alias gg='lazygit'

# Language Specific #
alias py='python3'

# Reload Config #
alias r='source ~/.zshrc'  

# Open nvim in tmux # 
vv() {
    [ -z "$TMUX" ] && tmux new-session "nvim $*" || tmux new-window "nvim $*"
}