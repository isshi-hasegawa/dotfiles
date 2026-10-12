# dotfiles

シンプルで最小限のdotfiles設定

## 環境

- macOS
- zsh (Prezto + Powerlevel10k)
- mise (バージョン管理)

## 含まれるファイル

- `.zshrc` - zsh設定
- `.zshenv` - zsh環境変数
- `.zpreztorc` - Prezto設定
- `.p10k.zsh` - Powerlevel10k設定
- `.tool-versions` - miseのデフォルトバージョン設定
- `.bash_profile` - bash設定
- `.default-npm-packages` - miseでNode.jsインストール時にグローバルインストールするパッケージ
- `.config/` - アプリケーション設定ディレクトリ
  - `git/ignore` - グローバルGit ignore設定
  - `karabiner/` - Karabinerキーボードカスタマイズ

## セットアップ

### 1. 必要なツールのインストール

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 必要なパッケージ
brew install mise git ghq peco tig jq tree

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

### 2. dotfilesの適用

```bash
# リポジトリをクローン
ghq get https://github.com/isshi-hasegawa/dotfiles

# または直接クローン
git clone https://github.com/isshi-hasegawa/dotfiles.git ~/src/github.com/isshi-hasegawa/dotfiles

# インストールスクリプトを実行（自動的にシンボリックリンクを作成）
cd ~/src/github.com/isshi-hasegawa/dotfiles
./install.sh

# 設定を反映
exec zsh -l
```

### 3. miseでNode.jsをインストール

```bash
# 最新のLTSバージョンをインストール
mise use -g node@lts

# または特定のバージョン
mise use -g node@20
```

## 主な設定

### mise

Node.jsやその他の言語バージョンを管理

### Prezto + Powerlevel10k

- モダンで高速なzshフレームワーク
- 美しいプロンプト表示
- 豊富なモジュール（git、syntax-highlighting、autosuggestions等）

### ghq + peco

- `Ctrl + ]`: ghq管理下のリポジトリを検索して移動
- `Ctrl + r`: コマンド履歴を検索

### エイリアス・ツール

- `git`, `ghq`, `tig`: Git関連
- `jq`: JSON processor
- `peco`: インタラクティブフィルタリング
- `tree`: ディレクトリツリー表示

## デフォルトでインストールされるnpmパッケージ

`.default-npm-packages`に記載されたパッケージが、Node.js インストール時に自動的にグローバルインストールされます:

- typescript
- ts-node
- typesync
- npm-check-updates

## アンインストール

シンボリックリンクを削除する場合:

```bash
# 個別に削除
unlink ~/.zshrc
unlink ~/.bash_profile
# ... 他のファイルも同様に

# または、バックアップから復元
# install.sh実行時に作成されたバックアップディレクトリから復元できます
```

## シェル設定の役割

- `.zshrc`: PATH、開発ツールの初期化、プロンプト、検索ショートカット
- `.zshenv`: 非ログインシェルで必要な場合に `.zprofile` を読み込む
- `.zpreztorc`: Preztoの有効なモジュールとオプション
- `.p10k.zsh`: Powerlevel10kの表示設定。プロンプトはこれに統一
- `.bash_profile`: bash用のDocker PATHとmise初期化

mise、Vite+、ghq、pecoは導入されている場合だけ初期化します。
`Ctrl+]`は空白を含むリポジトリパスに対応し、`Ctrl+R`はzshの履歴を新しい順に検索します。
検索をキャンセルした場合は入力中のコマンドを保ちます。
`CLAUDE_ENV_FILE`は `$HOME/.claude_env.sh` を指します。ファイルの内容は管理対象外です。

既存のMacでは、ホームの設定ファイルがPrezto配下にリンクされている場合があります。
リポジトリの設定が使われているかは `ls -l ~/.zshrc ~/.zshenv ~/.zpreztorc ~/.p10k.zsh` で確認できます。
`install.sh`は `.config` などもまとめて置き換えるため、zshの設定だけを反映する場合は、
既存ファイルをバックアップして必要なファイルだけリンクしてください。
`.zprofile`はこのリポジトリに含めていません。既存のPreztoのログイン設定を利用します。

## カスタマイズ

### Powerlevel10kの再設定

```bash
p10k configure
```

### Gitの個人設定

`.gitconfig`は個人情報を含むため、このリポジトリには含まれていません。
以下のコマンドで設定してください:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
