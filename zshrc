HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt EXTENDED_GLOB
setopt AUTO_MENU            # Show completion menu on a successive tab press.
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.

autoload -Uz compinit
compinit

zstyle ':completion:::::default' menu select

dir_exists() {
    [[ -d "$1" ]]
}

file_exists() {
    [[ -f "$1" ]]
}

has_cmd() {
    command -v "$1" > /dev/null
}

ssource() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

dir_exists ~/.zsh/pure || git clone --depth=1 https://github.com/sindresorhus/pure.git ~/.zsh/pure

fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure

ssource /etc/zsh_command_not_found

if file_exists /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    if ! dir_exists ~/.zsh/zsh-syntax-highlighting; then
        git clone --depth=1  https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
    fi
    ssource ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if file_exists /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    if ! dir_exists ~/.zsh/zsh-autosuggestions; then
        git clone --depth=1  https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    fi
    ssource ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

ssource /usr/share/doc/fzf/examples/completion.zsh
ssource /usr/share/doc/fzf/examples/key-bindings.zsh

dir_exists ~/.zsh/alias-tips || git clone --depth=1  https://github.com/djui/alias-tips.git ~/.zsh/alias-tips
ssource ~/.zsh/alias-tips/alias-tips.plugin.zsh

if has_cmd fasd; then
    eval "$(fasd --init auto)"
elif has_cmd zoxide; then
    eval "$(zoxide init zsh)"
fi

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
    alias nid='pnpm install -D'
    alias nb='pnpm build'
    alias nl='pnpm lint:dev'
    alias ne='pnpm exec'
    alias nd='pnpm dev'
    alias nc='pnpm ci'
    alias nt='pnpm types:dev'
    alias ntt='pnpm test:dev'
    alias nci='pnpm types && pnpm lint'
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

alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
alias sl='ls'            # Correction for common spelling error.

alias si = sudo nala install
alias su = sudo nala update && sudo nala upgrade -y
alias ss = nala search

# imwheel -b "4 5" > /dev/null 2>&1

ssource "$HOME/.cargo/env"

file_exists /home/linuxbrew/.linuxbrew/bin/brew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export PATH=$PATH:/usr/local/go/bin
export DOTNET_ROOT=$HOME/.dotnet

# export DOCKER_HOST=unix:///run/user/1000/docker.sock
export PATH=/usr/bin:$PATH
