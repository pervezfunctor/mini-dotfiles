HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

dir_exists() {
    [[ -d "$1" ]]
}

dir_exists ~/.zsh/pure || git clone --depth=1 https://github.com/sindresorhus/pure.git ~/.zsh/pure

fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

eval "$(fasd --init auto)"

# pnpm
export PNPM_HOME="/home/pervez/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
