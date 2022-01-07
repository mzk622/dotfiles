source $HOME/.alias

# for the homebrew
set -x BREW_PATH /opt/homebrew
set -x PATH $BREW_PATH/bin $PATH

# for fzf
set -x PATH /home/mzk/.fzf/bin $PATH
set -U FZF_LEGACY_KEYBINDINGS 0

# for anyenv
if test -f $HOME/.anyenv/bin/anyenv
    set -x PATH $HOME/.anyenv/bin $PATH
end
anyenv init - fish | source

# for go
set -x GOPATH "$HOME/Works"
set -x PATH $GOPATH/bin $PATH

# for direnv
eval (direnv hook fish)

# for powerline-shell
function fish_prompt
    powerline-shell --shell bare $status
end

# source (which gcloud | sed -e 's/bin\/gcloud//g')path.fish.inc

# for the flutter
set -x FLUTTER_PATH $HOME/Works/flutter
set -x PATH $FLUTTER_PATH/bin $PATH

# for the jdk
if test -f /opt/homebrew/opt/openjdk/bin/java
    fish_add_path /opt/homebrew/opt/openjdk/bin
    set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"
end

# for gcloud
alias gctx=fzf_gcloud_config
alias gssh=fzf_gcloud_instance
