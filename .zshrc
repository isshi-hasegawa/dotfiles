# 履歴を保存し、複数のシェル間で共有する。
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_SAVE_NO_DUPS

# 標準の履歴検索。予測候補は右矢印で取り込む。
bindkey -e
bindkey '^R' history-incremental-search-backward

# Homebrew版の入力予測だけを読み込む。
for autosuggestions_file in \
  "${HOMEBREW_PREFIX:-/usr/local}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh; do
  if [[ -r "$autosuggestions_file" ]]; then
    ZSH_AUTOSUGGEST_STRATEGY=(history)
    source "$autosuggestions_file"
    break
  fi
done
unset autosuggestions_file
