#source $HOME/.alias

# Add `~/Works/bin` to the `$PATH`
export GOPATH="$HOME/Works"
export PATH="$PATH:$GOPATH/bin"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export POWERLINE_PATH="`pip show powerline-status | grep Location | sed -e 's/Location: //g'`/powerline"
. $POWERLINE_PATH/bindings/bash/powerline.sh

eval "$(direnv hook bash)"

# for ssh auto open tmux
SESSION_NAME=tmux

if [[ -z "$TMUX" && -n "$SSH_TTY" ]] && type tmux >/dev/null 2>&1; then
  option=""
  if tmux has-session -t ${SESSION_NAME}; then
    option="attach -t ${SESSION_NAME}"
  else
    option="new -s ${SESSION_NAME}"
  fi  
  tmux $option && exit
fi

