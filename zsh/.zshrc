[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/thomas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[[ -d "$HOME/.local/share/zap/" ]] || zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)

plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"

# Prompt
PS1=$'\n'"%S%n@%m%s %1~"$'\n\n'"  %S%#%s "
# Keybinds

bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey ""  backward-kill-word
