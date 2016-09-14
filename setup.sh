#!/bin/bash

# Bash - シェルスクリプトを書くときはset -euしておく - Qiita
# http://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -eu

# dotfilesディレクトリ
DOTFILESDIR=$HOME/dotfiles

# コマンドがインストールされてるか確認
enabled() { type $1 > /dev/null 2>&1; }
require() { if ! enabled $1; then echo "Please install $1."; exit 1; fi }
# エイリアスを作成
dotalias() { if ! [ -L $HOME/$1 ]; then ln -s $DOTFILESDIR/$1 $HOME/$1; fi }

require git

# dotfilesのリポジトリをクローン
if ! [ -d $DOTFILESDIR ]; then
  git clone https://github.com/solidpeat/dotfiles.git $DOTFILESDIR
  cd $DOTFILESDIR
  # NeoBundle
  git submodule update --init
  # remote-urlをSSHに変更
  git remote set-url origin git@github.com:solidpeat/dotfiles.git
fi

# homebrewのインストール
if ! enabled brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  # brew doctorの結果を見てセットアップ作業を続けるか選択
  echo -n "continue ? [y/N] "
  read ANS
  if [ "$ANS" != "y" ]; then
    exit 1
  fi
fi

# brew install
brew install rcmdnk/file/brew-file
dotalias .brewfile
brew file install

# エイリアス作成
dotalias .vim
dotalias .vimrc
dotalias .zshrc
dotalias .zshenv
dotalias .tmux.conf
dotalias .gitconfig
dotalias .composer
dotalias .editorconfig
dotalias .mackup.cfg
# diff-highlightへのシンボリックリンク
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
# anyenvインストール
git clone https://github.com/riywo/anyenv $HOME/.anyenv
