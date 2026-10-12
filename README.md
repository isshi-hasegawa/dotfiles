# dotfiles

macOS向けの最小限の設定です。zshの見た目、補完プラグイン、検索ショートカットは追加しません。

## 管理する設定

- `.zshenv`: 全zsh共通のPATH。Homebrew、pnpm、Docker、miseのshims、Vite+、Claude Codeの環境ファイルの場所
- `.zprofile`: ログイン時のブラウザ、エディタ、ページャー、言語
- `.zshrc`: 対話シェルでのmise初期化
- `.bash_profile`: bash用のDocker PATHとmise初期化
- `.default-npm-packages`: miseでNode.jsを導入するときのグローバルパッケージ
- `.config/git/ignore`: グローバルGit ignore
- `.config/karabiner/`: キーボード設定

Prezto、Powerlevel10k、Starship、pecoによる検索は使いません。
Ruby／Rails・tmuxのシェル設定とElixirのバージョン指定も削除しています。
ツール本体のアンインストールは行いません。
`CLAUDE_ENV_FILE`は `$HOME/.claude_env.sh` を指し、内容はリポジトリに含めません。

## セットアップ

```sh
brew install mise git
git clone https://github.com/isshi-hasegawa/dotfiles.git ~/src/github.com/isshi-hasegawa/dotfiles
cd ~/src/github.com/isshi-hasegawa/dotfiles
./install.sh
exec zsh -l
```

`install.sh`は `.config` などもまとめてリンクします。既存の実ファイルはバックアップされます。
シェルだけを適用する場合は、既存設定をバックアップして `.zshenv`、`.zprofile`、`.zshrc` のみリンクしてください。
以前のPrezto設定から移行する場合は、Preztoを参照する `~/.zlogin` と `~/.zlogout` もバックアップして外してください。

Node.jsなどのバージョンはmiseで指定します。

```sh
mise use -g node@lts
```

## Gitの個人設定

`.gitconfig`は管理対象外です。

```sh
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
