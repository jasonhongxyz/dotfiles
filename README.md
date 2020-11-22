# dotfiles
dot dot dot files

### Installation
```
git clone https://github.com/jasonhong0810/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x ~/dotfiles/bootstrap
./bootstrap
```
The bootstrap script is idempotent.

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
