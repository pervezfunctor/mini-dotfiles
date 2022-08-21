# Installation

If you are only interested in `zsh` configuration, just link or copy zshrc from this repo to ~/.zshrc

```bash
  git clone https://github.com/pervezfunctor/mini-dotfiles.git ~/.config/mini-seartipy
  rm -f ~/.zshrc
  ln -s ~/.config/mini-seartipy/zshrc ~/.zshrc
```

If you want to install essential software for development and have a nice zsh configuration, please do the following.
Note that your current zshrc configuration(`~/.zshrc`) will be deleted.

```bash
  git clone https://github.com/pervezfunctor/mini-dotfiles.git ~/.config/mini-seartipy
  bash ~/.config/mini-seartipy/setup
```

If you want nodejs installation, along with pnpm, you can run the following commands.

```bash
  git clone https://github.com/pervezfunctor/mini-dotfiles.git ~/.config/mini-seartipy
  bash ~/.config/mini-seartipy/pnpm-setup
```

Above command installs latest nodejs version. If you want a different version, you could use [pnpm's env](https://pnpm.io/cli/env) command.
