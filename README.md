# dotfiles
dot dot dot files

### Installation
```
git clone https://github.com/jasonhong0810/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x ~/dotfiles/bootstrap
./bootstrap
```

### zsh as default
To run zsh automatically after ssh auth, add this line to the end of .bashrc
```	
[ -x /usr/bin/zsh ] && exec /usr/bin/zsh
```
