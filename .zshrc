# 対話シェルでmiseのバージョン切り替えを有効にする。
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi

# mise初期化後も、従来のpnpm・Vite+の優先順を保つ。
[[ ! -r "$HOME/.vite-plus/env" ]] || source "$HOME/.vite-plus/env"
path=("$PNPM_HOME" $path)
