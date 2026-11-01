# aws コマンドの補完
# aws は zsh 用の補完関数を出力できないので、bash 用の aws_completer を bashcompinit で使う
# compinit の後に読み込むこと (rcfiles の .zshrc_rcfiles で compinit している)
if (( $+commands[aws] )); then
  # aws_completer が PATH に無いときは、aws の実体と同じ場所にあるものを使う
  _aws_completer=${commands[aws_completer]:-${commands[aws]:A:h}/aws_completer}
  if [[ -x $_aws_completer ]]; then
    autoload -Uz bashcompinit && bashcompinit
    complete -C "$_aws_completer" aws
  fi
  unset _aws_completer
fi
