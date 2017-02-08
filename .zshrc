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
if [ -f ~/dotfiles/.zshrc.brew.github.api.token ]; then
  source ~/dotfiles/.zshrc.brew.github.api.token
fi
# tmux上でmasを実行するためのエイリアス
if [ "$TMUX" != "" ];then
  alias mas="reattach-to-user-namespace mas"
fi
# MacVim-KaoriYa用
export PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
alias vim=Vim
alias vi=vim
# homebrew-cask用
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# Mono用
export MONO_GAC_PREFIX="/usr/local"
# AndroidSDK用
export PATH="$PATH:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools"
# Composer用
export PATH="$PATH:$HOME/.composer/vendor/bin"
# anyenv用
if [ -d ${HOME}/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  # tmuxでsystemが優先される問題の対処
  for D in `ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

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
