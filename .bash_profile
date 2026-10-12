# Docker Desktop
case ":$PATH:" in
  *":$HOME/.docker/bin:"*) ;;
  *) export PATH="$PATH:$HOME/.docker/bin" ;;
esac

# Supabase CLIとJavaScript環境
case ":$PATH:" in
  *":$HOME/.supabase/bin:"*) ;;
  *) export PATH="$HOME/.supabase/bin:$PATH" ;;
esac
[[ ! -r "$HOME/.vite-plus/env" ]] || source "$HOME/.vite-plus/env"
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
