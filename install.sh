#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR=""

# 管理するファイルだけをリンクし、.config全体は置き換えない。
managed_files=(
  .zshenv .zprofile .zshrc .bash_profile
  .config/git/ignore
  .config/karabiner/karabiner.json
  .config/karabiner/assets/complex_modifications/1667578480.json
)

for relative_path in "${managed_files[@]}"; do
  source_file="$DOTFILES_DIR/$relative_path"
  target_file="$HOME/$relative_path"
  [[ -f "$source_file" ]] || { echo "設定ファイルがありません: $relative_path" >&2; exit 1; }

  # すでに同じファイルを参照していれば何もしない。
  if [[ -e "$target_file" && "$target_file" -ef "$source_file" ]]; then
    continue
  fi

  if [[ -e "$target_file" || -L "$target_file" ]]; then
    if [[ -z "$BACKUP_DIR" ]]; then
      BACKUP_DIR=$(mktemp -d "$HOME/.dotfiles_backup.XXXXXX")
    fi
    mkdir -p "$BACKUP_DIR/$(dirname "$relative_path")"
    mv "$target_file" "$BACKUP_DIR/$relative_path"
  fi

  mkdir -p "$(dirname "$target_file")"
  ln -s "$source_file" "$target_file"
  echo "設定をリンク: $relative_path"
done

[[ -z "$BACKUP_DIR" ]] || echo "既存設定のバックアップ: $BACKUP_DIR"
echo "セットアップ完了。新しいシェルを起動してください: exec zsh -l"
echo "必要なツール: brew install git zsh-autosuggestions supabase/tap/supabase"
