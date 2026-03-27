# dotfiles

シンプルで最小限のdotfiles設定

## 環境

- macOS
- zsh (Prezto + Powerlevel10k)
- mise (バージョン管理)

## 含まれるファイル

- `.zshrc` - zsh設定
- `.bash_profile` - bash設定
- `.default-npm-packages` - miseでNode.jsインストール時にグローバルインストールするパッケージ

## セットアップ

### 1. 必要なツールのインストール

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 必要なパッケージ
brew install mise git ghq peco starship tig jq tree
brew install zsh-autosuggestions zsh-completions zsh-syntax-highlighting

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### 2. dotfilesの適用

```bash
# リポジトリをクローン
ghq get https://github.com/isshi-hasegawa/dotfiles

# シンボリックリンクを作成
ln -sf ~/src/github.com/isshi-hasegawa/dotfiles/.zshrc ~/.zshrc
ln -sf ~/src/github.com/isshi-hasegawa/dotfiles/.bash_profile ~/.bash_profile

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

### ghq + peco

- `Ctrl + ]`: ghq管理下のリポジトリを検索して移動
- `Ctrl + r`: コマンド履歴を検索

### エイリアス・ツール

- `git`, `ghq`, `tig`: Git関連
- `jq`: JSON processor
- `peco`: インタラクティブフィルタリング
- `tree`: ディレクトリツリー表示
- `starship`: モダンなプロンプト

## インストールするnpmパッケージ

`.default-npm-packages`に記載されたパッケージが、Node.js インストール時に自動的にグローバルインストールされます:

- typescript
- ts-node
- typesync
- npm-check-updates
