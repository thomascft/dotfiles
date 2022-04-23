HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source "${HOME}/.zgen/zgen.zsh" || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

autoload -U compinit; compinit
eval "$(mcfly init zsh)"

zgen load spaceship-prompt/spaceship-prompt spaceship
zgen load "Senderman/doas-zsh-plugin"

zgen load unixorn/fzf-zsh-plugin
zgen load zsh-users/zsh-completions
zgen load zsh-users/zsh-history-substring-search
#This needs to be the last thing sourced.
zgen load zsh-users/zsh-syntax-highlighting
