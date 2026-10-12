# Docker Desktop
case ":$PATH:" in
  *":$HOME/.docker/bin:"*) ;;
  *) export PATH="$PATH:$HOME/.docker/bin" ;;
esac

# JavaScript環境
[[ ! -r "$HOME/.vite-plus/env" ]] || source "$HOME/.vite-plus/env"
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
