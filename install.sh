#!/bin/bash -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IGNORE_PATTERN="^\.(git)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "🚀 dotfiles セットアップを開始します..."
echo "📁 dotfiles ディレクトリ: $DOTFILES_DIR"
echo ""

# バックアップディレクトリの作成
mkdir -p "$BACKUP_DIR"
echo "💾 バックアップディレクトリ: $BACKUP_DIR"
echo ""

# シンボリックリンクの作成
echo "🔗 シンボリックリンクを作成します..."
for dotfile in .??*; do
    # 除外パターンのチェック
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue

    # install.shとREADME.mdはスキップ
    [[ "$dotfile" == ".gitignore" ]] && continue

    source_file="$DOTFILES_DIR/$dotfile"
    target_file="$HOME/$dotfile"

    # 既存ファイルのバックアップ
    if [ -e "$target_file" ] && [ ! -L "$target_file" ]; then
        echo "  📦 バックアップ: $dotfile"
        mv "$target_file" "$BACKUP_DIR/"
    fi

    # シンボリックリンクの作成
    ln -snfv "$source_file" "$target_file"
done

echo ""
echo "✅ セットアップが完了しました！"
echo ""
echo "📝 次のステップ:"
echo "  1. 新しいシェルを起動: exec zsh -l"
echo "  2. 必要なツールのインストール: brew install git zsh-autosuggestions"
echo ""
