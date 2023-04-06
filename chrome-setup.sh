#! /usr/bin/env bash

{


has_cmd() {
    command -v "$1" > /dev/null
}

chrome_install() {
  has_cmd google-chrome && return 1

  # Download and install the Google Linux signing key
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

  # Add the Google Chrome repository to the APT sources list
  sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

  # Update the package list
  sudo apt-get update

  # Install Google Chrome
  sudo apt-get install google-chrome-stable
}


installer() {
    chrome_install
}

echo "Installing Chrome..."

rm -f ~/.seartipy-error.log ~/.seartipy-output.log 2> /dev/null
installer > >(tee ~/.seartipy-output.log) 2> >(tee ~/.seartipy-error.log >&2)

}
