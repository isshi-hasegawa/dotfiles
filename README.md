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
  - `starship.toml` - Starshipプロンプト設定

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
source ~/.zshrc
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
