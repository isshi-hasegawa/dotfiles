# ログイン時の基本環境。
[[ "$OSTYPE" != darwin* ]] || export BROWSER='open'
export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-$EDITOR}"
export PAGER="${PAGER:-less}"
export LANG="${LANG:-en_US.UTF-8}"
