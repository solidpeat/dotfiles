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
  git submodule update --init
fi

# homebrewのインストール
if ! enabled brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew doctor

# brew doctorの結果を見てセットアップ作業を続けるか選択
echo -n "continue ? [y/N] "
read ANS
if [ "$ANS" != "y" ]; then
  exit 1
fi

# brew install
sh $DOTFILESDIR/Brewfile.sh

# エイリアス作成
dotalias .vim
dotalias .vimrc
dotalias .zshrc
dotalias .zshenv
dotalias .tmux.conf
dotalias .gitconfig
# diff-highlightへのシンボリックリンク
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
