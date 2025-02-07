set fish_greeting ""

set -gx TERM xterm-256color
set -Ux XDG_CONFIG_HOME $HOME/.config
# alias 
alias c clear
alias gc "git clone"
alias vim nvim
alias ff fastfetch
alias lg lazygit
alias show "defaults write com.apple.finder CreateDesktop true && killall Finder"
alias hide "defaults write com.apple.finder CreateDesktop false && killall Finder"
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"


# proxy 
set -x https_proxy http://127.0.0.1:7890
set -x http_proxy http://127.0.0.1:7890
