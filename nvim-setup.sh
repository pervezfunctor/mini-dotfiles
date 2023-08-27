#! /usr/bin/env bash

{


has_cmd() {
    command -v "$1" > /dev/null
}

neovim_install() {
  has_cmd brew || return -1
  has_cmd pnpm || return -1
  has_cmd pip || return -1
  has_cmd cargo || return -1

  has_cmd go || brew install golang

  sudo update-locale LANG=en_US.UTF8
  brew install neovim lazygit bottom
  sudo apt-get install -y  python3 python-pip luarocks xclip xsel

  pnpm install -g neovim
  pip install --user neovim
  cargo install treesitter-cli
}

installer() {
    neovim_install
}

echo "Installing neovim..."
rm -f ~/.seartipy-error.log ~/.seartipy-output.log 2> /dev/null
installer > >(tee ~/.seartipy-output.log) 2> >(tee ~/.seartipy-error.log >&2)
echo "Installing neovim done."
}
