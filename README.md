# Installation

For installing essential software for development run the following

```bash
  git clone --depth=1 https://github.com/pervezfunctor/mini-dotfiles.git ~/.config/mini-seartipy
  bash ~/.config/mini-seartipy/setup
```

For nodejs installation, along with pnpm, you can run the following commands.

```bash
  bash ~/.config/mini-seartipy/pnpm-setup
```

For installing visual studio code, chrome and edge browsers, run the following
command.

```bash
  bash ~/.config/mini-seartipy/ui-setup
```

If you are interested only in `zsh` configuration, link or copy zshrc from this
repo to ~/.zshrc. No need to run any scripts. For example

```bash
  git clone https://github.com/pervezfunctor/mini-dotfiles.git ~/mini-seartipy
  mv ~/.zshrc ~/.zshrc.bak
  cp ~/mini-seartipy/zshrc ~/.zshrc
  rm -rf ~/mini-seartipy
```

**Note: This repository can also be used
[for devcontainer](https://code.visualstudio.com/docs/remote/containers#_personalizing-with-dotfile-repositories).**
