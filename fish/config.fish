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
alias cc "ccusage blocks --live"
# alias ide='tmux split-window -h -d -l 25%; tmux split-window -v -l 20%; tmux split-window -h -l 50%'
alias ide='tmux split-window -v -l 20%; tmux split-window -h -l 50%'
alias dev='npm run dev'
alias build='npm run build'

# proxy 
set -x https_proxy http://127.0.0.1:7890
set -x http_proxy http://127.0.0.1:7890

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/anaconda3/bin $PATH
    end
end
# <<< conda initialize <<<
