[[ -f ~/.dotfiles/.bashrc ]]
. ~/.dotfiles/.bashrc

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Defaults
export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="firefox"

