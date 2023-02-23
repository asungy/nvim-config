# New Installation Checklist

## Welcome Launcher
- Update Mirrors (Arch)
- Update Mirrors (Endeavor OS)
- Update System
- Package Cleanup configuration

## Dropbox/KeePassXC
- Dropbox:
	- `yay -S dropbox`
- KeepassXC
	- `sudo pacman -Syu keepassxc`
	- Set theme to native
	- Tools > Settings > Lock databases after inactivity of 300 sec

## Neovim
- Install Neovim from https://github.com/neovim/neovim
- Create ssh keys to clone [nvim-config repo](https://github.com/asungy/nvim-config)
	- `ssh-keygen -b 4096 -t rsa`
- `git clone git@github.com:asungy/nvim-config.git $HOME/.config/nvim`

## System
- Enable sudo without password:
	- sudo visudo
	- Add `<USER> ALL=(ALL:ALL) NOPASSWD: ALL` to the end of the file.
	- Save to /etc/sudoers
- Enable bluetooth:
	- All necessary packages for bluetooth should be installed by default.
	- `sudo systemctl start bluetooth`

### Settings
- Apperance:
	- Global theme: Breeze Dark Endeavor OS
	- Fonts: Firacode Nerd Font
		- Installed with nvim-config setup.
- Workspace behavior:

## Browsers
- Firefox:
	- Private browsing setup
- Brave:
	- Install with `yay -S brave-bin`
	- Private browsing setup
