#! /usr/bin/env bash

{

has_cmd() {
    command -v "$1" > /dev/null
}

emacs_install() {
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
  mv ~/.config/doom ~/.config/doom.backup
  git clone pervezfunctor/doomemacs-config doom
  sudo update-locale LANG=en_US.UTF8

  sudo apt-get install -y  emacs-nox
}

installer() {
    emacs_install
}

echo "Installing emacs..."
rm -f ~/.seartipy-error.log ~/.seartipy-output.log 2> /dev/null
installer > >(tee ~/.seartipy-output.log) 2> >(tee ~/.seartipy-error.log >&2)
echo "Installing emacs done."
}
