#source $HOME/.alias

SESSION_NAME=tmux

if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
  option=""
  if tmux has-session -t ${SESSION_NAME}; then
    option="attach -t ${SESSION_NAME}"
  else
    option="new -s ${SESSION_NAME}"
  fi  
  tmux $option && exit
fi

# Add `~/Works/bin` to the `$PATH`
export GOPATH="$HOME/Works"
export PATH="$PATH:$GOPATH/bin"

# for powerline shell
function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

if test -f ~/.anyenv/bin/anyenv ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi
