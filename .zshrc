# --------------------------------------------------
# 基本設定
# --------------------------------------------------

# 文字コード
export LANG=ja_JP.UTF-8

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 色を使用出来るようにする
autoload -Uz colors
colors

# homebrew-cask用
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# --------------------------------------------------
# プロンプト
# --------------------------------------------------

PROMPT="
%{${fg[green]}%}[%n@%m] %~%{${reset_color}%}
%{${fg[green]}%}%# %{${reset_color}%}"
