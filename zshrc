HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

fpath+=($HOME/.zsh/pure)

[ -d ~/.zsh/pure ] && git clone --depth=1 https://github.com/sindresorhus/pure.git ~/.zsh/pure
[ -d ~/.zsh/zsh-syntax-highlighting ] &&  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
[ -d ~/.zsh/zsh-autosuggestions ] && git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

autoload -U promptinit; promptinit
prompt pure

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
