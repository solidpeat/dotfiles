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

# homebrew用
export PATH="/usr/local/sbin:$PATH"
# MacVim-KaoriYa用
export PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
alias vim=Vim
alias vi=vim
# homebrew-cask用
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# Mono用
export MONO_GAC_PREFIX="/usr/local"
# DNVM用
source dnvm.sh
export MONO_MANAGED_WATCHER=disabled
# Composer用
export PATH="$PATH:$HOME/.composer/vendor/bin"

# --------------------------------------------------
# プロンプト
# --------------------------------------------------

PROMPT="
%{${fg[green]}%}[%n@%m] %~%{${reset_color}%}
%{${fg[green]}%}%# %{${reset_color}%}"

# --------------------------------------------------
# コマンド
# --------------------------------------------------

# カレントディレクトリをUnityプロジェクトとして開く
# MacOSX - Macのターミナルからunityを起動する - Qiita
# http://qiita.com/kesera/items/67169850d3e58f0e3d40
alias unity='/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath "`pwd`" &'
