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

if [[ ! -d "$HOME/.local/share/zap/" ]] then
		zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
fi
