# ログイン時の基本環境。
# macOSのpath_helperが変更した優先順を、開発ツール優先に戻す。
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
[[ ! -d "$HOME/.vite-plus/bin" ]] || path=("$HOME/.vite-plus/bin" $path)
path=("$PNPM_HOME" $path)

[[ "$OSTYPE" != darwin* ]] || export BROWSER='open'
export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-$EDITOR}"
export PAGER="${PAGER:-less}"
export LANG="${LANG:-en_US.UTF-8}"
