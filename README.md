# dotfiles

macOS向けの最小限の設定です。zshの履歴保存・検索と、履歴に基づく入力予測を利用します。プロンプトの見た目は変更しません。

## 管理する設定

- `.zshenv`: 全zsh共通のPATH。Homebrew、pnpm、Docker、Supabase CLI、Vite+
- `.zprofile`: ログイン時のブラウザ、エディタ、ページャー、言語
- `.zshrc`: 履歴、入力予測
- `.bash_profile`: bash用のDocker・Supabase・JavaScript環境
- `.config/git/ignore`: グローバルGit ignore
- `.config/karabiner/`: キーボード設定

Prezto、Powerlevel10k、Starship、pecoによる検索は使いません。
Ruby／Rails・tmuxのシェル設定とElixirのバージョン指定も削除しています。

## セットアップ

```sh
brew install git zsh-autosuggestions supabase/tap/supabase
git clone https://github.com/isshi-hasegawa/dotfiles.git ~/src/github.com/isshi-hasegawa/dotfiles
cd ~/src/github.com/isshi-hasegawa/dotfiles
./install.sh
exec zsh -l
```

`install.sh`は管理対象のファイルだけをリンクし、`.config`全体を置き換えません。
既存のファイル・リンクは必要なときだけバックアップし、すでに同じ設定なら何もしません。
管理対象外のアプリ設定はそのまま残ります。
以前のPrezto設定から移行する場合は、Preztoを参照する `~/.zlogin` と `~/.zlogout` もバックアップして外してください。

Node.jsとJavaScriptの依存関係はVite+で管理します。pnpmは現在の専用インストールを利用します。
macOSのログイン処理後もVite+のNode.js・npmを優先します。古いグローバルnpmは使いません。
Supabase CLIはHomebrewで管理します。更新は `brew upgrade supabase/tap/supabase` で行います。
HomebrewはGit・GitHub CLI・入力予測などの共通ツールに利用し、miseは使いません。

## 履歴と入力予測

履歴は `~/.zsh_history` に最大10,000件保存し、シェル間で共有します。
`↑`で履歴をたどり、`Ctrl+R`で検索できます。
入力中に履歴から候補が表示され、行末で`→`を押すと取り込めます。
入力予測はHomebrewの `zsh-autosuggestions` が導入されている場合だけ有効になります。

## Gitの個人設定

`.gitconfig`は管理対象外です。

```sh
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
