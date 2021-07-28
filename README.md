# dotfiles
dot dot dot files

## Installation
```
git clone https://git.jasonhong.xyz/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x ~/dotfiles/bootstrap
./bootstrap
```
## Notes
1. The bootstrap script is written to be idempotent. Run it as many times as you like!
2. I've run shellcheck on the scripts for bashisms and portability issues between shells.
3. My vimrc was written for vim, before I switched to neovim. I didn't remove any duplicate neovim settings included by default, so this setup should behave nearly identically with both vim/neovim (except plugins exclusive to neovim, of course).

### zsh as default
To run zsh automatically after ssh auth, add this line to the end of .bashrc
```	
[ -x /usr/bin/zsh ] && exec /usr/bin/zsh
```

### mpd on startup
Make sure that mpd is run as a user process, not a system service 
```
sudo systemctl disable mpd.service
sudo systemctl disable mpd.socket
systemctl enable --user mpd.service
systemctl enable --user mpd.socket
```

### kitty themes
Kitty theme credits to [@dexpota](https://github.com/dexpota)
```
ln -svfn theme-you-want.conf ~/.config/kitty/theme.conf
```
