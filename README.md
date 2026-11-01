# coder_dotfiles

Coder のワークスペースに適用する自分用の設定です。
ワークスペース作成時の「Dotfiles URL」にこのリポジトリを指定すると、起動のたびに `install.sh` が実行されます。

```
https://github.com/haoling/coder_dotfiles.git
```

## rcfiles

[haoling/rcfiles](https://github.com/haoling/rcfiles) を `~/.rcfiles` に clone (2回目からは pull) し、`ln_rcfiles.sh` を実行します。
git の名前・署名鍵は rcfiles の `.gitconfig_rcfiles` の設定 (個人用) をそのまま使います。

## aws 補完

`zsh/aws_completion.zsh` を `~/.zshrc` から読み込みます。
aws があるかはシェル起動時に調べるので、後から aws を入れても補完が効きます。
