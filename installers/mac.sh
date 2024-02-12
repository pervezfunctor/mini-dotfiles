#! /usr/bin/env bash

{

source <(curl -s https://raw.githubusercontent.com/pervezfunctor/mini-dotfiles/master/scripts/utils)

main() {
    brew_install
    dotfiles_install

    slog "Installing Essential packages"

    brew install curl wget trash-cli tree fzf ripgrep tmux pkg-config urlview
    brew install neovim zsh zsh-syntax-highlighting zsh-autosuggestions fd-find
    brew install unar unzip p7zip zoxide ShellCheck git-extras zip gawk
    brew install python3-pip python3-wheel python3-virtualenv sqlite-devel gh

    slog "Essential packages installation done!"

    slog "Installing C++"

    brew install cmake gcc gdb valgrind systemtap ltrace strace
    brew install gcc-c++ clang clang-devel clang-tools-extra clang-libs
    brew install boost boost-devel boost-static catch-devel
    brew install clang-analyzer lldb lld llvm llvm-devel
    brew install doxygen graphviz ccache cppcheck pre-commit


    slog "C++ installation done!"

    zsh_config_install
    tmux_config_install
}

is_mac || err_exit "This script works only on macos. Quitting."

bootstrap "Fedora/RockyLinux setup"

}
