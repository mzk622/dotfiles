source ~/.alias

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

if [test -f $HOME/.anyenv/bin]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
fi
