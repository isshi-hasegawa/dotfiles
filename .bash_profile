# Apple Silicon版Homebrewを優先する。
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# JavaScript環境
[[ ! -r "$HOME/.vite-plus/env" ]] || source "$HOME/.vite-plus/env"
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
