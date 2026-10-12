# Docker Desktop
case ":$PATH:" in
  *":$HOME/.docker/bin:"*) ;;
  *) export PATH="$PATH:$HOME/.docker/bin" ;;
esac

# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate bash)"
fi
