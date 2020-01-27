# dotfiles
dot dot dot

### zsh
To run zsh automatically after ssh auth, add this line to the end of .bashrc

$ [ -x /usr/bin/zsh ] && exec /usr/bin/zsh
