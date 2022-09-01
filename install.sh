curl -L https://nixos.org/nix/install | sh
curl -sS https://starship.rs/install.sh | sh

. ~/.nix-profile/etc/profile.d/nix.sh

nix-env -iA \
  nixpkgs.fish \
  nixpkgs.git \
  nixpkgs.neovim \
  nixpkgs.stow \
  nixpkgs.bat \
  nixpkgs.exa \
  nixpkgs.tmux \
  nixpkgs.alacritty \

stow git
stow fish
stow nvim 
stow starship


git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

command -v fish | sudo tee -a /etc/shells
sudo chsh -s $(which fish) $USER

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install lilyball/nix-env.fish

nvim --headless +PaqInstall
