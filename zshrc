HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

autoload -Uz compinit
compinit

dir_exists() {
    [[ -d "$1" ]]
}

file_exists() {
     [[ -f "$1" ]]
}

has_cmd() {
    command -v "$1" > /dev/null
}

dir_exists ~/.zsh/pure || git clone --depth=1 https://github.com/sindresorhus/pure.git ~/.zsh/pure

fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure

if file_exists /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    dir_exists ~/.zsh/zsh-syntax-highlighting || git clone --depth=1  https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if file_exists /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    dir_exists ~/.zsh/zsh-syntax-highlighting || git clone --depth=1  https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if file_exists /usr/share/doc/fzf/examples/key-bindings.zsh; then
    source /usr/share/doc/fzf/examples/completion.zsh
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

has_cmd fasd && eval "$(fasd --init auto)"

# pnpm
if dir_exists "$HOME/.local/share/pnpm"; then
    export PNPM_HOME="$HOME/.local/share/pnpm"
    export PATH="$PNPM_HOME:$PATH"

    # tabtab source for packages
    # uninstall by removing these lines
    [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
fi
# pnpm end
