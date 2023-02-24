# New Installation Checklist

## Welcome Launcher
-[ ] Update Mirrors (Arch)
-[ ] Update Mirrors (Endeavor OS)
-[ ] Update System
-[ ] Package Cleanup configuration

## Dropbox/KeePassXC
-[ ] Dropbox:
  - `yay -S dropbox`
-[ ] KeepassXC
  - `sudo pacman -Syu keepassxc`
  - Set theme to native
  - Tools > Settings > Lock databases after inactivity of 300 sec

## Neovim
-[ ] Install Neovim from https://github.com/neovim/neovim
-[ ] Create ssh keys to clone [nvim-config repo](https://github.com/asungy/nvim-config)
  - `ssh-keygen -b 4096 -t rsa`
-[ ] `git clone git@github.com:asungy/nvim-config.git $HOME/.config/nvim`
-[ ] `cp -r ~/.config/nvim/dotfiles/. $HOME`
-[ ] If there are any errors, try:
  - `:TSUpdate`
  - `:Lazy sync`

## Konsole
-[ ] Set font to FiraCode

## System
-[ ] Enable sudo without password:
  - sudo visudo
  - Add `<USER> ALL=(ALL:ALL) NOPASSWD: ALL` to the end of the file.
  - Save to /etc/sudoers
-[ ] Enable bluetooth:
  - All necessary packages for bluetooth should be installed by default.
  - `sudo systemctl start bluetooth`
-[ ] Disable default directories
  - Remove unwanted directories
  - Disable in /etc/xdg/user-dirs.defaults

### Settings
-[ ] Apperance:
  - Global theme: Breeze Dark Endeavor OS
-[ ] Workspace behavior:
  - Screen Edges: Turn off Windows dragged to top edge
  - Virtual Desktops: Add 4 workspaces
-[ ] Window Management:
  - Task Switcher: Thumbnail Grid
-[ ] Shortcuts:
  - Custom Shortcuts > Set Konsole to <Ctrl + Shift + T>
  - Set Maximize Window to <Meta + Up>
  - Set Minimize Window to <Meta + Down>
  - Set Switch One Desktop to the Left to <Meta + Ctrl + Left>
  - Set Switch One Desktop to the Right to <Meta + Ctrl + Right>
-[ ] Input Devies:
  - Keyboard > Turn on "NumLock on Plasma Startup"

## Toolbar
-[ ] Remove workspaces
-[ ] Resize toolbar
-[ ] Auto-hide

## Browsers
-[ ] Firefox:
    - Private browsing setup
-[ ] Brave:
  - Install with `yay -S brave-bin`
  - Private browsing setup
  - Extensions:
    - Dark Reader

## Development Environment
-[ ] Docker
  - `sudo pacman -Syu docker`
  - `sudo systemctl enable docker`
  - `sudo usermod -aG docker ${USER}`
  - Log off and log on to see effects
