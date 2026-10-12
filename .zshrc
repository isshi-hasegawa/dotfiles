# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# 開発ツール（導入済みの場合のみ初期化）
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi
[[ ! -r "$HOME/.vite-plus/env" ]] || source "$HOME/.vite-plus/env"

# Claude Codeの環境変数ファイル（内容はリポジトリに含めない）
export CLAUDE_ENV_FILE="$HOME/.claude_env.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Ctrl+]：ghq管理のリポジトリを検索して移動
function peco-src() {
  local selected_dir
  if selected_dir=$(ghq list -p | peco --query "$LBUFFER") && [[ -n "$selected_dir" ]]; then
    BUFFER="cd -- ${(q)selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
# Ctrl+R：新しい順に履歴を検索
function peco-select-history() {
  local selected_command
  if selected_command=$(fc -rl -n 1 | peco --query "$LBUFFER") && [[ -n "$selected_command" ]]; then
    BUFFER="$selected_command"
    CURSOR=$#BUFFER
  fi
  zle clear-screen
}
if (( $+commands[ghq] && $+commands[peco] )); then
  zle -N peco-src
  bindkey '^]' peco-src
fi
if (( $+commands[peco] )); then
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi
