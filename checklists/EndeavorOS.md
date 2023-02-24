# New Installation Checklist

## Welcome Launcher
-[x] Update Mirrors (Arch)
-[x] Update Mirrors (Endeavor OS)
-[x] Update System
-[x] Package Cleanup configuration

## Dropbox/KeePassXC
-[x] Dropbox:
  - `yay -S dropbox`
-[x] KeepassXC
  - `sudo pacman -Syu keepassxc`
  - Set theme to native
  - Tools > Settings > Lock databases after inactivity of 300 sec

## Neovim
-[x] Install Neovim from https://github.com/neovim/neovim
-[x] Create ssh keys to clone [nvim-config repo](https://github.com/asungy/nvim-config)
  - `ssh-keygen -b 4096 -t rsa`
-[x] `git clone git@github.com:asungy/nvim-config.git $HOME/.config/nvim`
-[x] `cp -r ~/.config/nvim/dotfiles/. $HOME`
-[x] If there are any errors, try:
  - `:TSUpdate`
  - `:Lazy sync`

## Konsole
-[x] Set font to FiraCode

## System
-[x] Enable sudo without password:
  - sudo visudo
  - Add `<USER> ALL=(ALL:ALL) NOPASSWD: ALL` to the end of the file.
  - Save to /etc/sudoers
-[ ] Enable bluetooth:
  - All necessary packages for bluetooth should be installed by default.
  - `sudo systemctl start bluetooth`

### Settings
-[x] Apperance:
  - Global theme: Breeze Dark Endeavor OS
-[x] Workspace behavior:
  - Screen Edges: Turn off Windows dragged to top edge
  - Virtual Desktops: Add 4 workspaces
-[x] Window Management:
  - Task Switcher: Thumbnail Grid
-[x] Shortcuts:
  - Custom Shortcuts > Set Konsole to <Ctrl + Shift + T>

## Toolbar
-[x] Remove workspaces
-[x] Resize toolbar
-[x] Auto-hide

## Browsers
-[x] Firefox:
    - Private browsing setup
-[x] Brave:
  - Install with `yay -S brave-bin`
  - Private browsing setup
  - Extensions:
    - Dark Reader

## Development Environment
-[x] Docker
  - `sudo pacman -Syu docker`
  - `sudo systemctl enable docker`
  - `sudo usermod -aG docker ${USER}`
  - Log off and log on to see effects
