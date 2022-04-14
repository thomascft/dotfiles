
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.yarn/bin" ] ; then
PATH="$HOME/.yarn/bin:$PATH"
fi
. "$HOME/.cargo/env"


read session'?Choose session:'

if [[ $session = "" ]];then
	echo 'Welcome the tty!'
else
	echo 'Opening: '$session
	startx $session
fi
