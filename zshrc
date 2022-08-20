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

file_exists /etc/zsh_command_not_found && source /etc/zsh_command_not_found

if file_exists /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    dir_exists ~/.zsh/zsh-syntax-highlighting || git clone --depth=1  https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if file_exists /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    dir_exists ~/.zsh/zsh-autosuggestions || git clone --depth=1  https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if file_exists /usr/share/doc/fzf/examples/key-bindings.zsh; then
    source /usr/share/doc/fzf/examples/completion.zsh
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

dir_exists ~/.zsh/alias-tips || git clone --depth=1  https://github.com/djui/alias-tips.git ~/.zsh/alias-tips
source ~/.zsh/alias-tips/alias-tips.plugin.zsh

has_cmd fasd && eval "$(fasd --init auto)"

if dir_exists "$HOME/.local/share/pnpm"; then
# pnpm
    export PNPM_HOME="$HOME/.local/share/pnpm"
    export PATH="$PNPM_HOME:$PATH"
# pnpm end

    # tabtab source for packages
    # uninstall by removing these lines
    [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

    alias n='pnpm'
    alias ni='pnpm install'
    alias ne='pnpm exec'
    alias nd='pnpm dev'
    alias nt='pnpm types'
    alias nc='pnpm ci'
    alias ntt='pnpm test'
    alias ntt='pnpm test'
fi


alias g='git'
alias gst="git status"
alias gsu="git status -u"
alias gcan="git commit --amend --no-edit"
alias gsa='git stash apply'
alias gfm='git pull'
alias gp='git push'
alias gcm='git commit --message'
alias gia='git add'
alias gl='git log --topo-order --pretty=format:"$_git_log_medium_format"'
alias gco='git checkout'
alias gb='git branch'
alias gbc='git checkout -b'
alias gbc='git checkout -b'
alias gsl='git stash list'

if has_cmd code; then
    alias c='code'
    alias c.='code .'
fi
