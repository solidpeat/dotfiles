#!/bin/bash

# homebrewのアップデート
brew update
# formulaのアップデート
brew upgrade

# formulaのインストール
brew install vim --with-luajit
brew install zsh --disable-etcdir
brew install tmux
brew install git
brew install hub
brew install tig
brew install git-flow
brew install mercurial
brew install gibo # .gitignore boilerplates
brew install tree
brew install android-sdk
brew install mono
brew install plantuml
brew install jq
brew install mysql

# homebrew-caskのインストール
brew tap caskroom/cask
brew tap caskroom/versions
brew install brew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# caskでのインストール
brew cask install iterm2
brew cask install google-chrome
brew cask install firefox-ja
brew cask install thunderbird-ja

brew cask install coteditor
brew cask install unity
brew cask install unity-web-player
brew cask install coda
brew cask install mamp
brew cask install sequel-pro
brew cask install rdm
brew cask install eclipse-java
brew cask install virtualbox
brew cask install vagrant

brew cask install dropbox
brew cask install skype
brew cask install evernote
brew cask install skitch
brew cask install notational-velocity
brew cask install bettertouchtool
brew cask install clipmenu
brew cask install appcleaner

brew cask install java # デフォルトで入ってない？android-sdkを使うために必要
brew cask install xquartz # for ricty

# フォントのインストール
brew tap sanemat/font
brew install ricty
brew tap caskroom/fonts
brew cask install font-source-code-pro

# MacVim-KaoriYaのインストール
# Building · splhack/macvim-kaoriya Wiki
# https://github.com/splhack/macvim-kaoriya/wiki/Building
brew tap splhack/homebrew-splhack
brew install gettext-mk lua lua51 luajit python3 ruby
brew install --HEAD macvim-kaoriya
brew linkapps macvim-kaoriya

# ASP.NET環境
brew tap aspnet/dnx
brew install dnvm
