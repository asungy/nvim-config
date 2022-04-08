# Install cURL:
#   To download VimPlug
sudo apt -y install curl

# Install RipGrep
#  for :Rg command in fzf
sudo apt -y install ripgrep

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Re-source .bashrc
source ~/.bashrc
