source ~/.alias

# for the homebrew
set -x BREW_PATH /opt/homebrew
set -x PATH $BREW_PATH/bin $PATH

# for fzf
set -x PATH /home/mzk/.fzf/bin $PATH
set -U FZF_LEGACY_KEYBINDINGS 0

# for anyenv
set -x PATH $HOME/.anyenv/bin $PATH
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

source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc'

# for the flutter
set -x FLUTTER_PATH "$HOME/Works/flutter"
set -x PATH $FLUTTER_PATH/bin $PATH

# for the jdk 
fish_add_path /opt/homebrew/opt/openjdk/bin
 set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"

# for gcloud
alias gctx=__fzf_gcloud_config
alias gssh=__fzf_gcloud_instance
