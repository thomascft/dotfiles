
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.yarn/bin" ] ; then
PATH="$HOME/.yarn/bin:$PATH"
fi

startx
