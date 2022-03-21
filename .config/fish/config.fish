source $HOME/.alias

if type -q kubectl
    kubectl completion fish | source
end

# for the homebrew
if test -d /opt/homebrew # check if a directory
    set -x BREW_PATH /opt/homebrew
    fish_add_path $BREW_PATH/bin
    fish_add_path $BREW_PATH/sbin
end

# for fzf
fish_add_path /home/mzk/.fzf/bin
set -U FZF_LEGACY_KEYBINDINGS 0

# for asdf
if test -d $HOME/.asdf
    source ~/.asdf/asdf.fish
end

# for go
set -x GOPATH "$HOME/Works"
set -x PATH $GOPATH/bin $PATH

# for direnv
eval (direnv hook fish)

# for powerline

set -x POWERLINE_PATH (pip show powerline-status | grep Location | string trim -c "Location: ")"/powerline"

set fish_function_path $fish_function_path "$POWERLINE_PATH/bindings/fish"
powerline-setup

function fish_right_prompt -d 'Write out the right prompt'
    date '+%H:%M:%S'
end

# function fish_prompt
#     powerline-shell --shell bare $status
# end

# source (which gcloud | sed -e 's/bin\/gcloud//g')path.fish.inc

# for the jdk
if test -f /opt/homebrew/opt/openjdk/bin/java
    fish_add_path /opt/homebrew/opt/openjdk/bin
    set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"
end

# for gcloud
alias fgc=fzf_gcloud_config
alias fga=fzf_gcloud_auth
alias gssh=fzf_gcloud_ssh
alias fssh=fzf_ssh
