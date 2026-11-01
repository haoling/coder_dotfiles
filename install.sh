#!/bin/sh
# Coder のワークスペース起動時に `coder dotfiles` から実行される
# 起動のたびに実行されるので、何度実行しても同じ結果になるように書く
set -eu

here=$(cd "$(dirname "$0")" && pwd)

# --- rcfiles ---
# ln_rcfiles.sh は ~/.rcfiles にある前提なので、そこに clone する
RCFILES_URL=https://github.com/haoling/rcfiles.git

if [ -d "$HOME/.rcfiles/.git" ]; then
  git -C "$HOME/.rcfiles" pull --ff-only --quiet || echo "rcfiles を更新できませんでした。前回の内容で続けます"
else
  git clone --quiet "$RCFILES_URL" "$HOME/.rcfiles"
fi
sh "$HOME/.rcfiles/ln_rcfiles.sh"
echo '. ~/.rcfiles/.zshrc.2line_prompt_1' >> "$HOME/.zshrc"

# --- aws 補完 ---
# aws があるかはシェル起動時に調べるので、後から aws を入れても補完が効く
aws_completion_line=". \"$here/zsh/aws_completion.zsh\""
grep -qxF "$aws_completion_line" "$HOME/.zshrc" 2>/dev/null || echo "$aws_completion_line" >>"$HOME/.zshrc"
