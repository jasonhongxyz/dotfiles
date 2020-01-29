# dotfiles
dot dot dot

### Install
```
git clone https://github.com/jasonhong0810/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap
```

### zsh
To run zsh automatically after ssh auth, add this line to the end of .bashrc
```	
[ -x /usr/bin/zsh ] && exec /usr/bin/zsh
```

### Permission Denied
if  `./bootstrap` -> `permission denied`, run `chmod +x ~/dotfiles/bootstrap`
