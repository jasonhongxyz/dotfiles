# dotfiles
dot dot dot files

## Installation
```
git clone https://git.jasonhong.xyz/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x ~/dotfiles/bootstrap
./bootstrap
```

### zsh as default
To run zsh automatically after ssh auth, add this line to the end of .bashrc
```	
[ -x /usr/bin/zsh ] && exec /usr/bin/zsh
```

### kitty themes
Kitty theme credits to [@dexpota](https://github.com/dexpota)
```
ln -svfn theme-you-want.conf ~/.config/kitty/theme.conf
```
