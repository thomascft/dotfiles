eval "$(mcfly init zsh)"

# load zgen
source "${HOME}/.zgen/zgen.zsh"
zgen load spaceship-prompt/spaceship-prompt spaceship
zgen load "MichaelAquilina/zsh-auto-notify"
zgen load "Senderman/doas-zsh-plugin"
zgen load zsh-users/zsh-autosuggestions



# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/thomas/Projects/pomo/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/thomas/Projects/pomo/node_modules/tabtab/.completions/electron-forge.zsh