# コマンド検索パス。再読み込みしても重複させない。
typeset -gU path
if [[ -d /opt/homebrew/bin ]]; then
  path=(/opt/homebrew/bin /opt/homebrew/sbin /usr/local/bin /usr/local/sbin $path)
else
  path=(/usr/local/bin /usr/local/sbin $path)
fi
export PNPM_HOME="$HOME/Library/pnpm"
path=("$PNPM_HOME" $path)
[[ ! -d "$HOME/.docker/bin" ]] || path+=("$HOME/.docker/bin")
export PATH

# 非対話シェルでも開発ツールを利用できるようにする。
[[ ! -r "$HOME/.vite-plus/env" ]] || source "$HOME/.vite-plus/env"
path=("$PNPM_HOME" $path)
export CLAUDE_ENV_FILE="$HOME/.claude_env.sh"
