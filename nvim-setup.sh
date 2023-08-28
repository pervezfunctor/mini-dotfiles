#! /usr/bin/env bash

{


has_cmd() {
    command -v "$1" > /dev/null
}

neovim_install() {
  has_cmd brew || return -1
  has_cmd pnpm || return -1
  has_cmd cargo || return -1

  has_cmd pip || sudo apt-get install -y python3-pip
  has_cmd go || brew install golang

  sudo update-locale LANG=en_US.UTF8
  brew install neovim lazygit bottom
  sudo apt-get install -y luarocks gdu

  pnpm install -g neovim
  pip install neovim
  cargo install tree-sitter-cli
}

astronvim_install() {
  trash ~/.config/nvim

  trash ~/.local/share/nvim ~/.local/share/nvim.bak
  trash ~/.local/state/nvim ~/.local/state/nvim.bak
  trash ~/.cache/nvim ~/.cache/nvim.bak

  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

  git clone https://github.com/pervezfunctor/astronvim-config.git  ~/.config/nvim/lua/user
}

installer() {
    neovim_install
}

echo "Installing neovim..."
rm -f ~/.seartipy-error.log ~/.seartipy-output.log 2> /dev/null
installer > >(tee ~/.seartipy-output.log) 2> >(tee ~/.seartipy-error.log >&2)
echo "Installing neovim done."
}

